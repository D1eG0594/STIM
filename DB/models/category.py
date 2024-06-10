from db.db_conn import db_conn

class Category: #Clase que se encarga de extraer todos los juegos de una categoria
    def __init__(self, category_id, name):
        self.category_id = category_id
        self.name = name
    
    @staticmethod #Metodo estatico para que se pueda usar sin necesidad de crear una instancia de objeto
    def get_categories_for_game(category_id):
        conn = db_conn()
        cursor = conn.cursor()
        cursor.execute(
            '''
            SELECT game_id, name
            FROM game
            JOIN game_category_rel ON game.game_id = game_category_rel.game_fk
            WHERE game_category_rel.category_fk = %s
            ''',
            (category_id,)
        )
        games = cursor.fetchall()
        return games