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


def login_user(user_login_info):
    try:
        with db_conn() as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    '''
                    SELECT email, password FROM users
                    WHERE email = %s AND password = %s
                    ''',
                    (user_login_info.email, user_login_info.password)
                )
                result = cursor.fetchone()

                if result:
                    # Las credenciales son válidas
                    return True
                    
                else:
                    # Las credenciales no son válidas
                    return False
                    
    except psycopg2.Error as e:
        print("Error al verificar las credenciales:", e)
        return False

