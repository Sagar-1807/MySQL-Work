CREATE TABLE `employee` (
  `fname` varchar(15) NOT NULL,
  `mname` char(1) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `adress` varchar(35) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dpt_No` int NOT NULL,
   PRIMARY KEY (`ssn`));
  
CREATE TABLE `department` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `mgr_ssn` char(9) NOT NULL,
  `Mgr_start_date` date NOT NULL,
  PRIMARY KEY (`Dnumber`));
use company;
  
CREATE TABLE `dept_location` (
  `Dnumber` int NOT NULL,
  `dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`dlocation`));
  
CREATE TABLE `project` (
  `Prname` varchar(15) NOT NULL,
  `Prnumber` int NOT NULL,
  `Prlocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Prnumber`),
  UNIQUE KEY `Prnumber` (`Prnumber`));

CREATE TABLE `work_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`));
  
CREATE TABLE `dependant` (
  `Essn` char(9) NOT NULL,
  `Dept_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `relationship` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dept_name`));  

INSERT INTO `employee` VALUES ('sagar','s','khare','15','1988-07-18','nashik','m',25000.00,'10',21);
INSERT INTO `employee` VALUES('Anjali','l','jadhav','16','1992-01-01','Kalyan','F',2000.00,'11',22);
INSERT INTO `employee` VALUES('Mona','A','Mirjolkar','17','1985-09-23','pune','F',20000.00,'12',23);

INSERT INTO `department` VALUES('Presshop',101,'1010','2019-01-19');
INSERT INTO `department` VALUES('Weldshop',102,'1011','2019-03-15');
INSERT INTO `department` VALUES('Paintshop',103,'1012','2019-03-16');

INSERT INTO `dependant` VALUES ('121','Presshop','M','1988-07-18','Employee');
INSERT INTO `dependant` VALUES('122','Weldshop','M','1988-07-18','Employee');
INSERT INTO `dependant` VALUES('123','Paintshop','M','1988-07-18','Employee');

INSERT INTO `dept_location` VALUES (101,'plant-1');
INSERT INTO `dept_location` VALUES(102,'plant-2');
INSERT INTO `dept_location` VALUES(103,'plant-3');

INSERT INTO `project` VALUES ('Lowerpart',1111,'plant-1',101);
INSERT INTO `project` VALUES('LPAssy',1112,'plant-2',102);
INSERT INTO `project` VALUES('LpPaint',1113,'plant-3',103);

INSERT INTO `work_on` VALUES ('121',1111,10.0);
INSERT INTO `work_on` VALUES('1212',9,10.0);
INSERT INTO `work_on` VALUES('1212',10,10.0);
INSERT INTO `work_on` VALUES('1213',11,20.0);
INSERT INTO `work_on` VALUES('1214',12,30.0);
INSERT INTO `work_on` VALUES('1215',13,40.0);
INSERT INTO `work_on` VALUES('1216',14,50.0);
INSERT INTO `work_on` VALUES('1217',15,60.0);


INSERT INTO `work_on` VALUES('122',1112,20.0);
INSERT INTO `work_on` VALUES('123',1113,30.0);
INSERT INTO `work_on` VALUES('124',1114,40.0);
INSERT INTO `work_on` VALUES('125',1115,50.0);
INSERT INTO `work_on` VALUES('126',1116,60.0);

-- not run
alter table department add foreign key (mgr_ssn) references employee(ssn);
alter table employee add foreign key (super_ssn) references employee(ssn);
alter table employee add foreign key (Dpt_No) references department(dnumber);
alter table dept_location add foreign key (Dnumber) references department(dnumber);
alter table project add foreign key (Dnum) references department(dnumber);
alter table work_on add foreign key (Essn) references employee(ssn);
alter table work_on add foreign key (Prnumber) references project(Prnumber);
alter table dependant add foreign key (Essn) references employee(ssn);
-- not run

update employee
set salary='25501'
where ssn='16';

delete from work_on
where Essn=126 and Pno=1116;

update employee
set dpt_no='101'
where ssn='15';

update employee
set dpt_no='102'
where ssn='16';

update employee
set dpt_no='103'
where ssn='17';

#UNARY RELATIONAL OPERATION
select fname,lname
from employee
where Dpt_No=103;

select prnumber,dnumber,lname,adress,bdate
from project,department,employee
where dnum=dnumber and ssn=mgr_ssn and Prlocation='nashik';

select e.fname,e.lname,s.fname,s.lname
from employee as e,employee as s
where e.super_ssn=s.ssn;

select distinct hours
from work_on;

#----------------CROSS PRODUCT-------------
select fname,bdate,dname
from employee,department;
#-------------------------------------
select * 
from department,dependant,dept_location
where essn =121 and  Dname=Dept_name;

#-----------------NESTED QUERIES






  
  


  


  
