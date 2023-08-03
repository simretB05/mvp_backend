import os
import base64
from uuid import uuid4
def check_endpoint_info(sent_data, expected_data):
    for data  in expected_data:
        if(sent_data.get(data) == None):
            return f'The {data} must be sent!'

def save_file(file):
    # Check to see if first, the filename contains a . character. 
    # Then, split the filename around the . characters into an array
    # Then, see if the filename ends with any of the given extensions in the array
    # You can add or remove file types you want or do not want the user to store
    if('.' in file.filename and file.filename.rsplit('.', 1)[1].lower() in ['gif','png','jpg','jpeg', 'webp', 'pdf']):
        # Create a new filename with a token so we don't get duplicate file names
        # End the filename with . and the original filename extension
        filename = uuid4().hex + '.' + file.filename.rsplit('.', 1)[1].lower()
        try:
            # Use built-in functions to save the file in the images folder
            # You can put any path you want, in my example I just need them in the images folder right here
            file.save(os.path.join('rooms_images', filename))
            # Return the filename so it can be stored in the DB
            return filename
        except Exception as error:
            # If something goes wrong, print out to the terminal and return nothing
            print("FILE SAVE ERROR: ", error)
    # If any conditional is not met or an error occurs, None is returned

## for multiple images
def multi_save_file(file):
    # Check to see if first, the filename contains a . character. 
    # Then, split the filename around the . characters into an array
    # Then, see if the filename ends with any of the given extensions in the array
    # You can add or remove file types you want or do not want the user to store
    if('.' in file.filename and file.filename.rsplit('.', 1)[1].lower() in ['gif','png','jpg','jpeg', 'webp', 'pdf']):
        # Create a new filename with a token so we don't get duplicate file names
        # End the filename with . and the original filename extension
        filename = uuid4().hex + '.' + file.filename.rsplit('.', 1)[1].lower()
        try:
            # Use built-in functions to save the file in the images folder
            # You can put any path you want, in my example I just need them in the images folder right here
            file.save(os.path.join('rooms_images', filename))
            # Return the filename so it can be stored in the DB
            return filename
        except Exception as error:
            # If something goes wrong, print out to the terminal and return nothing
            print("FILE SAVE ERROR: ", error)
    # If any conditional is not met or an error occurs, None is returned

    # Helper function to read an image file, convert it to base64, and return the base64 data.

def get_base64_image(image_filename):
    # Used to handle images stored in 'rooms_images' folder.
    # If any error occurs during the process, it returns None.
    # Specify the folder where the images are stored. 
# The variable 'image_folder' holds the directory path 'rooms_images'.
    image_folder = 'rooms_images'
    # Combine the folder path 'image_folder' with the filename 'image_filename' to create the full image path.
# The variable 'image_path' holds the complete path to the image file.
    image_path = os.path.join(image_folder, image_filename)
    try:
         # Open the image file in binary read mode ('rb').
    # The 'with' statement ensures that the file is properly closed after its suite finishes execution.
        with open(image_path, 'rb') as image_file:
                    # Read the image data from the file into the variable 'image_data'.
    # If the image is read successfully and encoded to base64, return the base64 image data.

            image_data = image_file.read()
        # If any exception occurs during the process (e.g., file not found, read error,),
        # print an error message indicating the filename and the specific exception.
        # Encode the binary image data to base64 format and convert it to a UTF-8 string.
        # The 'base64.b64encode' function encodes the binary data and returns a bytes object.
        # The 'decode' method converts the bytes object to a UTF-8 string, which is stored in the variable 'base64_image'
            base64_image = base64.b64encode(image_data).decode('utf-8')
        return base64_image
    except Exception as e:
        
        print(f"Error reading image '{image_filename}': {str(e)}")
            # If there is an error reading the image, return None to indicate failure.
        return None
