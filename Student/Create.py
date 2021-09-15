#create student table
import datetime
import mysql.connector
mydb=mysql.connector.connect(host='localhost',user='root',
            passwd='Sagar@1988',database='school')
x=datetime.datetime.now()
mycursor=mydb.cursor()
mycursor.execute('create table student'
        '(student_no int not null primary key,'
        ' student_name varchar(20),'
        ' student_dob date,student_doj date)')