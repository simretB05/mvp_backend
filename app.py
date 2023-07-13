from flask import Flask, request, make_response,jsonify
import dbhelper
import apiHelper
import dbcreds
import uuid
import json
from flask_cors import CORS

app=Flask(__name__)

CORS(app)

########(University API)######
# University  POST API Registering a University/signin-up  
@app.post('/api/university')
def post_new_university():
        uuid_value=uuid.uuid4()
        uuidSalt_value=uuid.uuid4()
        error=apiHelper.check_endpoint_info(request.json,[ "name","bio","university_profile_url","address","city","university_website","contact_phone","email","password"]) 
        if (error==None):
            token = str(uuid_value)
            salt = str(uuidSalt_value)
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
        

# University  API Logout  DELETE  API
@app.delete('/api/university-logout')
def logOut_university():
        error=apiHelper.check_endpoint_info(request.headers,["token"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll logout_user(?)',[request.headers.get("token")])
        if(type(results)==list):
            return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 

# University Remove univeristy account  DELETE  API
@app.delete('/api/remove-university')
def remove_university():
        error=apiHelper.check_endpoint_info(request.json,["email","password"]) 
        headererror=apiHelper.check_endpoint_info(request.headers,["token"]) 
        if (error != None and headererror != None):
         return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll delete_university(?,?,?)',[request.json.get("email"),request.json.get("password"),request.headers.get("token")])
        if(type(results)==list):
            return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 
        
# Adding  dormitory  POST API 
@app.post('/api/dormitory')
def add_dormitory():
    error=apiHelper.check_endpoint_info(request.json,["name","address","facilities"]) 
    errorHeader=apiHelper.check_endpoint_info(request.headers,["token"]) 
    if (error != None and errorHeader !=None):
      return make_response(jsonify(error), 400)
    results = dbhelper.run_procedure('CAll  insert_new_dormitory(?,?,?,?)',[request.json.get("name"),request.json.get("address"),request.json.get("facilities"),request.headers.get("token")])
    if(type(results)==list):
        return make_response(jsonify(results), 200)
    else:
      return make_response(jsonify(results), 500)

# Adding  dorm-room  POST API 
@app.post('/api/dorm-room')
def add_dorm_room():
    error=apiHelper.check_endpoint_info(request.json,["room_number","floor_name","room_type","capacity","avilablity_status","monthly_rent","facilities","dormitory_id"]) 
    if (error != None ):
      return make_response(jsonify(error), 400)
    results = dbhelper.run_procedure('CAll  insret_new_room(?,?,?,?,?,?,?,?)',[request.json.get("room_number"),request.json.get("floor_name"),request.json.get("room_type"),request.json.get("capacity"),request.json.get("avilablity_status"),request.json.get("monthly_rent"),request.json.get("facilities"),request.json.get("dormitory_id")])
    if(type(results)==list):
        return make_response(jsonify(results), 200)
    else:
      return make_response(jsonify(results), 500)  

# University Update  info  PATCH  API 
@app.patch('/api/university')
def edite_uni_info():
    headerError = apiHelper.check_endpoint_info(request.headers, ["token"])
    error = apiHelper.check_endpoint_info(request.json, ["uniUpdate_info", "university_id"])

    if error is not None or headerError is not None:
        return make_response(jsonify(error), 400)

    uniUpdateInfo = request.json.get("uniUpdate_info")
    uniUpdateInfoStr = json.dumps(uniUpdateInfo)  # Convert JSON object to JSON string
    universityId = request.json.get("university_id")
    token = request.headers.get("token")

    results = dbhelper.run_procedure('CALL update_university_info(?,?,?)', [uniUpdateInfoStr, universityId, token])

    if isinstance(results, list):
        return make_response(jsonify(results), 200)
    else:
        return make_response(jsonify(results), 500)

########(Usre API)######
# User API Registering a User/signin-up  
@app.post('/api/user')
def post_new_user():
        uuid_value=uuid.uuid4()
        uuidSalt_value=uuid.uuid4()
        error=apiHelper.check_endpoint_info(request.json,[ "username","first_name","last_name","phone_number","email","password","user_profile_url"]) 
        if (error==None):
            token = str(uuid_value)
            salt = str(uuidSalt_value)
        elif(error != None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll singnup_user(?,?,?,?,?,?,?,?,?)',[request.json.get("username"),request.json.get("first_name"),request.json.get("last_name"),request.json.get("phone_number"),request.json.get("email"),request.json.get("password"),request.json.get("user_profile_url"),token,salt])
        if(type(results)==list):
             return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 
        
#  User Login  API 
@app.post('/api/user-login')
def post_new_userLogin():
        error=apiHelper.check_endpoint_info(request.json,["email","password"]) 
        if (error != None):
         return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll user_login(?,?)',[request.json.get("email"),request.json.get("password")])
        if(type(results)==list):
             return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 

# User API Logout DELETE  API
@app.delete('/api/user-logout')
def logOut_user():
        error=apiHelper.check_endpoint_info(request.headers,["token"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll logout_user(?)',[request.headers.get("token")])
        if(type(results)==list):
            return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500)
        
# User Remove user account  DELETE  API
@app.delete('/api/remove-user')
def remove_user():
        error=apiHelper.check_endpoint_info(request.json,["email","password"]) 
        headererror=apiHelper.check_endpoint_info(request.headers,["token"]) 
        if (error != None and headererror != None):
         return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll delete_user(?,?,?)',[request.json.get("email"),request.json.get("password"),request.headers.get("token")])
        if(type(results)==list):
            return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 

# User info update  PATCH  API 
@app.patch('/api/user')
def edite_user_info():
    headerError = apiHelper.check_endpoint_info(request.headers, ["token"])
    error = apiHelper.check_endpoint_info(request.json, ["userUpdate_info", "user_id"])

    if error is not None or headerError is not None:
        return make_response(jsonify(error), 400)
    userUpdateInfo = request.json.get("userUpdate_info")
    userUpdateInfoStr = json.dumps(userUpdateInfo)  # Convert JSON object to JSON string
    userId = request.json.get("user_id")
    token = request.headers.get("token")

    results = dbhelper.run_procedure('CALL user_info_update(?,?,?)', [userUpdateInfoStr, userId, token])

    if isinstance(results, list):
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
