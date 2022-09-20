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
	
		
	
--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left outer join salaries s on e.emp_no=s.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date like '%1986'

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from dept_manager dm
left outer join employees e on dm.emp_no=e.emp_no
left outer join departments d on dm.dept_no=d.dept_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
from employees e
join dept_emp de on e.emp_no=de.emp_no
join departments d on d.dept_no=de.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
from employees
where first_name='Hercules'
and last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, e.last_name, e.first_name
from employees e
join dept_emp de on e.emp_no=de.emp_no
join departments d on d.dept_no=de.dept_no
where d.dept_name='Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no=de.emp_no
join departments d on d.dept_no=de.dept_no
where d.dept_name in ('Sales', 'Development')

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(*)
from employees
group by last_name order by count desc