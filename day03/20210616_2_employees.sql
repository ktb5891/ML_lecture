use employees;

SELECT * FROM employees;
DESC employees;

SELECT count(*) FROM employees;

SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 5;

SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 0, 5;

SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 1, 5;

SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 5 OFFSET 0;  -- (5 개 나오면서) 1 번째부터 5 개
/*
110022	1985-01-01
110511	1985-01-01
110303	1985-01-01
110085	1985-01-01
110183	1985-01-01
*/
SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 5 OFFSET 3;  -- (5 개 나오면서) 3 번째부터 5 개
/*
110303	1985-01-01
110022	1985-01-01
110725	1985-01-01
110085	1985-01-01
110511	1985-01-01
*/
SELECT emp_no, hire_date FROM employees
ORDER BY hire_date
LIMIT 5 OFFSET 3;  -- (5 개 나오면서) 3 번째부터 5 개

SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 5 OFFSET 0;  -- (5 개 나오면서) 1 번째부터 5 개

SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 5 OFFSET 2;

SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 5 OFFSET 0;  -- (5 개 나오면서) 1 번째부터 5 개

SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 5 ;  -- (5 개 나오면서) 1 번째부터 5 개





