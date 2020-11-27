from os import environ
db_name = environ.get('db_name')
db_user = environ.get('db_user')
db_host = environ.get('db_host')

DB = {
    "name": db_name,
    "user": db_user,
    "host": db_host
}

