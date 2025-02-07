from flask import Flask, request, render_template, redirect, url_for, flash
import mysql.connector
import bcrypt

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Asegúrate de definir una clave secreta para las sesiones

# Función para obtener la conexión de la base de datos
def get_db_connection():
    return mysql.connector.connect(
        host="127.0.0.1",
        user="root",
        password="1234",  # Asegúrate de poner la contraseña correcta
        database="grupo_bbdd"
    )

# Ruta de inicio para mostrar los juegos
@app.route('/')
def index():
    db = get_db_connection()
    cursor = db.cursor()
    cursor.execute("SELECT * FROM games")
    games = cursor.fetchall()  # Obtener todos los juegos de la base de datos
    db.close()
    
    # Pasamos los juegos al template
    return render_template('inicio.html', games=games)

# Ruta de registro
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        # Verificar si el usuario ya existe
        db = get_db_connection()
        cursor = db.cursor()
        cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
        if cursor.fetchone():
            flash('User already exists', 'danger')
            db.close()
            return redirect(url_for('register'))
        
        # Hash de la contraseña
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
        
        # Insertar el nuevo usuario en la base de datos
        cursor.execute("INSERT INTO users (username, password) VALUES (%s, %s)", (username, hashed_password))
        db.commit()
        db.close()

        flash('User registered successfully', 'success')
        return redirect(url_for('login'))
    
    return render_template('register.html')  # El formulario de registro

# Ruta de inicio de sesión
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        # Verificar si el usuario existe
        db = get_db_connection()
        cursor = db.cursor()
        cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
        user = cursor.fetchone()

        if not user:
            flash('User not found', 'danger')
            db.close()
            return redirect(url_for('login'))
        
        # Comparar la contraseña
        if bcrypt.checkpw(password.encode('utf-8'), user[1].encode('utf-8')):  # user[1] es el campo de la contraseña
            flash('User logged in successfully', 'success')
            db.close()
            return redirect(url_for('games'))  # Redirige a la página de juegos después de iniciar sesión
        else:
            flash('Password incorrect', 'danger')
            db.close()
            return redirect(url_for('login'))

    return render_template('login.html')  # El formulario de login

# Ruta para mostrar juegos
@app.route('/games')
def games():
    return render_template('games.html')

# Ruta para mostrar reseñas de juegos
@app.route('/games/reviews')
def reviews():
    return render_template('reviews.html')

if __name__ == '__main__':
    app.run(debug=True)