#add/insert data to student table
import datetime
import mysql.connector
mydb=mysql.connector.connect(host='localhost',user='root',
            passwd='Sagar@1988',database='school')
mycursor=mydb.cursor()

mytable=("Insert into student(student_no,student_name,student_dob,student_doj) values(%s,%s,%s,%s)")
data=[(101,"john",'1992-10-18','2020-7-15'),
        (102,"raj",'1990-4-21','2021-5-21'),
        (103,"sima",'1993-3-19','2020-2-7'),
        (104,"piyush",'1994-8-8','2020-6-18'),
        (105,"mahesh",'1990-1-8','2020-5-22'),
        (106,"priya",'1991-3-11','2020-8-1'),
        (107,"rina",'1990-7-21','2020-3-8'),
        (108,"saroj",'1991-2-28','2021-2-12')]

mycursor.executemany(mytable,data)
mydb.commit()