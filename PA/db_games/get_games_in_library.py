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


def get_games_in_library(library_id):
    games_in_library = []

    conn = db_conn()
    
    # Crear un cursor para ejecutar consultas SQL
    cursor = conn.cursor()

    # Obtener los game_id asociados a la biblioteca
    cursor.execute(
        '''
        SELECT game_fk
        FROM game_library_rel
        WHERE library_fk = %s
        ''',
        (library_id,)
    )
    game_ids = [row[0] for row in cursor.fetchall()]

    # Obtener los detalles de los juegos
    for game_id in game_ids:
        cursor.execute(
            '''
            SELECT game_id, name
            FROM game
            WHERE game_id = %s
            ''',
            (game_id,)
        )
        game_details = cursor.fetchone()
        if game_details:
            games_in_library.append({
                'game_id': game_details[0],
                'name': game_details[1],
            })
    
    # Cerrar el cursor
    cursor.close()
    
    # Confirmar la transacción
    conn.commit()
    
    
    if conn is not None:
        conn.close()
    
    return games_in_library