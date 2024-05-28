import psycopg2

def db_conn():
    # Parámetros de conexión
    dbname = 'db_stim'
    user = 'postgres'
    password = 'postgres'
    host = 'localhost'  
    port = '5432'  
    try:     
        conn = psycopg2.connect(dbname=dbname, user=user, password=password, host=host, port=port)
        return conn
    except psycopg2.Error as e:
        print("Error al conectar a la base de datos PostgreSQL:", e)


def insert_user(user_name, user_login_info):
    conn = db_conn()
    cursor = conn.cursor()
    cursor.execute('''INSERT INTO users (user_name, email, password)
                  VALUES (%s, %s ,%s)''',
                  (user_name.user_name, user_login_info.email, user_login_info.password))
    conn.commit()
    cursor.close()
    conn.close()