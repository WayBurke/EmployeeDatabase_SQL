-- Name: Waynette Burke
-- Module 9: EmployeeSQL Challenge

-- DATA ANALYSIS
-- SELECT statements to answer questions


-- Data was manually entered into the tables via the import function in pgAdmin 4

--GENERAL VIEW OF EACH OF THE TABLES
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments; 
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;


/************************************************
     --ANSWERS TO THE CHALLENGE QUESIONS--
************************************************/

--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no,e.last_name,e.first_name, e.sex, s.salaries
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no
ORDER BY e.emp_no ;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name,last_name,hire_date
FROM employees
WHERE hire_date LIKE '%1986'
ORDER BY hire_date, first_name;

--3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.

SELECT m.dept_no, d.dept_name,e.emp_no,e.last_name,e.first_name
FROM dept_manager AS m
LEFT JOIN employees AS e ON
e.emp_no = m.emp_no
LEFT JOIN departments as d ON
d.dept_no = m.dept_no
ORDER BY d.dept_no;

--4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.

SELECT d.dept_no, e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de ON
e.emp_no = de.emp_no
LEFT JOIN departments as d ON
d.dept_no = de.dept_no
ORDER BY d.dept_no;


--5. List first name, last name, and sex of each employee whose first name is Hercules and whose
-- last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
LEFT JOIN dept_emp AS de ON
e.emp_no = de.emp_no
LEFT JOIN departments as d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;


--7. List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
LEFT JOIN dept_emp AS de ON
e.emp_no = de.emp_no
LEFT JOIN departments as d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
ORDER BY d.dept_name, e.emp_no;


--8. List the frequency counts, in descending order, of all the employee last names (that is, how many 
-- employees share each last name).

SELECT last_name, COUNT (last_name) as "Count of LastName"
FROM employees
GROUP BY last_name
ORDER BY "Count of LastName" DESC;
