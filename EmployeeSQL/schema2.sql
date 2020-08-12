create table departments(
    dept_no varchar(20),
    dept_name varchar(30),
    primary key (dept_no));
	
create table salaries(
	emp_no int,
    salary int,
    primary key(emp_no));
	
create table titles(
    title_id varchar(10),
    title varchar(30),
    primary key (title_id));
    
    
create table employees(
    emp_no int,
    emp_title_id varchar(30),
    birth_date date,
    first_name varchar(30),
    last_name varchar(30),
    sex varchar(4),
    hire_date date,
    primary key (emp_no),
    foreign key (emp_title_id) references titles(title_id));

    
create table dept_emp(
    emp_no int,
    dept_no varchar(20),
    CONSTRAINT PK_dept_emp PRIMARY KEY (emp_no,dept_no),
    foreign key (emp_no) references employees(emp_no),
    foreign key(dept_no) references departments(dept_no));

    

create table dept_manager(
    dept_no varchar(30),
    emp_no int,
    CONSTRAINT PK_dept_manager PRIMARY KEY (dept_no,emp_no),    
    foreign key(dept_no) references departments(dept_no),
    foreign key(emp_no) references employees(emp_no));
    
    

    