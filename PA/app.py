import psycopg2
from flask import Flask, render_template, request

app = Flask(__name__)

def db_connect():
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




def consulta():

    conn = db_connect()

    
    cursor = conn.cursor()

    
    cursor.execute("SELECT app_id, name FROM juegos WHERE price = 0")

    
    rows = cursor.fetchall()

    
    for row in rows:
        print(row)

    
    cursor.close()
    conn.close()

