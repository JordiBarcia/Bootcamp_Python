from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/productos')
def mostrar_productos():
    categoria = request.args.get('categoria')
    return f'Estos son los productos de la categoria {categoria}'

@app.route('/about')
def about():
    return 'Acerca de nosotros'

@app.route('/usuario/<string:nombre>')
def usuario(nombre):
    return 'Hola' + nombre

@app.route('procesar', method=['POST'])
def procesar():
    nombre = request.form['nombre']
    return f'Hola, {nombre}!'



if __name__ == '__main__':
    app.run(debug=True)