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


def get_library_id(user_id):
    conn = db_conn()
    cursor = conn.cursor()
    cursor.execute(
            '''
            SELECT library_id
            FROM library
            WHERE user_fk = %s
            ''',
            (user_id,)
        )
    
    library_id = cursor.fetchone()[0]
    return library_id
