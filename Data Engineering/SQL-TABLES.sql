create table departments (
	dept_no varchar not null,
	dept_name varchar not null,
	primary key (dept_no)
);

create table dept_emp (
	emp_no bigint,
	dept_no varchar not null,
	foreign key (emp_no) references employees (emp_no),
	foreign key(dept_no) references departments (dept_no)
);

create table employees (
	emp_no bigint,
	emp_title_id varchar not null,
	birth_date date,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date date,
	primary key (emp_no)
);

create table dept_manager (
	dept_no varchar not null,
	emp_no bigint,
	foreign key (dept_no) references departments (dept_no),
	foreign key(emp_no) references employees (emp_no)
);

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;


create table salaries (
	emp_no bigint,
	salary bigint,
	primary key (emp_no)
);

create table titles (
	title_id varchar not null,
	title varchar not null,
	primary key (title_id)
);