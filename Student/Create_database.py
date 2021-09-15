#create new database-school

import mysql.connector
mydb=mysql.connector.connect(host='localhost',user='root',passwd='Sagar@1988')
mycursor=mydb.cursor()
mycursor.execute('create database school')
