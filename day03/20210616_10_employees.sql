/*
  그룹(집계)함수
  
   COUNT(컬럼명) : 해당 컬럼의 값이 있는 행(row-record)의 개수를 반환함
   SUM(컬럼명) : 해당 컬럼의 값들의 합을 반환함
   AVG(컬럼명) : 해당 컬럼의 값들의 평균을 반환함
   MAX(컬럼명) : 해당 컬럼의 값들 중 최댓값을 반환함
   MIN(컬럼명) : 해당 컬럼의 값들 중 최솟값을 반환함
   
*/

-- employees 테이블에서 사원의 총인원수를 출력(조회)하세요
SELECT COUNT(*) FROM employees; -- 300024
SELECT concat(COUNT(*), ' 명') FROM employees; -- 300024 명

use sqldb;
SELECT concat(count(*), ' 명') FROM sqldb.userTBL; -- 9 명

use employees;
-- employees 테이블에서 남자 사원의 인원 수를 출력하세요

SELECT count(*) FROM employees
WHERE gender='M';

DESC employees;
DESC salaries;


select salary from salaries limit 5;
-- salaries 테이블에서 (현재 근무 중인) 사원들의 총급여를 출력하세요
SELECT SUM(salary) FROM salaries
WHERE to_date='9999-01-01';

-- salaries 테이블에서 최고급여를 받는 사원의 사원번호를 출력하세요
SELECT emp_no, MAX(salary) FROM salaries;

SELECT emp_no 
FROM salaries
WHERE salary = (SELECT MAX(salary) FROM salaries); -- 43624

SELECT MAX(salary) FROM salaries; -- 158220

show tables;
DESC dept_emp;
SELECT * FROM dept_emp limit 10;

-- dept_emp 테이블에서
-- d005 부서의 사원 중 근무 중인 사원들의 인원을 출력하세요
-- to_date = '9999-01-01'
SELECT COUNT(*) FROM dept_emp
WHERE dept_no='d005' AND to_date = '9999-01-01'; -- 61386 명



DESC salaries;















