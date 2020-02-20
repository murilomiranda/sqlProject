CREATE DATABASE Organizaton;

CREATE TABLE departments(
	dept_no INT NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (depto_no)
) ENGINE=INNODB;

CREATE TABLE employees(
	emp_id INT NOT NULL,
    birth_date DATE,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    gender VARCHAR(255),
    hire_date DATE,
    PRIMARY KEY (emp_id)
) ENGINE=INNODB;

CREATE TABLE salaries(
	from_date DATE NOT NULL,
	emp_id INT,
    salary DOUBLE NOT NULL,
    to_date DATE NOT NULL,
	PRIMARY KEY (from_date),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
) ENGINE=INNODB;

CREATE TABLE dept_manager(
	dept_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    emp_id INT,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (from_date) REFERENCES salaries(from_date),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
) ENGINE=INNODB;

CREATE TABLE dept_emp(
	dept_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    emp_id INT,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (from_date) REFERENCES salaries(from_date),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
) ENGINE=INNODB;