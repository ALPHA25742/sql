show databases
create database if not exists awaiz_tech
use awaiz_tech
select database()

create table employee(
	EID	INT PRIMARY KEY,
    FIrstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Age	INT NOT NULL,
    Salary	INT NOT NULL,
    Location varchar(50) NOT NULL
)

DESC employee
DROP table employee
show tables

create table employee(
EID INT AUTO_INCREMENT, 
FIrstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Age INT NOT NULL,
Salary INT NOT NULL,
Location varchar(50) NOT NULL,
PRIMARY KEY(EID) 
)

INSERT INTO employee(FirstName,LastNAme,Age,Salary,Location) VALUES	("mohd","awaiz",22,18000,"hyd")

INSERT INTO employee(FirstName,LastNAme,Age,Salary,Location) VALUES	("mohd","fahad",21,0,"hyd");
INSERT INTO employee(FirstName,LastNAme,Age,Salary,Location) VALUES	("mohd","affan",22,0,"hyd");
INSERT INTO employee(FirstName,LastNAme,Age,Salary,Location) VALUES	("mohd","kamraan",19,10000,"hyd");
INSERT INTO employee(FirstName,LastNAme,Age,Salary,Location) VALUES	("mohd","ayaan",15,8000,"hyd");
INSERT INTO employee(FirstName,LastNAme,Age,Salary,Location) VALUES	("mohd","adnan",15,8000,"hyd");


select * FROM employee

-- employees with more than 8000
select * FROM employee WHERE Salary>8000

UPDATE employee SET LastName="rehan" WHERE EID=2

DELETE FROM employee WHERE EID=5
