from db.db_conn import db_conn

class Library: #Clase que se encarga de extraer todos los juegos que hay en una biblioteca especifica
    def __init__(self, library_id):
        self.library_id = library_id
    
    #@staticmethod
    def get_games_in_library(self):
        conn = db_conn()
        cursor = conn.cursor()
        cursor.execute(
            '''
            SELECT game_id, name
            FROM game
            JOIN game_library_rel ON game.game_id = game_library_rel.game_fk
            WHERE game_library_rel.library_fk = %s
            ''',
            (self.library_id,)
        )
        games = cursor.fetchall()
        return games