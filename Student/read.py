#list of student
import mysql.connector
mydb=mysql.connector.connect(host='localhost',user='root',
            passwd='Sagar@1988',database='school')
mycursor=mydb.cursor()
mycursor.execute('select Student_name from student')
result=mycursor.fetchall()
for i in result:
    print(i)