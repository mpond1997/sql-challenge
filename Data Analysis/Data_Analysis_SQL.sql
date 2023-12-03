-- List the employee number, last name, first name, sex, and 
--salary of each employee.

select employees.emp_no, 
employees.first_name, 
employees.last_name, 
employees.sex, 
salaries.salary
from employees
join salaries on
salaries.emp_no=employees.emp_no;

-- List the first name, last name, and hire date for the
--employees who were hired in 1986.

select first_name, last_name, hire_date 
from employees
where extract(year from hire_date) = 1986;

-- List the manager of each department along with their department number,
--department name, employee number, last name, and first name.

select departments.dept_name,
dept_manager.dept_no,
dept_manager.emp_no,
employees.first_name,
employees.last_name
from departments
inner join dept_manager on
dept_manager.dept_no=departments.dept_no
inner join employees on
employees.emp_no=dept_manager.emp_no;

--List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name.

select departments.dept_name,
departments.dept_no,
dept_emp.emp_no,
employees.first_name,
employees.last_name
from departments
inner join dept_emp on
dept_emp.dept_no=departments.dept_no
inner join employees on
employees.emp_no=dept_emp.emp_no;

-- List first name, last name, and sex of each employee whose first 
-- name is Hercules and whose last name begins with the letter B.

select first_name, last_name, sex
from employees 
where first_name = 'Hercules' and last_name like 'B%';

-- List each employee in the Sales department, 
-- including their employee number, last name, and first name. 

select employees.first_name,
employees.last_name,
dept_emp.emp_no,
departments.dept_name
from employees
inner join dept_emp on
dept_emp.emp_no=employees.emp_no
inner join departments on
departments.dept_no=dept_emp.dept_no
where dept_name = 'Sales';

-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, 
-- and department name

select employees.first_name,
employees.last_name,
dept_emp.emp_no,
departments.dept_name
from employees
inner join dept_emp on
dept_emp.emp_no=employees.emp_no
inner join departments on
departments.dept_no=dept_emp.dept_no
where departments.dept_name in('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee 
-- last names (that is, how many employees share each last name)
select last_name, count(*) as frequency
from employees
group by last_name
order by frequency desc, last_name;