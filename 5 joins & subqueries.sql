use awaiz_tech

update Learner set Selected_Course=1 where Selected_Course=2
select * from Learner

-- there are two tables: accounts(id, name) & transactions(acc_id, trans_id, date, value)
-- display id, name, num of transactions in March 2024, total transaction value where the account with highest transaction value first
select id, "name", count(trans_id) as num_of_trans, sum(value) as total
from accounts join transactions on account.id=transactions.acc_id where month(dt)=3 
group by id order by total desc

-- course wiht highest enrollment rate
-- without course name
select Selected_Course,count(*) as enrollment_Rate from Learner 
group by Selected_Course order by enrollment_Rate desc limit 1
-- with course name
select CourseID, CourseName, count(*) as enrollment_Rate from Course join Learner 
on Course.CourseID=Learner.Selected_Course group by CourseID order by enrollment_Rate desc limit 1 
-- above is my answer with one dscovery that with join I didnt need to specify CourseNAme after group by as I did after select
-- which was the group by contraint & also count(*), count(Selected_Course) are interchangeable
select CourseID, CourseName, enrollment_Rate from Course join
(select Selected_Course,count(*) as enrollment_Rate from Learner 
group by Selected_Course order by enrollment_Rate desc limit 1) as temp 
on Course.CourseID=temp.Selected_Course -- this is more optimised as we're first filtering then applying join because we cant avoid it