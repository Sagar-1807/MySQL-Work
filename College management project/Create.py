import mysql.connector
db=mysql.connector.connect(host='localhost',user='root',
                           passwd='Sagar@1988',database='college')
commnd_handler=db.cursor(buffered=True)


#once database created comment out it.
'''commnd_handler.execute("create table user(id int(10),"
                       "username varchar(20),"
                       "password varchar(20),"
                       "privilege varchar(20))")'''

#-------------------------------------------------close--------------------
def admin_session():
    while 1:
        print(" 1 for new student registration")
        print(" 2 for new teacher registration")
        print(" 3 for delete student registration")
        print(" 4 for delete teacher registration")
        print(" 5 for logout")

        user_entr=int(input("enter number:"))
        if user_entr == 1:
            print('--register new studnt--')
            username=input("studnt name:")
            pw=input("studnt pw")
            details=(username,pw)
            commnd_handler.execute("INSERT INTO user(username,password,privilege) VALUES(%s,%s,'student')",details)
            db.commit()
            print(username, "has been registered as studnt.")

        elif user_entr == 2:
            print('--register new teacher--')
            username=input("teacher name:")
            pw=input("teacher pw")
            details=(username,pw)
            commnd_handler.execute("INSERT INTO user(username,password,privilege) VALUES(%s,%s,'teacher')",details)
            db.commit()
            print(username, "has been registered as teacher.")

        elif user_entr == 3:
            print('--delete student a/c--')
            username=input("student name:")
            details=(username,"student")
            commnd_handler.execute("DELETE FROM user where username=%s and privilege=%s",details)
            db.commit()
            if commnd_handler.rowcount < 1:
                print("user not found")
            else:
                print(username,"has been deleted.")

        elif user_entr == 4:
            print('--delete teacher a/c--')
            username=input("teacher name:")
            details=(username,"teacher")
            commnd_handler.execute("DELETE FROM user where username=%s and privilege=%s",details)
            db.commit()
            if commnd_handler.rowcount < 1:
                print("user not found")
            else:
                print(username,"has been deleted.")

        elif user_entr == 5:
            print("------------logout done------------\n")
            break
        else:
            print('--Wrong option entered --\n')



def autherised_admin():
    print("admin login")
    username=input("Enter username:")
    password=input("Enter password:")
    if username=="sk":
        if password=="pw":
            admin_session()
        else:
            print("wrong password")
    else:
        print("wrong login")


def login():
    while 1:
        print('welcome to login panel')
        print("--enter 1 for studunt login\n"
              "--enter 2 for teache login\n"
              "--enter 3 for user login")
        print("")


        usr_optn=int(input("Enter option:"))
        if usr_optn==1:
            print("---student login")
        elif usr_optn==2:
            print("---teacher login")
        elif usr_optn==3:
            autherised_admin()
        else:
            print("---Invalid input")
login()










