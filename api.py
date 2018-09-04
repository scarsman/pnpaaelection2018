from flask import Flask, abort, render_template,request, send_file, jsonify,url_for,redirect, make_response

from flask_wtf.csrf import CSRFProtect
from flask_jwt_extended import (
    JWTManager, jwt_required, create_access_token,
    jwt_refresh_token_required, create_refresh_token,
    get_jwt_identity, set_access_cookies,
    set_refresh_cookies, unset_jwt_cookies,get_csrf_token
)


from orator import DatabaseManager
from config import *

import random

import json
import ujson
import uuid
import hashlib
import datetime

from Crypto.PublicKey import RSA
from asymmetric import *
from vigenere import Vigenere

db = DatabaseManager(DATABASES)
v = Vigenere(SHIFT_BLOCK, ALPHABET)

app = Flask(__name__)
app.secret_key = SECRET_KEY
csrf = CSRFProtect(app)

app.config['STATIC_PATH'] = CANDIDATES_IMAGE_DIRECTORY
app.config['JWT_TOKEN_LOCATION'] = ['cookies','query_string']
app.config['JWT_QUERY_STRING_NAME'] = 'token'
app.config['JWT_ACCESS_COOKIE_PATH'] = '/api/'
app.config['JWT_REFRESH_COOKIE_PATH'] = '/token/refresh'
app.config['JWT_COOKIE_CSRF_PROTECT'] = True
app.config['JWT_SECRET_KEY'] = SECRET_KEY
jwt = JWTManager(app)


@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


@app.route("/")
def default():
    return "Election Page";

@app.route("/api/stats")
@jwt_required
def stats():

    current_user = get_jwt_identity()
    access_token = create_access_token(identity=current_user)
    return render_template("stats.html",token=access_token)

@app.route('/login', methods=["GET"])
def login():
    return render_template('login.html')

@app.route('/token/auth', methods=['GET','POST'])
@csrf.exempt
def auth():

    if request.method == 'GET':
        return redirect(url_for('login'))

    data = request.form.to_dict()
    username = data["username"]
    password = data["password"]

    if username != ADMIN_USER or password != ADMIN_PASSWORD:
        return jsonify({'login': False}), 401
    expires = datetime.timedelta(days=1)    
    access_token = create_access_token(identity=username, expires_delta=expires)
    refresh_token = create_refresh_token(identity=username)

    resp = jsonify({
        'access_csrf': get_csrf_token(access_token),
        'refresh_csrf': get_csrf_token(refresh_token),
        'access_token': access_token
    })

    set_access_cookies(resp, access_token)
    set_refresh_cookies(resp, refresh_token)

    return resp, 200
    #return redirect(url_for('stats'))

@app.route('/token/refresh', methods=['POST'])
@jwt_refresh_token_required
@csrf.exempt
def refresh():

    current_user = get_jwt_identity()
    access_token = create_access_token(identity=current_user)

    resp = jsonify({'refresh': True})
    set_access_cookies(resp, access_token)
    return resp, 200

@app.route('/token/remove', methods=['POST'])
@csrf.exempt
def logout():
    
    resp = jsonify({'logout': True})
    unset_jwt_cookies(resp)

    return resp, 200

@app.route("/election/vote", methods=["GET"])
def main():

    user_key = None

    if request.args.get("user_key"):
        user_key = request.args.get('user_key',None)

    user_exist = db.table("voters").where("user_key","=",user_key).limit(1).get().serialize()

    if len(user_exist) == 0:
        abort(403)

    disallowed = db.table("voters").where("user_key","=",user_key).where("voted","=",1).limit(1).get().serialize()

    if len(disallowed) != 0:
        abort(403)

    batch = user_exist[0].batch

    data = db.table("candidate_position") \
        .left_join("candidates","candidate_position.candidate_id","=", "candidates.id") \
        .left_join("positions", "candidate_position.position_id","=", "positions.id") \
        .select("candidate_position.id","candidates.candidate","candidates.uuid","positions.position") \
        .get().serialize()

    candidates = {}

    for i in data:
        #position = v.encrypt(PASSWORD, i.position.lower())
        position = i.position.lower()
        #if batch representative is belong on the election 
        p = position.split(" ")
        if position not in candidates.keys():
            if p[0].isdigit():
                if p[0] == batch:
                    candidates[position] = []
                else:
                    continue
            else:
                candidates[position] = []
                
        #candidates[position].append({i.uuid:v.encrypt(PASSWORD,i.candidate)})
        candidates[position].append({i.uuid:i.candidate})


    return render_template('template.html',data=ujson.dumps(candidates),user_key=user_key)
    #return jsonify(candidates), 200

@app.route('/accomplishment',methods=["GET"])
def accomplishment():

    user_uuid = None

    if request.args.get("user_uuid"):
        user_uuid = request.args.get('user_uuid',None)

    candidate = db.table("candidates").where("uuid","=", user_uuid)

    if candidate is not None:

            image_file = '%s_result.jpg' % user_uuid

            return (send_file('%s/%s' % (app.config['STATIC_PATH'], image_file), mimetype='image/jpg'), 200,{'Access-Control-Allow-Origin': '*'})

    else:
        abort(404)


@app.route("/api/candidates/all")
def candidates():
    try:
        data = db.table("candidate_position") \
            .left_join("candidates","candidate_position.candidate_id","=", "candidates.id") \
            .left_join("positions", "candidate_position.position_id","=", "positions.id") \
            .select("candidates.id","candidates.candidate","positions.position") \
            .get().serialize()

        candidates = {}

        for i in data:
            position = i.position.lower()

            if position not in candidates.keys():
                candidates[position] = []

            candidates[position].append(i.candidate)

        return jsonify(candidates), 200

    except NameError:
        pass

@app.route("/api/candidates/<position>")
def positioncandidates(position):

    try:
        position = position.lower()
        data = db.table("candidate_position") \
            .left_join("candidates","candidate_position.candidate_id","=", "candidates.id") \
            .left_join("positions", "candidate_position.position_id","=", "positions.id") \
            .select("candidates.candidate","positions.position") \
            .where("positions.position","=",position) \
            .get().serialize()

        candidates = []
        result = {}
        for i in data:
            candidates.append(i.candidate)

        result[position] = candidates


        return jsonify(result), 200

    except NameError:
        pass

@app.route("/api/voters/all", methods=["GET"])
@jwt_required
def voters():

    try:
        voted = [0,1]
        batches = [2012,2013,2014,2015,2016,2017]
        count = "false"

        if request.args.get('voted'):
            voted = [request.args.get('voted')]
        if request.args.get('batch'):
            batch = [request.args.get('batch')]
            batch = batch[0].replace(" ","").split(',')
            batches = []            
            for k in batch:
                batches.append(k)

        if request.args.get('count'):
            count = request.args.get('count', count).lower()

        results = {}

        if count == "true":
            c = db.table("voters").where_in("voted",voted).where_in("batch", batches).count()
            return jsonify({"count": c}), 200

        v = db.table("voters").select("nickname","alumni_name","batch","email","voted").where_in("voted",voted).where_in("batch",batches).get().serialize()

        voters = []

        for i in v:
            voters.append(i)

        results["list"] = voters

        return jsonify(results), 200

    except:
        abort(403)
        

@app.route("/api/vote", methods=["GET","POST"])
def vote():

    if request.method == 'GET':
        return "Click the link we emailed to you and vote."

    status = "success"

    try:
        data = request.form.to_dict()
        user_key = data["user_key"]

        disallowed = db.table("voters").where("user_key","=",user_key).where("voted","=",1).limit(1).get().serialize();
        if len(disallowed) != 0 or data["csrf_token"] is None:
            abort(403)

        #enforce vote for position whois active     
        positions = db.table("positions").where("status","=","active").get().serialize()

        del data["csrf_token"]
        del data["user_key"]

        a = []
        b = data.keys()
        c = data.values()

        candidate_id = []

        voted = []

        for i in positions:
            pos = i.position.lower().replace(" ","")
            a.append(pos)
            
        for i in c:
            c_id = db.table("candidates").where("uuid","=",i).limit(1).get().serialize();
            _c = c_id[0]
            candidate_id.append(_c.id)

            voted.append(_c.candidate)
            
        if candidate_id.count(candidate_id[0]) == len(candidate_id):
            print "2 or more values are the same id in one or more positions"
            abort(403)    

        d = list(set(a).intersection(set(b)))

        #force to vote all positions excluding batch representative
        #uncomment below if batch representative is included;  and accept only one batch representative vote per submission
        #if len(a) + 1 > len(b):
        if len(a) != len(b) or len(a) != len(d):
            abort(403)

        #increase vote by 1
        for candidate_position_id in candidate_id:
            db.table("candidate_position").where('id', candidate_position_id).increment('vote_count')

    except Exception,e:
        status = "failed"
        pass

    if status == "success":
        try:
            voted_candidates = ", ".join(voted)
            db.table("voters").where("user_key","=",user_key).update({'voted': 1,"voted_candidates": voted_candidates});

            return render_template("success.html");

        except Exception, e:
            print e   

    return redirect(url_for('result',status=status))

@app.route("/result/<status>")
def result(status):
    return jsonify({"status":status}), 200

@app.route("/api/vote/count", methods=["GET"])
@jwt_required
def vote_count():

    data = db.table("candidate_position") \
             .left_join("candidates","candidates.id","=","candidate_position.candidate_id") \
             .left_join("positions","positions.id","=","candidate_position.position_id") \
             .select("candidates.candidate","positions.position","candidate_position.vote_count") \
             .get().serialize()

    candidates = {}

    for i in data:
        position = i.position.lower()

        if position not in candidates.keys():
            candidates[position] = []
        candidates[position].append({i.candidate : i.vote_count})

    return jsonify(candidates), 200

@app.route("/api/vote/count/<position>")
@jwt_required
def vote_count_position(position):
    try:
        print position

        position = position.lower()

        data = db.table("candidate_position") \
                 .left_join("candidates","candidates.id","=","candidate_position.candidate_id") \
                 .left_join("positions","positions.id","=","candidate_position.position_id") \
                 .select("candidates.candidate","positions.position","candidate_position.vote_count") \
                 .where("positions.position","=",position) \
                 .get().serialize()       

        candidates = {}

        for i in data:
            position = i.position.lower()

            print position

            if position not in candidates.keys():
                candidates[position] = []

            candidates[position].append({i.candidate : i.vote_count})

        return jsonify(candidates), 200

    except:
        abort(403)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000,debug=True)
