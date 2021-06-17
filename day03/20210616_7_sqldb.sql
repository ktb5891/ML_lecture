/*
숫자 함수

ABS(숫자) : 절댓값 반환함
CEIL(숫자) : 소수점 이하 올림
FLOOR(숫자) : 소수점 이하 버림
ROUND(숫자, 자릿수) : 반올림
TRUNCATE(숫자, 자릿수) : 버림
POW(X, Y) or POWER(X, Y) : X의 Y제곱
MOD(분자, 분모) : 분자를 분모로 나눈 나머지를 반환함
GREATEST(숫자1, 숫자2, 숫자3) : 가장 큰 수 반환함
LEAST(숫자1, 숫자2, 숫자3) : 가장 작은 수 반환함
*/

SELECT abs(22), abs(-55);

SELECT ceil(2.1), ceil(2.3), ceil(2.6), ceil(2.8);

SELECT floor(2.1), floor(2.3), floor(2.6), floor(2.8);

SELECT round(2.1), round(2.3), round(2.6), round(2.8);
SELECT round(222.55567, 0), round(222.55567, 1), round(222.55567, 2), round(222.55567, 3);
SELECT round(222.55567, 1), round(222.55567, -1), round(222.55567, -2);
SELECT round(555.55567, -1), round(555.55567, -2);

SELECT truncate(222.55567, 0), truncate(222.55567, 1), truncate(222.55567, 2), truncate(222.55567, 3);
SELECT truncate(222.55567, 1), truncate(222.55567, -1), truncate(222.55567, -2);
SELECT truncate(555.55567, -1), truncate(555.55567, -2);

SELECT pow(2, 3);

SELECT MOD(10, 8);

SELECT greatest(2, 1, 6, 0);

SELECT least(2, 1, 6, 0);

use employees;

SELECT * FROM salaries;

/*
급여 테이블에서 salaries
사원들의 사원번호, 10% 인상된 급여, 소수점이하 올린 값, 소수점이하 버린 값, 반올림한 값을
출력하세요.
*/
SELECT emp_no, salary * 1.1, ceil(salary * 1.1), 
       floor(salary * 1.1), round(salary * 1.1)
FROM salaries;

SELECT emp_no, salary * 1.1, ceil(salary * 1.1), 
       floor(salary * 1.1), round(salary * 1.1, 0)
FROM salaries;

       
        



SELECT emp_no, salary





