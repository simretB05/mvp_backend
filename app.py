from flask import Flask, request, make_response,jsonify,send_from_directory
import dbhelper
import apiHelper
import dbcreds
import uuid
import json
from flask_cors import CORS

app=Flask(__name__)

CORS(app)

# Adding a line that restricts the size of a file being uploaded
# In this example, I only allow images up to 0.5 MB in size
app.config['MAX_CONTENT_LENGTH'] = 0.5 * 1000000

########(University API)######
# University  POST API Registering a University/signin-up  
@app.post('/api/university')
def post_new_university():
        uuid_value=uuid.uuid4()
        uuidSalt_value=uuid.uuid4()
        error=apiHelper.check_endpoint_info(request.form,[ "name","bio","address","city","website","phone_number","state","zip","country","email","password"]) 
        print(request.form)
        print(request.files)
        print(request.files['file'])
        if error is None:
            token = str(uuid_value)
            salt = str(uuidSalt_value)
        elif(error != None):
            return make_response(jsonify(error), 400)
        
        is_valid =apiHelper.check_endpoint_info(request.files, ['file'])
        if(is_valid != None):
            return make_response(jsonify(is_valid), 400)
            # Save the image using the helper found in apihelpers
        filename =apiHelper.save_file(request.files['file'])
        print(filename)
            # If the filename is None something has gone wrong
        if(filename == None):
            return make_response(jsonify("Sorry, something has gone wrong"), 500)
        print(request)
        # ( username, first_name, last_name,description, phone_number, email, password ) = request.form
        # print(username, first_name, request.files['file'].filename)
        results = dbhelper.run_procedure('CAll university_signup(?,?,?,?,?,?,?,?,?,?,?,?,?,?)',[request.form.get('name'),request.form.get('bio'),filename,request.form.get('address'),request.form.get('city'),request.form.get('website'),request.form.get('phone_number'),request.form.get('state'),request.form.get('zip'),request.form.get('country'),request.form.get('email'),request.form.get('password'),token,salt])
        if(type(results)==list):
                return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 

# University Login  POST API 
@app.post('/api/university-login')
def post_new_login():
        error=apiHelper.check_endpoint_info(request.form,["email","password"]) 
        if (error != None):
         return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll university_login(?,?)',[request.form.get('email'),request.form.get('password')])
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
    print(request.form)
    error=apiHelper.check_endpoint_info(request.form,["name","address","city","state","zip","country","facilities"]) 
    errorHeader=apiHelper.check_endpoint_info(request.headers,["token"]) 
    if (error != None and errorHeader !=None):
      return make_response(jsonify(error), 400)
    facilities = request.form.get("facilities")
    print(facilities)
    results = dbhelper.run_procedure('CAll  insert_new_dormitory(?,?,?,?,?,?,?,?)',[request.form.get("name"),request.form.get("address"),request.form.get("city"),request.form.get("state"),request.form.get("zip"),request.form.get("country"),facilities,request.headers.get("token")])
    if(type(results)==list):
        return make_response(jsonify(results), 200)
    else:
      return make_response(jsonify(results), 500)

#update dormitory Patch API
@app.patch('/api/update-dormitory')
def update_dormitory():
    error=apiHelper.check_endpoint_info(request.form,["id"]) 
    errorHeader=apiHelper.check_endpoint_info(request.headers,["token"]) 
    if (error != None and errorHeader !=None):
      return make_response(jsonify(error), 400)
      #name=request.form.get("name") #empty is None
    facilities = request.form.get("facilities")
    print(facilities)
    results = dbhelper.run_procedure('CAll  update_dormitory(?,?,?,?,?,?,?,?,?)',[request.form.get("id"),request.form.get("name"),request.form.get("address"),request.form.get("city"),request.form.get("state"),request.form.get("zip"),request.form.get("country"),facilities,request.headers.get("token")])
    if(type(results)==list):
        return make_response(jsonify(results), 200)
    else:
      return make_response(jsonify(results), 500)


##### dorm room ##### 
# Adding  dorm-room  POST API 
@app.post('/api/dorm-room')
def add_dorm_room():
    error=apiHelper.check_endpoint_info(request.json,["room_number","floor_name","room_type","capacity","avilablity_status","monthly_rent","facilities","dormitory_id"]) 
    if (error != None ):
      return make_response(jsonify(error), 400)
    
    facility=request.json.get("facilities")
    print(facility)
    results = dbhelper.run_procedure('CAll  insret_new_room(?,?,?,?,?,?,?,?)',[request.json.get("room_number"),request.json.get("floor_name"),request.json.get("room_type"),request.json.get("capacity"),request.json.get("avilablity_status"),request.json.get("monthly_rent"),request.json.get("facilities"),request.json.get("dormitory_id")])
    if(type(results)==list):
        return make_response(jsonify(results), 200)
    else:
      return make_response(jsonify(results), 500)  
    
# get all Dormitories API get university info
@app.get('/api/all-dormitories')
def get_all_dormitories():
        error=apiHelper.check_endpoint_info(request.args,["university_id"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll get_all_dormitory(?)',[request.args.get("university_id")])
        if(type(results)==list):
            print(results)
            return make_response((results), 200)
        else:
            return make_response((results), 500) 

# Delete Dormitory
@app.delete('/api/dormitory')
def delete_dorm():
        error=apiHelper.check_endpoint_info(request.json,["id"]) 
        if (error != None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll delete_dormitory(?)',[request.json.get("id")])
        if(type(results)==list):
             return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 
# Edite Menu

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

# university API get university info
@app.get('/api/university')
def get_university_info():
        error=apiHelper.check_endpoint_info(request.args,["university_id"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll get_universty_info(?)',[request.args.get("university_id")])
        if(type(results)==list):
            print(results)
            return make_response((results), 200)
        else:
            return make_response((results), 500) 
        

# university API get university images
@app.get('/api/university-image')
def get_university_image():
        error=apiHelper.check_endpoint_info(request.args,["university_id"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll get_universty_info(?)',[request.args.get("university_id")])
        if(type(results)==list):
            print(results)

            image=  send_from_directory('images', results[0]['filename'] )
            return make_response((image), 200)
        else:
            return make_response((image), 500) 
        

###### University  Dorm Rooms#########
   
# get all Dorm Rooms API GET
@app.get('/api/all-rooms')
def get_all_rooms():
        error=apiHelper.check_endpoint_info(request.args,["dormitory_id"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll get_all_rooms(?)',[request.args.get("dormitory_id")])
        if(type(results)==list):
            print(results)
            return make_response((results), 200)
        else:
            return make_response((results), 500) 

if (dbcreds.production_mode == True):
    print("Running in Production Mode")
    import bjoern # type: ignore
    bjoern.run(app, "0.0.0.0", 5001)
else: 
    from flask_cors import CORS
    CORS(app)
    print("Running in Testing/Development Mode!")
    
    
app.run(debug=True)  



