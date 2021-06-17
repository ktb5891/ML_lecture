use employees;
show tables;
-- detp_manager 테이블에서
-- 각 부서별 [일하고 있는] 매니저의 인원수를 출력하세요
DESC dept_manager;

SELECT dept_no, count(*) '현재 매니저 인원 수'
FROM dept_manager
WHERE to_date = '9999-01-01'
GROUP BY dept_no;

-- dept_manager 테이블에서
-- 각 부서별 [퇴사한] 매니저의 인원 수를 출력하세요

SELECT dept_no, count(*) '현재 매니저 인원 수'
FROM dept_manager
WHERE to_date = '1990-01-01'
GROUP BY dept_no;

-- salaries 테이블에서
-- 급여 수령 시작 일별(from_date) 급여 총합을 출력하세요
-- from_date, SUM(salary)
DESC salaries;

SELECT from_date, SUM(salary)
FROM salaries
GROUP BY from_date;

-- salaries 테이블에서
-- 급여 수령 시작 일별(from_date) 급여 평균을 출력하세요
-- from_date, AVG(salary)
SELECT from_date, round(AVG(salary),2)
FROM salaries
group by from_date;

-- salaries 테이블에서
-- 급여 수령 시작 일별(from_date) 최고 급여액을 출력하세요
-- from_date, MAX(salary)
SELECT from_date, max(salary)
FROM salaries
group by from_date;

-- salaries 테이블에서
-- 급여 수령 시작 일별(from_date) 최저 급여액을 출력하세요
-- from_date, MIN(salary)
SELECT from_date, MIN(salary)
FROM salaries
group by from_date;


