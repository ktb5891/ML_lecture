/*
HAVING 절 : GROUP BY 에서의 조건절
GROUP BY 절을 이용해서 그룹을 나눈 후
HAVING 절로 조건을 지정함
*/

-- titles 테이블에서
-- 10만명 이상이 사용하고 있는 직함의 이름과 직원의 인원 수를 출력하세요
SHOW TABLES;

DESC titles;


SELECT title, count(*)
FROM titles
group by title
having count(*) >= 100000;

-- titles 테이블에서
-- 5만명 이상 근무하고 있는 부서의
-- 부서번호와 부서 소속 사원의 인원 수를 출력하세요
show tables;

desc dept_emp;

SELECT dept_no, count(*)
from dept_emp
group by dept_no
having count(*) >= 50000;

