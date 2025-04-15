create database jio_employee;


use jio_employee;

create table Emp (
Emp_ID int(10),
First_Name varchar(10),
Last_Name varchar(10),
Dept_code int (3));

select * from emp;

insert into Emp (Emp_ID, First_Name, Last_Name, Dept_Code)
values
(248132604,"Shivam", "Deo",76),
(815242165,"Parijat", "Shankar",43),
(416122768,"rahul", "Srivastava", 66),
(960828909,"Kumar","Swamy",47),
(440361783,"Shankh","Khurana",23),
(851591490,"Swapnil", "Mehta", 43),
(668957687,"Arvind", "Chattejee",23),
(585068105,"Jalpesh", "Modi",33),
(379882096,"Kavita", "Yadav", 23),
(718929853,"Syed", "Zaheer", 66),
(873840890,"Sanjay", "Shukla",76),
(941877566,"Ragini", "Malhotra",33),
(998809976,"Javed","Khan", 23),
(669391133, "Vikram","Singh",43),
(861199021,"Ajay","Kumar",23),
(980140890,"Pankaj","Verma",43),
(750603819,"Roshan","Singh",47),
(558885983,"Sunaina","Yadav",76),
(392214056,"Bhavna","Sharma",66),
(164880802,"Pooja","Kumari",47);

select * from emp;


create table Dept(
Dept_Code int (10),
Dept_Name varchar(25),
Dept_Budget int (12));

insert into Dept (Dept_Code,Dept_Name,Dept_Budget)
values
(23,"Sales and Marketing",50000000),
(66,"Information Technology",100000000),
(43,"Customer Service",30000000),
(33, "Human Resources",20000000),
(76, "Finance and Accounting",40000000),
(47,"Operations",60000000);

select * from dept;


#What are the unique Last_Names from the Employee Table?
select distinct(Last_Name) from emp;

#What is the total number of employees in the company?
select count(Emp_ID) from emp;

#What is the total budget for the company?
select sum(Dept_Budget) from dept;

#What is the department code and budget for the "Operations" department?
select * from dept
where dept_name = "operations";

#What is the total budget for the "Information Technology" and "Finance and Accounting" departments?
select sum(Dept_Budget) from dept
where dept_name in ("Information Technology", "Finance and Accounting");


#Who are the employees working in the "Sales and Marketing" department?
select * from emp
where Dept_code = 23;

#What is the name of the employee with Emp_ID 718929853?
select Emp_ID,First_Name,Last_Name from emp
where Emp_ID = "718929853";

#What is the budget for the "Customer Service" department?
select Dept_Budget from dept
where Dept_Name = "Customer Service";

#What is the total budget for all departments except "Operations"?
select sum(Dept_Budget) from dept
where dept_name <> "operations";

#What is the Emp_ID, First_Name and department_code of the employee with the last name "Shukla"?
select Emp_ID,First_Name,Dept_code from emp
where last_name="shukla";

#What is the average budget for the departments with Dept_Code 23 and 43?
select avg(Dept_Budget) from dept
where Dept_Code in (23,43);

#How many employees are there whose first name starts with the letter "S"?
select count(First_Name) emp_count
from emp
where First_Name like 's%';


#	List the name of Employees whose First_name starts with "S".
select First_Name from emp
where First_Name like 's%';

#List the name of Employees whose First_name starts with "S" and ends with "A".
select * from emp
where First_Name like 's%a';

#Fetch Top 3 records of all the Departments in descending order based on the budget of the department.
select * from dept
order by Dept_Budget desc
limit 3;

#Fetch data of all employees from the employee table whose dept_code is an odd number
select * from emp
where dept_code%2=1;

#Create a clone of the table employee with a name Clone_table and having two columns,
#one with full name and the other with the department code with an alias D_Code
create table Clone_table select concat(First_name, " ", Last_name) as Full_name, dept_code as D_Code from emp;

select * from Clone_Table;

#Delete employee details of "Ajay Kumar" from Clone_Table
delete from clone_table where full_name = "ajay kumar";
select * from clone_table;

#The name of the employee "rahul Srivasatava" has a lower case 'r', make changes in 
#the clone table so that the full_name is written as "Rahul Srivastava" 
update clone_table set full_name = "Rahul Srivastava" where full_name = "rahul Srivastava";


#Convert Full_name from clone table into uppercase.
select upper(full_name), D_code from clone_table;


#Fetch second to fifth record from the department table based on the Highest Budget.
select * from dept
order by Dept_Budget desc 
limit 1,4;

#The employee with the name "Jalpesh Modi" has decided to move into another department, delete the D_code 
#value corresponding to "Jalpesh_Modi" from the clone_table
update clone_table set d_code = null where  full_name = "Jalpesh Modi" ;


#Change the name of the column D_Code to Department_code in clone table.
alter table clone_table rename column D_Code to Department_code;

#Since no mathematical operation will be performed on emp_id in 
#employee table, convert its data type from int to varchar
alter table emp modify column emp_id varchar(20);

select * from emp;
select * from dept;



#Q25 The Company has decided to increase the budget of all the department by 10% , 
#make changes accordingly to fetch old and new budget
select Dept_code, Dept_name, Dept_Budget Old_Budget, Dept_budget * 1.1 as new_budget from dept;

#Q26 What is the name of the department with the lowest budget?
select Dept_Name,Dept_Budget from dept
order by Dept_Budget desc
limit 2;

##Q27 Who are the employees working in the departments with budgets greater than 40,000,000?
select * from emp
where dept_code in (select dept_code from dept where dept_budget >40000000);

#Q28 What is the name of the department with the second highest budget?
select dept_name, dept_budget from dept
where dept_budget <(select max(Dept_Budget) from dept)
order by dept_budget desc
limit 1;

##Q29 How many employees are there in each department?
select count(emp.Emp_ID),dept.dept_name from emp 
inner join dept
on dept.dept_code = emp.dept_code
group by dept.Dept_name;


#Q30 Create a view of Employees working in Sales and Marketing department only.
select emp.*, dept.dept_name from dept
inner join emp
on emp.dept_code = dept.dept_code
where dept_name = "sales and marketing";



























