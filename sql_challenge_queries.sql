--1. List the employee number, last name, first name, sex, and salary of each employee.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary from employees 
join salaries
on employees.emp_no = salaries.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date from employees
WHERE hire_date > '01/01/86' AND hire_date < '01/01/87'
ORDER BY hire_date;


--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
select employees.first_name, employees.last_name, view_1.dept_no, view_1.dept_name, view_1.emp_no 
from employees
JOIN
(select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no from dept_manager
join departments
on departments.dept_no = dept_manager.dept_no) as view_1
on employees.emp_no = view_1.emp_no;
--or if no subquery was needed
SELECT employees.first_name, employees.last_name, dept_manager.dept_no, departments.dept_name, dept_manager.emp_no
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex from employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select distinct (employees.last_name), count(*) from employees
group by employees.last_name;



