
/*
  GROUP BY 
  
    SELECT 문으로 가져온 모든 ROW(RECORD)를 일정한 기준으로 그룹핑함
    GROUP BY 절로 그룹핑한 후 그룹함수를 사용해서
    각 그룹 내에서의 SUM(), AVG(), MAX(), MIN() 값들을 구할 수 있음   
    

*/

use employees;
show tables;

-- emplyees 테이블에서 1)남자사원, 2)여자사원의 인원수를 출력하세요
SELECT COUNT(*) FROM employees
WHERE gender='M';

SELECT COUNT(*) FROM employees
WHERE gender='F';

SELECT gender, count(*) FROM employees
GROUP BY gender;

-- 각 부서에서 일하고 있는 사원들의 인원수를 출력하세요 
DESC dept_emp;

SELECT dept_no, count(*)
FROM dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no;

SELECT * FROM dept_emp;









