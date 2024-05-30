from db.db_conn import db_conn

class Category:
    def __init__(self, category_id, name):
        self.category_id = category_id
        self.name = name
    
    @staticmethod
    def get_categories_for_game(game_id):
        conn = db_conn()
        cursor = conn.cursor()
        cursor.execute(
            '''
            SELECT c.category_id, c.name
            FROM category c
            JOIN game_category_rel gcr ON c.category_id = gcr.category_id
            WHERE gcr.game_id = %s
            ''',
            (game_id,)
        )
        categories = cursor.fetchall()
        return [Category(*cat) for cat in categories]