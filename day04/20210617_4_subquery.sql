/*
Sub Query : 서브 쿼리
*/

-- 현재 평균 급여보다 더 많은 급여를 받는 사원들의 사원번호, 급여액을 출력하세요
desc salaries;
select emp_no, salary
from salaries
where salary > (select avg(salary)
				from salaries
				where to_date = '9999-01-01')
and to_date = '9999-01-01';
-- 현재 평균 급여를 출력하세요
select avg(salary)
from salaries
where to_date = '9999-01-01';

-- d001 부서(부서번호:dept_no)에서 근무 중인 사원들의 사원번호, first_name 을 출력하세요
desc employees;
desc dept_emp;

select A.emp_no, first_name
from employees A, dept_emp B
where A.emp_no = B.emp_no
and dept_no = 'd001';

-- d001 부서에 있는 사원번호를 출력하세요
select emp_no
from dept_emp
where emp_no in (select emp_no from dept_emp where dept_no = 'd001');

-- 1960년생 이후의 현재 근무하고 있는 사원들의 사원번호, 부서번호를 출력하세요
desc dept_emp;
desc employees;

select A.emp_no, A.dept_no
from dept_emp A, employees B
where A.emp_no = B.emp_no
and B.birth_date >= '1960-01-01';
