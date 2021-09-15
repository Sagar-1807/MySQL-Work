#delete data from table
import mysql.connector
mydb=mysql.connector.connect(host='localhost',user='root',
            passwd='Sagar@1988',database='school')
mycursor=mydb.cursor()

de=" Delete from student where student_no=106"
de1=" Delete from student where student_no=104"
mycursor.execute(de)
mycursor.execute(de1)

mydb.commit()