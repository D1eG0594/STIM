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

def obtain_user_data(user_login_info):

    conn = db_conn()

    cursor = conn.cursor()

    cursor.execute(

            '''
            SELECT user_id, user_name, email
            FROM users
            WHERE email = %s AND password = %s
            ''',
            (user_login_info.email, user_login_info.password)
        )
    user_data = cursor.fetchone()


    cursor.close()
    conn.commit()
    conn.close()

    if user_data:
        return{
            'user_id': user_data[0],
            'name': user_data[1],
            'email': user_data[2],
        }
    else:
        return None
