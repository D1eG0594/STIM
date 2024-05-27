import psycopg2
from flask import Flask, render_template, request, flash
from db.insert_user import insert_user
from db.user import User_name, User_login_info
from db.login_user import login_user

app = Flask(__name__)
app.secret_key = '1234'



@app.route("/")
def index():
    return render_template("index.html")

@app.route("/register_user", methods=["POST"])
def register():

    user_name = request.form.get("user_name")
    email = request.form.get("email")
    password = request.form.get("password")
    
    # Crear objeto User_name y User_login_info
    user_name = User_name(user_name) 
    user_login_info = User_login_info(email, password)

    insert_user(user_name, user_login_info)

    flash('Usuario registrado correctamente', 'success')
    return render_template('index.html')


@app.route("/login_user", methods=["POST"])
def login():
    if request.method == 'POST':
        email = request.form.get("email")
        password = request.form.get("password")

        user_login_info = User_login_info(email, password)

        credentials = login_user(user_login_info)

        

        if credentials:
            #flash('Inicio de sesión exitoso', 'success')
            return render_template('store.html')
        else:
            flash('Credenciales incorrectas', 'error')
    return render_template('index.html')        



if __name__ == "__main__":
    app.run(debug=True, port=5000)