from flask import Flask, render_template, request, flash, session, redirect, url_for, jsonify
import psycopg2
import psycopg2.extras
from user.user import InsertUser, UserLoginInfo, ObtainUserData, UserLibrary
from models.library import Library
from models.game import Game
from models.category import Category
from db.db_conn import db_conn


app = Flask(__name__)
app.secret_key = '1234'



@app.route("/")
def index():
    return render_template("login.html")

@app.route("/login_page")
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
            if user_data:
                session['user_id'] = user_info['user_id']
                session['user_name'] = user_info['user_name']
                session['email'] = user_info['email']
                session['password'] = password

            return render_template('inicio.html')
        else:
            flash('INCORRECT EMAL OR PASSWORD', 'error')
    return render_template('login.html')        

@app.route("/game/<int:game_id>")
def game_page(game_id):

    game_info = Game.get_game_info(game_id)

    return render_template('game.html', game=game_info)

@app.route("/category/<int:category_id>")
def category_page(category_id):
    games_in_category = Category.get_categories_for_game(category_id)

    if category_id == 22:
        category = "Aventura"
    elif category_id == 335:
        category = "Deportes"
    elif category_id == 16:
        category = "Acción"
    elif category_id == 339:
        category = "Estrategia"
    elif category_id == 299:
        category = "RPG"
    else:
        return render_template("inicio.html")

    return render_template("category.html", games=games_in_category, category=category)

@app.route("/library_page")
def library_page():

    user_id = session['user_id']
    user_library = UserLibrary(user_id=user_id)
    library_id = user_library.get_library_id()

    library = Library(library_id)

    games_in_library = library.get_games_in_library()

    return render_template('library.html', games = games_in_library)

@app.route("/profile_page")
def profile_page():
    user_name = session.get('user_name')
    email = session.get('email')

    return render_template('profile.html', user_name=user_name, email=email)

@app.route("/store_page")
def store_page():
    return render_template('inicio.html')

#--------------------------------------------------------------------------------------------------------------------------

# Función para ejecutar la consulta en la base de datos
def query_db(query):
    conn = psycopg2.connect(
        dbname='db_stim1',
        user='postgres',
        password='postgres',
        host='localhost',
        port='5432'
    )
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)  # Para obtener resultados como diccionarios
    cur.execute(query)
    results = cur.fetchall()
    cur.close()
    conn.close()
    return results

# Diccionario con las queries
queries = {
    "Juego gratuito con 20,000 descargas llamado KLAUS": """
        SELECT price, downloads, positive, "name" 
        FROM game g
        WHERE price = 0 AND downloads = 20000 AND positive = 3 AND "name" = '-KLAUS-';
    """,
    "Precio y descargas del juego WARSAW": """
        SELECT "name", price, downloads  
        FROM game g 
        WHERE "name" = 'WARSAW';
    """,
    "Juegos que valen menos de 15 dólares": """
        SELECT "name", positive, negative 
        FROM game g 
        WHERE price < 15;
    """,
    "Juegos gratuitos con más de 30,000 reseñas positivas": """
        SELECT "name", price, positive
        FROM game g 
        WHERE price = 0 AND positive > 30000;
    """,
    "Juego más caro de la tienda": """
        SELECT "name", price
        FROM game 
        WHERE price = (SELECT MAX(price) FROM game);
    """,
    "Juego de pago más barato": """
        SELECT "name", price 
        FROM game g 
        WHERE price = (SELECT MIN(price) FROM game WHERE price > 0);
    """,
    "10 mejores juegos por calificación": """
        SELECT "name", positive, negative 
        FROM game g 
        ORDER BY negative ASC, positive DESC
        LIMIT 10;
    """,
    "10 peores juegos por calificación": """
        SELECT "name", negative 
        FROM game g 
        ORDER BY negative DESC 
        LIMIT 10;
    """,
    "Juegos lanzados en 2014": """
        SELECT "name", release_date, price 
        FROM game g 
        WHERE release_date LIKE '%2014%';
    """,
    "Usuarios que viven en Colombia": """
        SELECT u.*, c.*
        FROM users u
        JOIN country c ON u.country_fk = c.codeid 
        WHERE c.name = 'Colombia';
    """,
    "Usuarios de Sudán": """
        SELECT u.*, c.*
        FROM users u
        JOIN country c ON u.country_fk = c.codeid 
        WHERE c.name = 'Sudan';
    """,
    "Usuarios de Alemania": """
        SELECT u.*, c.*
        FROM users u
        JOIN country c ON u.country_fk = c.codeid 
        WHERE c.name = 'Germany';
    """,
    "30 categorías de juegos con más descargas": """
        SELECT c."name", g.downloads 
        FROM category c, game g, game_category_rel gcr 
        WHERE g.downloads = (SELECT MAX(downloads) FROM game WHERE downloads > 0)
        LIMIT 30;
    """,
    "Categoría de juegos con menos descargas": """
        SELECT c."name", g.downloads 
        FROM category c, game g, game_category_rel gcr 
        WHERE g.downloads = (SELECT MIN(downloads) FROM game)
        LIMIT 1;
    """,
    "Categoría con más juegos": """
        SELECT c."name", COUNT(g.game_id) 
        FROM category c, game g, game_category_rel gcr 
        GROUP BY c."name" 
        ORDER BY COUNT(g.game_id) DESC 
        LIMIT 1;
    """,
    "Precio del juego menos descargado": """
        SELECT "name", price, downloads 
        FROM game g
        WHERE downloads = (SELECT MIN(downloads) FROM game g)
        LIMIT 1;
    """,
    "Precio del juego más descargado": """
        SELECT "name", price, downloads 
        FROM game g
        WHERE downloads = (SELECT MAX(downloads) FROM game g)
        LIMIT 1;
    """,
    "Emails de todos los usuarios": """
        SELECT email 
        FROM users u;
    """,
    "Total de categorías de juegos": """
        SELECT COUNT(*) AS total_categories 
        FROM category;
    """,
    "Juegos de 2023 y 2024": """
        SELECT "name", price, positive, release_date 
        FROM game g 
        WHERE release_date LIKE '%2023%' OR release_date LIKE '%2024%';
    """,
    "Juegos lanzados en 2023": """
        SELECT COUNT(*) AS games_of_2023 
        FROM game g 
        WHERE release_date LIKE '%2023%';
    """,
    "Juegos con 0 reseñas positivas": """
        SELECT "name", positive 
        FROM game g 
        WHERE positive = 0;
    """,
    "Juegos con menos de 30 reseñas negativas y más de 500 reseñas positivas lanzados en 2016": """
        SELECT "name", positive, negative, release_date 
        FROM game g 
        WHERE positive > 500 AND negative < 30 AND release_date LIKE '%2016%';
    """,
    "Juegos en la categoría 'Aliens'": """
        SELECT COUNT(*)
        FROM category c, game g 
        WHERE c."name" = 'Aliens';
    """,
    "Juegos de usuario con 'am' en username y librería id 1": """
        SELECT u.user_name, l.library_id, l.games 
        FROM "library" l, game g, game_library_rel glr, users u 
        WHERE u.user_name LIKE '%am%' AND l.library_id = 1 
        LIMIT 1;
    """
}

@app.route('/query')
def query():
    return render_template('query.html', queries=queries)

@app.route('/execute_query')
def execute_query():
    query_key = request.args.get('query_key')
    query = queries.get(query_key)
    if not query:
        return redirect(url_for('query'))
    results = query_db(query)
    return render_template('results.html', results=results, query_key=query_key)


@app.route("/change_password")
def change_password():
    return render_template("change_password.html")

@app.route("/update_password", methods=["POST"])
def update_password():
    if request.method == "POST":
        # Obtener la contraseña actual y la nueva contraseña del cuerpo de la solicitud JSON
        
        current_password = request.form.get("current_password")
        new_password = request.form.get("new_password")

        password = session['password']
        user_id = session['user_id']
        user_name = session['user_name']
        email = session['email']


        if current_password == password:
            
            conn = db_conn()
            cur = conn.cursor()
            cur.execute("""UPDATE users
                        SET password = %s
                        WHERE user_id = %s""",
                        (new_password, user_id))
            conn.commit()
            cur.close()
            conn.close()
            return render_template('profile.html', user_name=user_name, email=email)
        else: 
            flash('INCORRECT PASSWORD', 'error')
    return render_template('change_password.html')

if __name__ == "__main__":
    app.run(debug=True, port=5000)