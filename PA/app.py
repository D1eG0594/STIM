from flask import Flask, render_template, request, flash, session
from user.user import InsertUser, UserLoginInfo, ObtainUserData, UserLibrary
from models.library import Library

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
    
    # Crear objeto InsertUser
    register = InsertUser(user_name=user_name, email=email, password=password)

    register.insert_user()

    flash('Usuario registrado correctamente', 'success')
    return render_template('login.html')


@app.route("/login_user", methods=["POST"])
def login():
    if request.method == 'POST':
        email = request.form.get("email")
        password = request.form.get("password")

        login_info = UserLoginInfo(email=email, password=password)

        credentials = login_info.login_user()

        if credentials:
            user_data = ObtainUserData(email=email, password=password)
            user_info = user_data.get_user_data()
            print(user_data)
            print(1)
            if user_data:
                session['user_id'] = user_info['user_id']
                session['user_name'] = user_info['user_name']
                session['email'] = user_info['email']

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
    user_library = UserLibrary(user_id=user_id)
    library_id = user_library.get_library_id()

    library = Library(library_id)

    games_in_library = library.get_games_in_library()

    return render_template('library.html', games = games_in_library)

@app.route("/profile_page", methods=["POST"])
def profile_page():
    user_name = session.get('user_name')
    email = session.get('email')

    return render_template('profile.html', user_name=user_name, email=email)

if __name__ == "__main__":
    app.run(debug=True, port=5000)