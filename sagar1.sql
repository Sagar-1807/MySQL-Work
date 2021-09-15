USE sagar1;
create table mainbook (
user_id int,
fname varchar(15) not null,
lname varchar(15) not null,
gender char(10) not null
);
alter table mainbook add age int;
alter table mainbook add address varchar(25);
alter table mainbook drop location;
-- drop table details
alter table mainbook add primary key (user_id);
alter table mainbook modify  column user_id int not null;


create table shopping (
shopping_id int primary key,
user_id int not null,
produc_name varchar(20) not null,
qnty int(5) ,
shop_name varchar(10) not null,
price int(10) not null,

constraint fk_user_id
foreign key (user_id)
references mainbook(user_id)
);
create view view1 as select * from shopping;
create view view2 as select produc_name from shopping;

insert into mainbook (user_id,fname,lname,gender) values(101,'sagar','khare','male');
insert into mainbook (user_id,fname,lname,gender) values(102,'anjali','jadhav','female');
insert into mainbook (user_id,fname,lname,gender) values(103,'sopan','khare','male');
insert into mainbook (user_id,fname,lname,gender) values(104,'vasanti','khare','female');
insert into mainbook (user_id,fname,lname,gender) values(105,'mona','khare','female');


update mainbook set age=32,address='nashik' where user_id=101;
update mainbook set age=32,address='kalyan' where user_id=102;
update mainbook set age=32,address='nashik' where user_id=103;
update mainbook set age=32,address='nashik' where user_id=104;
update mainbook set age=32,address='kalyan' where user_id=105;


insert into shopping (user_id) select user_id from  mainbook where user_id=101







