from flask import Flask, request, make_response,jsonify,send_from_directory, render_template, request, redirect, url_for, session
from flask_mail import Mail, Message
from dotenv import load_dotenv
from google.auth.transport.requests import Request
from google_auth_oauthlib.flow import Flow
from google.oauth2.credentials import Credentials
from itsdangerous import URLSafeTimedSerializer
import dbhelper
import apiHelper
import dbcreds
import uuid
import json
import os
# Get the path to the current directory
current_directory = os.path.dirname(os.path.abspath(__file__))

# Construct the path to credentials.json
credentials_path = os.path.join(current_directory, 'credentials.json')

# Set CLIENT_SECRETS_FILE

# Load variables from .env file
load_dotenv()


from flask_cors import CORS

app=Flask(__name__)


SCOPES = ['https://www.googleapis.com/auth/gmail.send']
CLIENT_SECRETS_FILE = credentials_path 
API_NAME = 'gmail'
API_VERSION = 'v1'
REDIRECT_URI = 'https://mvp.simret.site/oauth-callback'
AUTH_URI = 'https://accounts.google.com/o/oauth2/auth'
TOKEN_URI = 'https://oauth2.googleapis.com/token'

# Configure Flask app for session
app.secret_key = str(uuid.uuid4())


# Access environment variables
app.config['MAIL_SERVER'] = os.getenv('MAIL_SERVER')
app.config['MAIL_PORT'] = int(os.getenv('MAIL_PORT'))
app.config['MAIL_USE_TLS'] = os.getenv('MAIL_USE_TLS') == 'True'
app.config['MAIL_USE_SSL'] = os.getenv('MAIL_USE_SSL') == 'True'
app.config['MAIL_USERNAME'] = os.getenv('MAIL_USERNAME')
app.config['MAIL_PASSWORD'] = os.getenv('MAIL_PASSWORD')

mail = Mail(app)


CORS(app)

# Adding a line that restricts the size of a file being uploaded
# In this example, I only allow images up to 0.5 MB 0.5 * 1000000 in size or # 2 megabytes in bytes,2 * 1024 * 1024 
app.config['MAX_CONTENT_LENGTH'] = 2 * 1024 * 1024


########(University API)######
@app.get('/api/all-university')
def get_all_university():
# Endpoint to get all  university.
        results = dbhelper.run_procedure('CAll get_all_university()',[])
        if(type(results)==list):
            return make_response((results), 200)
        else:
            return make_response((results), 500) 

@app.get('/api/all-university-image')
# Endpoint to get dorm room images.
# # Fetches all room images from the database and returns base64-encoded images.
def get_unis_image():
    image_list = []       
    results = dbhelper.run_procedure('CAll get_all_uni_image()', [])
    if(type(results)==list):
        for item in results:
                image_data = apiHelper.get_base64_image(item['filename'])
                item['filename'] = image_data
                image_list.append(item)
        return make_response(jsonify(images=image_list), 200)
    else:
      return make_response(jsonify(results), 500)
    
# University  POST API Registering a University/signin-up  
@app.post('/api/university')
def post_new_university():
    # Endpoint for registering a new university. It expects several parameters in the form data.
    # Generates a UUID and UUID salt for token and password hashing purposes.
    # Also allows uploading an image as a logo for the university.
        uuid_value=uuid.uuid4()
        uuidSalt_value=uuid.uuid4()
        error=apiHelper.check_endpoint_info(request.form,[ "name","bio","address","city","website","phone_number","state","zip","country","email","password"]) 
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
            # If the filename is None something has gone wrong
        if(filename == None):
            return make_response(jsonify("Sorry, something has gone wrong"), 500)
        # ( username, first_name, last_name,description, phone_number, email, password ) = request.form
        results = dbhelper.run_procedure('CAll university_signup(?,?,?,?,?,?,?,?,?,?,?,?,?,?)',[request.form.get('name'),request.form.get('bio'),filename,request.form.get('address'),request.form.get('city'),request.form.get('website'),request.form.get('phone_number'),request.form.get('state'),request.form.get('zip'),request.form.get('country'),request.form.get('email'),request.form.get('password'),token,salt])
        if(type(results)==list):
                return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 

# API Endpoint for university login
@app.post('/api/university-login')
    # Endpoint for university login. Expects the email and password for authentication.
def post_new_login():
        error=apiHelper.check_endpoint_info(request.form,["email","password"]) 
        if (error != None):
         return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll university_login(?,?)',[request.form.get('email'),request.form.get('password')])
        if(type(results)==list):
             return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 
        
# API Endpoint for university logout
@app.delete('/api/university-logout')
# Endpoint for university logout. Expects the authentication token.
def logOut_university():
        error=apiHelper.check_endpoint_info(request.headers,["token"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll logout_university(?)',[request.headers.get("token")])
        if(type(results)==list):
            return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 

# API Endpoint for removing a university account
@app.delete('/api/remove-university')
def remove_university():
 # Endpoint for removing a university account. Requires email, password, and authentication token.
        error=apiHelper.check_endpoint_info(request.json,["email","password"]) 
        headererror=apiHelper.check_endpoint_info(request.headers,["token"]) 
        if (error != None and headererror != None):
         return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll delete_university(?,?,?)',[request.json.get("email"),request.json.get("password"),request.headers.get("token")])
        if(type(results)==list):
            return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 
        
 # API Endpoint to update university information
@app.patch('/api/university')
 #Endpoint to update university information.
 # Expects JSON data with updated information and university ID.
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

# API Endpoint to get university information
@app.get('/api/university')
# Endpoint to get university information by providing its ID.
def get_university_info():
        error=apiHelper.check_endpoint_info(request.args,["university_id"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll get_universty_info(?)',[request.args.get("university_id")])
        if(type(results)==list):
            return make_response((results), 200)
        else:
            return make_response((results), 500) 
        
# API Endpoint to get university images
@app.get('/api/university-image')
 # Endpoint to get university images by providing its ID.
def get_university_image():
        error=apiHelper.check_endpoint_info(request.args,["university_id"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll get_universty_info(?)',[request.args.get("university_id")])
        if(type(results)==list):
            image=  send_from_directory('images', results[0]['filename'] )
            return make_response((image), 200)
        else:
            return make_response((image), 500) 
        
###### University  Dormitory ########## 
# API Endpoint for adding a new dormitory
@app.post('/api/dormitory')
def add_dormitory():
    fileArray=[]
    # Endpoint for adding a new dormitory to a university.
    # Requires various parameters including name, address, facilities, etc.
    error=apiHelper.check_endpoint_info(request.form,["name","address","city","state","zip","country","facilities"]) 
    errorHeader=apiHelper.check_endpoint_info(request.headers,["token"]) 
    if (error != None and errorHeader !=None):
      return make_response(jsonify(error), 400)
    is_valid =apiHelper.check_endpoint_info(request.files, ['file[]'])
    if(is_valid != None):
            return make_response(jsonify(is_valid), 400)
    for file_key in request.files.getlist('file[]'):
        filename =apiHelper.multi_save_file(file_key)
        if(filename == None):
            return make_response(jsonify("Sorry, something has gone wrong"), 500)
        fileArray.append(filename)
        fileString=json.dumps(fileArray)
    facilities = request.form.get("facilities")
    results = dbhelper.run_procedure('CAll  insert_new_dormitory(?,?,?,?,?,?,?,?,?)',[request.form.get("name"),request.form.get("address"),request.form.get("city"),request.form.get("state"),request.form.get("zip"),request.form.get("country"),facilities, fileString,request.headers.get("token")])
    if(type(results)==list):
        return make_response(jsonify(results), 200)
    else:
      return make_response(jsonify(results), 500)

# API Endpoint for updating dormitory information
@app.patch('/api/update-dormitory')
def update_dormitory():
     # Endpoint for updating dormitory information.
    # Requires dormitory ID and various parameters to update.
    error=apiHelper.check_endpoint_info(request.form,["id"]) 
    errorHeader=apiHelper.check_endpoint_info(request.headers,["token"]) 
    if (error != None and errorHeader !=None):
      return make_response(jsonify(error), 400)
    if(request.files):
        filename =apiHelper.save_file(request.files['file'])
    else:
        filename=None
      #name=request.form.get("name") #empty is None
    results = dbhelper.run_procedure('CAll  update_dormitory(?,?,?,?,?,?,?,?,?,?,?)',[request.form.get("id"),request.form.get("name"),request.form.get("address"),request.form.get("city"),request.form.get("state"),request.form.get("zip"),request.form.get("country"),request.form.get("facilities"),request.form.get("image_id"),filename, request.headers.get("token")])
    if(type(results)==list):
        return make_response(jsonify(results), 200)
    else:
      return make_response(jsonify(results), 500)


# API Endpoint to get all dormitories of a university
@app.get('/api/all-dormitories')
def get_all_dormitories():
# Endpoint to get all dormitories of a university.
# Requires university ID to fetch the data.
        error=apiHelper.check_endpoint_info(request.args,["university_id"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll get_all_dormitory(?)',[request.args.get("university_id")])
        if(type(results)==list):
            return make_response((results), 200)
        else:
            return make_response((results), 500) 
        

#API Endpoint to delete a dormitory
@app.delete('/api/dormitory')
def delete_dorm():
        # Endpoint to delete a dormitory by providing its ID.
        error=apiHelper.check_endpoint_info(request.json,["id"]) 
        if (error != None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll delete_dormitory(?)',[request.json.get("id")])
        if(type(results)==list):
             return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 
                
# API Endpoint to get dorm  images
@app.get('/api/dorm-image')
def get_dorm_image():
    # Endpoint to get dorm  images.
    # Fetches all dorm images from the database and returns base64-encoded images.
    image_list = []       
    results = dbhelper.run_procedure('CAll get_dormitory_images()', [])
    if(type(results)==list):
        for item in results:
                image_data = apiHelper.get_base64_image(item['images'])
                item['images'] = image_data
                image_list.append(item)
        return make_response(jsonify(images=image_list), 200)
    else:
      return make_response(jsonify(results), 500)
                
###### University  Dormitory Rooms ########## 
# API Endpoint to get all rooms of a dormitory

@app.get('/api/get-all-rooms')
 # Endpoint to get all rooms of a dormitory by providing its ID.
def get_all_rooms():
        results = dbhelper.run_procedure('CAll get_every_room()',[])
        if(type(results)==list):
            return make_response((results), 200)
        else:
            return make_response((results), 500) 

@app.get('/api/all-rooms')
 # Endpoint to get all rooms of a dormitory by providing its ID.
def get_all_rooms_by_id():
        error=apiHelper.check_endpoint_info(request.args,["dormitory_id"]) 
        if (error !=None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll get_all_rooms(?)',[request.args.get("dormitory_id")])
        if(type(results)==list):
            return make_response((results), 200)
        else:
            return make_response((results), 500) 
        
# API Endpoint to add a new dorm room
# # Adding  dorm-room  POST API 
@app.post('/api/dorm-room')
 # Endpoint for adding a new dormitory room to a dormitory.
    # Expects various parameters including room number, floor name, room type, etc.
    # Allows uploading multiple images as room images.
def post_new_Room():
    error=apiHelper.check_endpoint_info(request.form,["room_number","floor_name","room_type","capacity","avilablity_status","monthly_rent","facilities","dormitory_id"]) 
    fileArray=[]
    if (error != None ):
        return make_response(jsonify(error), 400)
    is_valid =apiHelper.check_endpoint_info(request.files, ['file[]'])
    if(is_valid != None):
        return make_response(jsonify(is_valid), 400)
    for file_key in request.files.getlist('file[]'):
        filename =apiHelper.multi_save_file(file_key)
        if(filename == None):
            return make_response(jsonify("Sorry, something has gone wrong"), 500)
        fileArray.append(filename)
    fileString=json.dumps(fileArray)
    results = dbhelper.run_procedure('CAll  insret_new_room(?,?,?,?,?,?,?,?,?)',[request.form.get('room_number'),request.form.get('floor_name'),request.form.get('room_type'),request.form.get('capacity'),request.form.get('avilablity_status'),request.form.get('monthly_rent'),request.form.get('facilities'),fileString,request.form.get('dormitory_id')])
    if(type(results)==list):
            return make_response(jsonify(results), 200)
    else:
        return make_response(jsonify(results), 500) 
        
# API Endpoint for updating room information
@app.patch('/api/update-room')
def update_room():
     # Endpoint for updating dormitory information.
    # Requires dormitory ID and various parameters to update.
        # error=apiHelper.check_endpoint_info(request.form,["id","room_number","floor_name","room_type","capacity","avilablity_status","monthly_rent","facilities","image_id"]) 
    error=apiHelper.check_endpoint_info(request.form,["id"]) 
    if (error != None ):
      return make_response(jsonify(error), 400)
    if(request.files):
        filename =apiHelper.save_file(request.files['file'])
    else:
        filename=None
    results = dbhelper.run_procedure('CAll  update_rooms(?,?,?,?,?,?,?,?,?,?)',[request.form.get("id"),request.form.get('room_number'),request.form.get('floor_name'),request.form.get('room_type'),request.form.get('capacity'),request.form.get('avilablity_status'),request.form.get('monthly_rent'),request.form.get('facilities'), request.form.get('image_id'),filename,])
    if(type(results)==list):
        return make_response(jsonify(results), 200)
    else:
      return make_response(jsonify(results), 500)
        
# API Endpoint to get dorm room images
@app.get('/api/room-image')
# Endpoint to get dorm room images.
# # Fetches all room images from the database and returns base64-encoded images.
def get_room_image():
    image_list = []       
    results = dbhelper.run_procedure('CAll get_rooms_image()', [])
    if(type(results)==list):
        for item in results:
                image_data = apiHelper.get_base64_image(item['images'])
                item['images'] = image_data
                image_list.append(item)
        return make_response(jsonify(images=image_list), 200)
    else:
      return make_response(jsonify(results), 500)
                
# API Endpoint to delete a dorm room
@app.delete('/api/dorm-room')
def delete_room():
# Endpoint to delete a dormitory room by providing its ID.
        error=apiHelper.check_endpoint_info(request.json,["id"]) 
        if (error != None):
          return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll delete_room(?)',[request.json.get("id")])
        if(type(results)==list):
             return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 

## Retting  Section ##
# API Endpoint to send user rating information
@app.post('/api/user_rating')
def user_rating():
    # Endpoint to post a user rating  providing username and email.
        uuid_value=uuid.uuid4()
        # Access user_email and verification_code
        error=apiHelper.check_endpoint_info(request.form,('room_id','username','user_email')) 

        user_token = str(uuid_value)  
        print(request.form.get('username'))
        print(request.form.get('user_email'))
        if error is None:
            verification_code = user_token 
        elif(error != None):
            return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll user_rating_info_pro(?,?,?,?)',[request.form.get('room_id'),request.form.get('username'),request.form.get('user_email'),verification_code])
        if(type(results)==list):
            # Send the verification email
            print(request.form.get('username'),request.form.get('user_email'),verification_code)
            send_verification_email(request.form.get('user_email'),verification_code)
            return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 

        
def send_verification_email(user_email, verification_code):
    # Compose the verification email
    msg = Message('Verification Code', sender='simretpersonalpaulos@gmail.com', recipients=[user_email])
    msg.body = f'Your verification code is: {verification_code}'

    # Send the email
    mail.send(msg)


# API Endpoint to send user rating 
@app.post('/api/send_rating_value')
def send_rating():
        error=apiHelper.check_endpoint_info(request.form,('username','user_email','rating','message')) 
        print(request.form.get('username'))
        print(request.form.get('user_email'))
        if (error != None ):
            return make_response(jsonify(error), 400)
        results = dbhelper.run_procedure('CAll user_rating_value(?,?,?,?)',[request.form.get('rating'),request.form.get('username'),request.form.get('user_email'),request.form.get('message')])
        if(type(results)==list):
            return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 
        
# API Endpoint to get user rating 
@app.get('/api/get_all_rating')
def get_rating():
       # Endpoint to get all  user raings.
        results = dbhelper.run_procedure('CAll get_all_rating()',[])
        if(type(results)==list):
            return make_response(jsonify(results), 200)
        else:
            return make_response(jsonify(results), 500) 
     
        

if (dbcreds.production_mode == True):
    # If running in production mode, use bjoern server to run the app.
    print("Running in Production Mode")
    import bjoern # type: ignore
    bjoern.run(app, "0.0.0.0", 5005)
else: 
     # If running in testing/development mode, enable CORS and run the app using Flask built-in server.
    from flask_cors import CORS
    CORS(app)
    print("Running in Testing/Development Mode!")
    
# Running the Flask application in debug mode
app.run(debug=True)  



