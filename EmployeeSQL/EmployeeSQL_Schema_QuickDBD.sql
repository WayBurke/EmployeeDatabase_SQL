-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Name: Waynette Burke
-- Module 9: EmployeeSQL Challenge

-- DATA ENGINEERING
-- Table schema for each of the 6 CSV data files

/* Modified with the following changes:
	- Removed quotations around Table and Column names as was provided by QuickDBD
	- Add DROP TABLE statements with CASCADE to remove dependencies
*/	

-- Drop table if exists
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;


--Creating Tables for each of the CSV Data files provided for the project

--Creating the titles Table
CREATE TABLE titles (
    title_id VARCHAR(10)   NOT NULL,
    title VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

-- Creating the Employees Table
CREATE TABLE employees (
    emp_no VARCHAR(10)   NOT NULL,
    emp_title_id VARCHAR(10)   NOT NULL,
    birth_date VARCHAR   NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date VARCHAR   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

--Creating the Salaries Table
CREATE TABLE salaries (
    emp_no VARCHAR(10)   NOT NULL,
    salaries INTEGER   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

--Creating the Department Table
CREATE TABLE departments (
    dept_no VARCHAR(10)   NOT NULL,
    dept_name VARCHAR(100)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

--Creating the Department/Employee Table
CREATE TABLE dept_emp (
    emp_no VARCHAR(10)   NOT NULL,
    dept_no VARCHAR(10)   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no,dept_no
     )
);

--Creating the Department/Manager Table
CREATE TABLE dept_manager (
    dept_no VARCHAR(10)   NOT NULL,
    emp_no VARCHAR(10)   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        dept_no,emp_no
     )
);

--ALTER TABLE used to specify Constraints

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

