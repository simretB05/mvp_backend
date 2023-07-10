from flask import Flask, request, make_response,jsonify
import dbhelper
import apiHelper
import dbcreds
import uuid
import json
from flask_cors import CORS

app=Flask(__name__)

CORS(app)

# University  POST API Registering a University/signin-up  
@app.post('/api/university')
def post_new_university():
        uuid_value=uuid.uuid4()
        error=apiHelper.check_endpoint_info(request.json,[ "name","bio","university_profile_url","address","city","university_website","contact_phone","email","password"]) 
        if (error==None):
            token = str(uuid_value)
            salt = str(uuid_value)
        elif(error != None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll university_signup(?,?,?,?,?,?,?,?,?,?,?)',[request.json.get("name"),request.json.get("bio"),request.json.get("university_profile_url"),request.json.get("address"),request.json.get("city"),request.json.get("university_website"),request.json.get("contact_phone"),request.json.get("email"),request.json.get("password"),token,salt])
        if(type(results)==list):
             return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 

# University Login  POST API 
@app.post('/api/university-login')
def post_new_login():
        error=apiHelper.check_endpoint_info(request.json,["email","password"]) 
        if (error != None):
         return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll university_login(?,?)',[request.json.get("email"),request.json.get("password")])
        if(type(results)==list):
             return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 


if (dbcreds.production_mode == True):
    print("Running in Production Mode")
    import bjoern # type: ignore
    bjoern.run(app, "0.0.0.0", 5001)
else: 
    from flask_cors import CORS
    CORS(app)
    print("Running in Testing/Development Mode!")
    

app.run(debug=True) 
