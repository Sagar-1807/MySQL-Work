import mysql.connector
db=mysql.connector.connect(host='localhost',user='root',passwd='Sagar@1988')
commnd_handler=db.cursor()#--buffered=True =for multiple queries
commnd_handler.execute('create database college')


# commnd_handler.execute('create table user(id int(10)',
#                        'username varchar(20),password varchar(20)'' privilege varchar(20))')