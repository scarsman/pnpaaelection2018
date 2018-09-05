from orator import DatabaseManager
from config import *
from flask import Flask, abort, render_template,request, send_file, jsonify,url_for,redirect

import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.utils import formataddr
from email.header import Header

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
    msg['To'] = "me"
    #recipients = []
    msg['Cc'] = CC_EMAIL
    msg['Subject'] = "PNPAA Election 2018"

    server = smtplib.SMTP(SMTP_HOST, SMTP_PORT)
    server.starttls()
    server.login(SMTP_USER, SMTP_USER_PASSWORD)

    url = "http://pnpaaelection.mooo.com"

    is_ok_continue = True

    while is_ok_continue:
        
        users = db.table("voters").select("alumni_name","email","user_key").where("sent","=",0).limit(20).get().serialize()
        
        if len(users) < 1 :
            is_ok_continue = False
            
        
        for u in users:
            try:
                email = u.email
                name = u.alumni_name.split(",")
                firtstname = name[1]
                html = """\
                    <html>
                      <head></head>
                      <body>
                            <p>Hi %s,<br><br>
                           Please <a href="%s/election/vote?user_key=%s" target="_blank">click here to vote</a> on our next PNPAA officers. <br>
                           Thank you. <br><br>
                           - PNPAA
                        </p>
                      </body>
                    </html>
                    """ %(firtstname,url,u.user_key)
                    
                msg.attach(MIMEText(html, 'html'))
 
                server.sendmail(msg['From'],[email,CC_EMAIL], msg.as_string())
                db.table("voters").where('email', email).update({'sent': 1})  
                
                print "successfully sent to %s" %email
                

            except:
                pass
        
        time.sleep(5)
        
        #allow multiple recipients
        #msg['To'] = ", ".join(recipients)
        #server.sendmail(msg['From'], recipients, msg.as_string())

    server.quit()

#insert_user()
send_email()
