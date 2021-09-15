#update data into student table
from datetime import date,datetime
import datetime
import mysql.connector
mydb=mysql.connector.connect(host='localhost',user='root',
            passwd='Sagar@1988',database='school')
mycursor=mydb.cursor()

u="update student set student_dob='1992-1-12' where student_no=101"
x="update student set student_name='sampada' where student_no=103"
mycursor.execute(u)
mycursor.execute(x)
mydb.commit()