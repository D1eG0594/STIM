from db.db_conn import db_conn

class Game: #Clase que se encarga de extraer toda la informacion del juego
    def __init__(self, game_id, name, release_date, positive, negative, downloads):
        self.game_id = game_id
        self.name = name
        self.release_date = release_date
        self.positive = positive
        self.negative = negative
        self.downloads = downloads
    
    @staticmethod
    def get_game_info(game_id):
        conn = db_conn()
        cursor = conn.cursor()
        cursor.execute(
            '''
            SELECT game_id, name, release_date, positive, negative, downloads
            FROM game
            WHERE game_id = %s
            ''',
            (game_id,)
        )
        game_info = cursor.fetchone()
        if game_info:
            return Game(*game_info)
        else:
            return None