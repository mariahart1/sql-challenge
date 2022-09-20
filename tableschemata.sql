create table titles (
	title_id varchar(10) not NULL,
	title varchar (50) not NULL,
	PRIMARY KEY (title_id)
	)

create table employees (
	emp_no varchar(20) not NULL,
	emp_title_id varchar(20) not NULL,
	birth_date varchar(20) not NULL,
	first_name varchar(50) not NULL,
	last_name varchar(50) not NULL,
	sex varchar(1) not NULL,
	hire_date varchar(20) not NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id) 
	)

create table salaries (
	emp_no varchar(20) not NULL,
	salary int not NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	)

create table dept_emp (
	emp_no varchar(20) not NULL,
	dept_no varchar(20) not NULL,
	PRIMARY KEY (emp_no, dept_no)
	)
	
create table departments (
	dept_no varchar(20) not NULL,
	dept_name varchar(20) not NULL,
	PRIMARY KEY (dept_no)
	)
	
create table dept_manager (
	dept_no varchar(20) not NULL,
	emp_no varchar(20) not NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
	)