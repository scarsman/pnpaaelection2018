from orator import DatabaseManager
from config import *
from flask import Flask, abort, render_template,request, send_file, jsonify,url_for,redirect


import json
import ujson
import uuid
import hashlib

import csv

import time


db = DatabaseManager(DATABASES)

def insert_user():

    not_accepted = []
    duplicate = []
    inserted = []
    results = {}

    with open('alumnigooglegroups.csv') as f:
        reader = csv.reader(f)
        reader.next()
        reader.next()

        for row in reader:
            email = row[0]
            nickname = row[1]
            batch = row[13]
            alumni_name = row[14]
            email_type = row[15]

            accepted = ["primary","Primary", "PRIMARY"]
            
            if email_type in accepted:
                check_email = db.table("voters").where('email',"=",email).select("email").get().serialize()

                if len(check_email) < 1:
                    token = generate_token()
                    db.table("voters").insert({"email":email,"alumni_name":alumni_name,"nickname":nickname,"batch": batch,"user_key":token,'voted': 0})
                    inserted.append({'token':token,'email':email,'nickname':nickname})
                    results["insert"] = inserted
                else:
                    duplicate.append(email)
                    results["duplicate"] = duplicate
            else:
                not_accepted.append(email);
                results["secondary"] = not_accepted        

    print ujson.dumps(results,indent=4)
    #return ujson.dumps(results)

def generate_token():
    m = hashlib.sha224()
    m.update(str(uuid.uuid4()))
    token = m.hexdigest()

    return token

def send_email():
    msg = MIMEMultipart('alternative')
    msg['From'] = formataddr((str(Header('PNPAA ELECTION 2018', 'utf-8')), SMTP_USER))
    #appears on cc
    msg['To'] = CC_EMAIL
    msg['Subject'] = "PNPAA Election 2018"

    server = smtplib.SMTP(SMTP_HOST, SMTP_PORT)
    server.starttls()
    server.login(SMTP_USER, SMTP_USER_PASSWORD)

    recipients = []
    url = "http://localhost:9000"

    while True:
        users = db.table("voters").select("nickname","email","user_key").where("sent","=",0).limit(20).get().serialize()

        for u in users:
            try:
                #recipients.append(u.email);
                email = u.email
                #message = "PNPAA Election\nClick the link below to vote %s/token/%s " %(url,u.user_key)
                html = """\
                    <html>
                      <head></head>
                      <body>
                            <p>Hi %s,<br><br>
                           Please <a href="%s/token/%s" target="_blank">click here to vote</a> on our next PNPAA officers. <br>
                           Thank you. <br><br>
                           - PNPAA
                        </p>
                      </body>
                    </html>
                    """ %(u.nickname,url,u.user_key)
                msg.attach(MIMEText(html, 'html'))
                server.sendmail(msg['From'], email, msg.as_string())
                db.table("voters").where('email', email).update({'sent': 1})

                print "successfully sent to %s" %email

            except:
                pass

        #allow multiple recipients
        #msg['To'] = ", ".join(recipients)
        #server.sendmail(msg['From'], recipients, msg.as_string())

        time.sleep(500)
        print "work work work"
    server.quit()

insert_user()
#send_email()
