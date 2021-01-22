 --1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no,
    employees.first_name,
    employees.last_name,
    employees.sex,
    salaries.salary
from employees
inner join salaries
on employees.emp_no=salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name,last_name,hire_date
from employees
where hire_date between '1986-01-01' and '1986-01-31'
order by hire_date;

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.

select dept_manager.dept_no,departments.dept_name,dept_manager.emp_no,
    employees.last_name,employees.first_name
from dept_manager
inner join departments
on dept_manager.dept_no=departments.dept_no
inner join employees
on dept_manager.emp_no=employees.emp_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_emp.emp_no,employees.last_name,employees.first_name,
    departments.dept_name
from dept_emp
inner join departments 
on dept_emp.dept_no=departments.dept_no
inner join employees
on dept_emp.emp_no=employees.emp_no;

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name,last_name,sex
from employees
where first_name='Hercules'
and last_name like 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
create view empinfo_sales as
select employees.emp_no,employees.first_name,
    employees.last_name,departments.dept_name
from employees
join dept_emp
on employees.emp_no=dept_emp.emp_no  
join departments
on departments.dept_no=dept_emp.dept_no
where departments.dept_no='d007'
order by employees.emp_no;

--table with all the required columns and the corresponding data
select * from empinfo_sales

--7.List all employees in the Sales and Development departments, including their employee number, last name,
--first name, and department name.
select dept_emp.emp_no,employees.last_name,employees.first_name,
    departments.dept_name
from dept_emp
join employees
on employees.emp_no = dept_emp.emp_no
join departments
on departments.dept_no=dept_emp.dept_no
where departments.dept_name='Sales'
or departments.dept_name ='Development'

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select count(*),last_name
from employees
group by last_name
order by count(*) desc;


