class Game_library_info:
    def __init__(self, game_id, name):
        self.game_id = game_id
        self.name = name

class Game_store_info(Game_library_info):
    def __init__(self, game_id, name, price):
        super().__init__(game_id, name)
        self.price = price


class Game_page_info(Game_store_info):
    def __init__(self, game_id, name, price, relelease_date, postitive, negative, downloads):
        super().__init__(game_id, name, price)
        self.relelease_date = relelease_date
        self.positive = postitive
        self.negative = negative
        self.downloads = downloads