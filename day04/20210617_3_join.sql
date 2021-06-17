/*
	join
    
    from 절에서 두 개의 테이블을 지정함 (, 으로 구분함)
    
    select 컬럼1, 컬럼2, 컬럼3
    from 테이블1, 테이블2
    
*/

-- 각 사원들의 사원번호, 부서번호, 부서이름을 출력하세요
-- 별칭(alias) 사용하기

select B.emp_no, A.dept_no, A.dept_name
from departments A, dept_emp B;

select emp_no, B.dept_no, dept_name
from departments A, dept_emp B;

-- dept_no 컬럼은 양쪽 테이블에 다 있으므로
-- 어떤 테이블에 있는 컬럼인지 지정해 주어야 함
-- departments.dept_no OR dept_emp.dept_no
-- 양쪽 테이블 모두에 있는 컬럼이 아니면
-- 어떤 테이블인지 지정해 주지 않아도 됨

-- 각 사원들의 사원번호, 부서번호, 부서이름을 출력하세요
-- (사원 번호를 기준으로 오름차순으로 정렬하세요)
select B.emp_no, A.dept_no, A.dept_name
from departments A, dept_emp B
order by B.emp_no;

-- 각 사원들의 사원번호, first_name, 부서번호를 출력하세요
use employees;

desc employees;
desc dept_emp;

select B.emp_no, first_name, dept_no
from employees A, dept_emp B
where A.emp_no = B.emp_no;

-- 각 사원들의 사원번호(emp_no), first_name, 현재 받는 급여액(salary)을 출력하세요
desc employees;
desc salaries;

select A.emp_no, first_name, salary
from employees A, salaries B
where A.emp_no = B.emp_no
and to_date = '9999-01-01';

-- 각 사원들의 사원번호, first_name, 부서이름를 출력하세요
desc dept_emp;
desc departments;

select A.emp_no, first_name, B.dept_name
from employees A, departments B, dept_emp C
where A.emp_no = C.emp_no
and B.dept_no = C.dept_no
order by emp_no asc;

