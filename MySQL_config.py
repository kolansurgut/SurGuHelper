import pymysql
import config
# import os
# from dotenv import load_dotenv


class MySQL_config:
    def __init__(self):
        # load_dotenv()
        # self.host = os.getenv('host')
        # self.port = os.getenv('port')
        # self.user = os.getenv('user')
        # self.password = os.getenv('password')
        # self.database = os.getenv('database')
        self.host = config.host
        self.port = 3306
        self.user = config.user
        self.password = config.password
        self.database = config.database
        self.connection = self.connect()
        self.cursor = self.connection.cursor()

    def connect(self):
        return pymysql.connect(
            host=self.host,
            port=self.port,
            user=self.user,
            password=self.password,
            database=self.database,
            cursorclass=pymysql.cursors.DictCursor
        )

    def output(self, database):
        self.cursor.execute(f"SELECT * FROM {database}")
        return self.cursor.fetchall()

    def insert(self, database, cells, values):
        #  "INSERT INTO database (name, age) VALUES ("Anna", 20);"
        self.cursor.execute(f"INSERT INTO {database} {cells} VALUES {values};")
        # self.cursor.execute(f"INSERT INTO `{database}` (`id`, `page`) VALUES ('499707202', '1');")
        self.connection.commit()

    def editing(self, database, command, command2):
        # "UPDATE database SET password = 'xxxxxx' WHERE id = 'id'"
        self.cursor.execute(f"UPDATE {database} SET {command} WHERE {command2}")
        self.connection.commit()

    def del_line(self, database, id):
        # "DELETE FROM database WHERE id = 'id';"
        self.cursor.execute(f"DELETE FROM {database} WHERE id = {id};")
        self.connection.commit()

    def coincidence(self, database, row, msg):
        self.cursor.execute(f"SELECT * FROM {database} WHERE {row} LIKE '%{msg}%'")
        teacher_bd = self.cursor.fetchall()
        if teacher_bd:
            return teacher_bd
        else:
            return False
