from constants import DB_HOST, DB_USER, DB_PW, DB_DB

import pymysql

class DB:

    def __init__(self):
        self.host = DB_HOST
        self.user = DB_USER
        self.pw   = DB_PW
        self.db   = DB_DB
        self.cursor = None
    
    def connect(self):
        try:
            db = pymysql.connect(self.host, self.user, self.pw, self.db)
            self.cursor = db.cursor(pymysql.cursors.DictCursor)
        except Exception as e:
            print('Failed to connect to db')

