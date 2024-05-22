import psycopg2

# Parámetros de conexión
dbname = 'juegos'
user = 'postgres'
password = 'postgres'
host = 'localhost'  # o la dirección de tu servidor PostgreSQL
port = '5433'       # el puerto por defecto de PostgreSQL es 5432

try:
    # Conexión a la base de datos
    conn = psycopg2.connect(dbname=dbname, user=user, password=password, host=host, port=port)

    # Crear un cursor
    cursor = conn.cursor()

    # Ejecutar una consulta
    cursor.execute("SELECT app_id, name FROM juegos WHERE price = 0")

    # Obtener los resultados
    rows = cursor.fetchall()
    
    # Imprimir los resultados
    for row in rows:
        print(row)

    # Cerrar el cursor y la conexión
    cursor.close()
    conn.close()

except psycopg2.Error as e:
    print("Error al conectar a la base de datos PostgreSQL:", e)