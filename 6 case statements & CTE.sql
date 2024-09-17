-- 56
use awaiz_tech
select * from Course
select * from Learner

-- case statements in sql
-- create a new column as "CourseFeeStatus" on basis of expensive>3999>moderate>1499>cheap
select CourseName, CourseFee,
	case
		when CourseFee>3999 then 'expensive'
		when CourseFee>1499 then "moderate"
		else 'cheap'
	end as CourseFeeStatus
from Course

-- case expressions in sql - for exact matches
-- same question
select CourseName, CourseFee,
	case CourseFee
		when 3999 then 'expensive'
		when 1499 then "moderate"
		else 'cheap'
	end as CourseFeeStatus
from Course

create table orders(
	orderID int primary key auto_increment,
    orderDate timestamp not null,
    orderStudentID int not null,
    orderStatus varchar(10) not null,
    foreign key(orderStudentID) references Learner(LearnerID)
)
 insert into orders( orderDate, orderStudentID, orderStatus ) values ("2024-01-21",1,"complete");
 insert into orders( orderDate, orderStudentID, orderStatus ) values ("2024-01-12",2,"complete");
 insert into orders( orderDate, orderStudentID, orderStatus ) values ("2024-02-22",3,"complete");
 insert into orders( orderDate, orderStudentID, orderStatus ) values ("2024-01-12",4,"complete");
 insert into orders( orderDate, orderStudentID, orderStatus ) values ("2024-01-15",5,"complete");
 insert into orders( orderDate, orderStudentID, orderStatus ) values ("2024-01-16",6,"complete");
 insert into orders( orderDate, orderStudentID, orderStatus ) values ("2024-01-13",2,"pending");
 insert into orders( orderDate, orderStudentID, orderStatus ) values ("2024-01-14",4,"pending");
 insert into orders( orderDate, orderStudentID, orderStatus ) values ("2024-01-22",6,"closed")
select * from orders

-- total orders per students
select orderStudentID, count(*) as orderCount from orders group by orderStudentID
-- same with Learner full name
select LearnerID, Learner_FirstName, Learner_LastName, orderCount from Learner join
(select orderStudentID, count(*) as orderCount from orders group by orderStudentID) as temp
on Learner.LearnerID=temp.orderStudentID
-- introduce a new column with average orders for everyone
select LearnerID, Learner_FirstName, Learner_LastName, orderCount, 
avg(sum(orderCount)) over() from Learner join
(select orderStudentID, count(*) as orderCount from orders group by orderStudentID) as temp
on Learner.LearnerID=temp.orderStudentID group by LearnerID