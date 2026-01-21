create table worker 
(
id int,
name varchar(250),
dept varchar (100)
);

insert into worker  values(1,'Naman','HR'),(2,'Aman','It'),(3,'Sunil','Sales'),(4,'Poornima','sales'),(5,'Pawan','HR');
insert into worker values(7,'Raju','Intern');
select name, dept from worker where dept in (SELECT distinct dept
FROM worker
GROUP BY dept having count(*) < 2);

alter table worker add column salary int;
UPDATE worker SET salary = 25000 WHERE id = 1;
UPDATE worker SET salary = 28000 WHERE id = 2;
UPDATE worker SET salary = 32000 WHERE id = 3;
UPDATE worker SET salary = 27000 WHERE id = 4;
UPDATE worker SET salary = 35000 WHERE id = 5;

SELECT name, dept, salary
FROM worker w
WHERE salary = (
    SELECT MAX(salary)
    FROM worker
    WHERE dept = w.dept
);

select name,salary as highest_salary,dept from worker where salary in (select Max(salary) from worker group by(dept));
-- displaying the highest salary dept wise
select * from worker where dept in (select dept from worker group by(dept) );

select * from worker where dept = 'Hr';
-- yaha pe at once sirf ek hi value ko compare karke result de raha hai hence we use In keyword

Select * from worker where dept in ('HR','It');
-- displaying the worker as per there Dept, here in keyword helps us to compare more than one value at a time

create table project (
pid int primary key,
id int  references worker(id),
project_name varchar(50),
location varchar(200)
);

update worker set emp_salary = 8000 where emp_id = 6;

select * from worker;
Alter table worker add constraint pk_id primary key(id);

INSERT INTO project (pid, id, project_name, location) VALUES
(301, 1, 'Employee Portal', 'Delhi'),
(302, 2, 'Payroll System', 'Mumbai'),
(303, 3, 'Inventory App', 'Bangalore'),
(304, 4, 'CRM Software', 'Pune'),
(305, 5, 'Attendance System', 'Noida');
insert into project values(306,6,'Xerox','Virar');
select * from project;

-- Q) Display details of project who's add is Delhi or mumbai or pune
select * from project where location in('Delhi','Mumbai','Pune');


-- Q) Display name of worker who are working on a project  
select emp_name , emp_id from worker  where emp_id in (select  emp_id from project);
-- if multiple project is being executed by one emp then we can use distinct keyword to filter out the duplicate emp

-- suppose we have to find the worker who are not wrking on any project 
select emp_name from worker where emp_id  not in(select emp_id from project);
-- since saare emp are working on some project there no O/P

alter table worker rename column salary to emp_salary;
alter table project rename column id to emp_id;
select * from project;

--Q) display the details of emp who are working on atleast one project
select * from worker where exists(select emp_id from project where worker.emp_id = project.emp_id);
--(exists and not exists humesha true ya false return karta hai, and iska working procedure is from top to bottom matlab pahle outer query aur phir inner query chalegi,
-- agr inner query true degi toh hi outer query chalegi else nahi chalegi)

--Q) Display emp details who are not workin on any project at this time ⌚ 
select * from worker where not exists(select emp_id from project where worker.emp_id = project.emp_id);




-- now we are comapring Nested query Vs correlated Query Vs Join

--Q) Display the details of emp working on any project (Using In keyword)
select * from worker  where emp_id in (select  emp_id from project);

--(Using correlated Query or nested query)
select  * from worker where exists (select emp_id from project where worker.emp_id = project.emp_id);

--(Using Join)
select * from worker w,project p where w.emp_id = p.emp_id; 

-- Intro to joins:-
-- what are joins :- Helps us to retrieve data form related tables 
-- types:- outer , inner, left, right, full , natural etc...

--Q) Natural join:- Join both the table using columns that have same name or compatible data type
create view V3 as (select * from worker natural join project);
select * from V3; 
Select * from worker , project where worker.emp_id = project.emp_id;
select emp_name from worker where emp_name like '%n%'; -- yaha like operator use hota hai koi ek specific pattern analyse karke OP dene k liye
select * from worker;

select * from worker order by emp_salary desc;
select * from project where emp_id <> 5; -- <> used as not equal to and helpful in comparisions
select * from worker where emp_name in ('Aman','Naman'); -- In operator use hota hai check karne ke liye ke list me jo values hai kya unme se koi value match ho raha hai ya nahi

select * from project where pid is null; -- ye wo value layega jo ke null ho , yaani no values assigned 
select * from project where pid is not null; -- yaha pe wo values aayenge jinke passs kuch values hai 

Select * from project where pid between 301 and 304;
select emp_id ,COUNT(emp_id) as id1 from project group by emp_id order by emp_id desc; -- count with group works aise pahle grp bana lega phir dekhega ek grp me kitne values common hai and then returns the count
select emp_dept , sum(emp_salary) as total_salary from worker group by emp_dept order by emp_dept desc;

update  worker set emp_dept = 'Sales' where emp_dept = 'sales';