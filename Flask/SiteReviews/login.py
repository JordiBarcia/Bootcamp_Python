from pymongo import MongoClient
import bcrypt

client = MongoClient('localhost', 27017)
db = client['nombreBaseDatos']
users = db['users']

def user_register(username, password):
    if users.find_one({'username': username}):
        return 'User already exists'
    
    # Hash de contrasña antes de guardarla en la base de datos
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

    users.insert_one({'username': username, 'password': hashed_password})
    return 'User registered successfully'

def user_login(username, password):
    user = users.find_one({'username': username})
    if not user:
        return 'User not found'
    
    #Comparar la contraseña
    if bcrypt.checkpw(password.encode('utf-8'), user['password']):
        return 'User logged in successfully'
    else:
        return 'Password incorrect'