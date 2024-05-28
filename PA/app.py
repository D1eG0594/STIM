import psycopg2
from flask import Flask, render_template, request, flash, session
from db_user.insert_user import insert_user
from db_user.user import User_name, User_login_info
from db_user.login_user import login_user
from db_user.obtain_user_data import obtain_user_data
from db_games.library import get_library_id
from db_games.get_games_in_library import get_games_in_library

app = Flask(__name__)
app.secret_key = '1234'



@app.route("/")
def index():
    return render_template("login.html")

@app.route("/login_page", methods=["POST"])
def login_page():
    return render_template("login.html")

@app.route("/register_page")
def register_page():
    return render_template("register.html")

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
    return render_template('login.html')


@app.route("/login_user", methods=["POST"])
def login():
    if request.method == 'POST':
        email = request.form.get("email")
        password = request.form.get("password")

        user_login_info = User_login_info(email, password)

        credentials = login_user(user_login_info)

        if credentials:
            user_data = obtain_user_data(user_login_info)
            session['user_id'] = user_data['user_id']
            session['name'] = user_data['name']
            session['email'] = user_data['email']

            return render_template('store.html')
        else:
            flash('INCORRECT EMAL OR PASSWORD', 'error')
    return render_template('login.html')        

@app.route("/game_page", methods=["POST"])
def game_page():
    return render_template('game.html')

@app.route("/category_page", methods=["POST"])
def category_page():
    return render_template('category.html')

@app.route("/library_page", methods=["POST"])
def library_page():

    user_id = session['user_id']
    library_id = get_library_id(user_id)

    games_in_library = get_games_in_library(library_id)


    return render_template('library.html', games = games_in_library)

@app.route("/profile_page", methods=["POST"])
def profile_page():
    name = session.get('name')
    email = session.get('email')

    return render_template('profile.html', name=name, email=email)

if __name__ == "__main__":
    app.run(debug=True, port=5000)