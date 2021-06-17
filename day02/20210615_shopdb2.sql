use shopdb;

CREATE TABLE indexTBL(
  first_name varchar(14),
  last_name varchar(16),
  hire_date date
);


SELECT * FROM employees.employees;
SELECT count(*) FROM employees.employees;
SELECT * FROM employees.employees LIMIT 500;

DESC indexTBL;


  
SELECT first_name, last_name, hire_date 
FROM employees.employees 
LIMIT 500;

DESC employees.employees;

SELECT * FROM indexTBL;

INSERT INTO indexTBL
  SELECT first_name, last_name, hire_date 
  FROM employees.employees 
  LIMIT 500;
  
SELECT * FROM indexTBL;

SELECT COUNT(*) FROM indexTBL;

SELECT * FROM indexTBL WHERE first_name='Mary';

-- 인덱스(찾아보기) 생성하기
CREATE INDEX idx_indexTBL_firstname ON indexTBL(first_name); 

-- 인덱스 삭제하기
ALTER TABLE indexTBL DROP INDEX idx_indexTBL_firstname;




