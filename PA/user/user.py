import psycopg2

class User:
    def __init__(self, user_id=None, user_name=None, email=None, password=None):
        self.user_id = user_id
        self.user_name = user_name
        self.email = email
        self.password = password

    def get_user_info(self):
        return {
            "user_id": self.user_id,
            "user_name": self.user_name,
            "email": self.email,
            "password": self.password
        }
    
    @staticmethod #Metodo estatico para poner relizar la conexion a la base de datos
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
            return None

class InsertUser(User): #Clase que se encarga de insertar un nuevo usuario a la base de datos
    def __init__(self, user_name=None, email=None, password=None):
        super().__init__(user_name=user_name, email=email, password=password)

    def set_user_info(self, user_name=None, email=None, password=None):
        if user_name:
            self.user_name = user_name
        if email:
            self.email = email
        if password:
            self.password = password

    def insert_user(self):
        conn = self.db_conn()
        if conn:
            cursor = conn.cursor()
            cursor.execute(
                '''INSERT INTO users (user_name, email, password)
                   VALUES (%s, %s ,%s)''',
                (self.user_name, self.email, self.password)
            )
            conn.commit()
            cursor.close()
            conn.close()
        else:
            print("No se pudo establecer la conexión a la base de datos.")

class UserLoginInfo(User): #Clase que se encarga de comprobar si el email y la contraseña se encuantran el la base de datos
    def __init__(self, email=None, password=None):
        super().__init__(email=email, password=password)

    def set_user_info(self, email=None, password=None):
        if email:
            self.email = email
        if password:
            self.password = password

    def login_user(self):
        try:
            conn = self.db_conn()
            if conn:
                with conn.cursor() as cursor:
                    cursor.execute(
                        '''
                        SELECT email, password FROM users
                        WHERE email = %s AND password = %s
                        ''',
                        (self.email, self.password)
                    )
                    result = cursor.fetchone()
                    conn.close()

                    if result:
                        return True
                    else:
                        return False
            else:
                print("No se pudo establecer la conexión a la base de datos.")
                return False
        except psycopg2.Error as e:
            print("Error al verificar las credenciales:", e)
            return False

class ObtainUserData(User): #Clase que se encarga de obtener todos los datos del usuario utilizando el email y la contraseña
    def __init__(self, email=None, password=None):
        super().__init__(email=email, password=password)

    def set_user_info(self, email, password):
        if email:
            self.email = email
        if password:
            self.password = password
    
    def get_user_data(self):
        conn = self.db_conn()
        if conn:
            cursor = conn.cursor()
            cursor.execute(
                '''
                SELECT user_id, user_name, email
                FROM users
                WHERE email = %s AND password = %s
                ''',
                (self.email, self.password)
            )
            user_data = cursor.fetchone()
            cursor.close()
            conn.commit()
            conn.close()

            if user_data:
                return {
                    'user_id': user_data[0],
                    'user_name': user_data[1],
                    'email': user_data[2],
                }
            else:
                return None
        else:
            print("No se pudo establecer la conexión a la base de datos.")
            return None

class UserLibrary(User): #Clase que se encarga de extrar la id de la libreria de usuario
    def __init__(self, library_id=None, user_id=None):
        super().__init__(user_id=user_id)
        self.library_id = library_id

    def set_user_info(self, user_id=None):
        if user_id:
            self.user_id = user_id

    def get_library_id(self):
        conn = self.db_conn()
        if conn:
            cursor = conn.cursor()
            cursor.execute(
                '''
                SELECT library_id
                FROM library
                WHERE user_fk = %s
                ''',
                (self.user_id,)
            )
            library_id = cursor.fetchone()
            cursor.close()
            conn.close()

            if library_id:
                self.library_id = library_id[0]
                return self.library_id
            else:
                return None
        else:
            print("No se pudo establecer la conexión a la base de datos.")
            return None