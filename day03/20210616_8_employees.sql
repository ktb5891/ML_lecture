/*
 문자열 함수 : 컬럼에 저장된 문자열에 대한 작업을 하는 함수
  concatenate - 연결하다
 concat(문자열1, 문자열2, 문자열3, ...) : 문자열 합치기
 
 insert(문자열_old, 시작위치, 길이, 문자열_new)
   : 문자열_old의 시작위치부터 길이만큼 문자열을 제거하고
     그 자리에 문자열_new 를 삽입함
     
 replace(문자열, 문자열_old, 문자열_new)  
   : 문자열에서 문자열_old을 문자열_new로 변경함
   
 instr(문자열1, 문자열2)   
   : 문자열1에서 문자열2를 찾아서 위치(index)를 반환함
     위치(index)는 1부터 시작하고 문자열2를 찾지 못하면 0을 반환함
*/

SELECT concat('aaa', ' bbb', ' ccc');

-- 시작위치부터 길이만큼 문자열을 제거
SELECT insert('aaaaa', 2, 2, 'bbb'); -- abbbaa

SELECT insert('aaaaa', 2, 0, 'bbb'); -- abbbaaaa

SELECT replace('aabbcc', 'bb', 'ff'); -- aaffcc

SELECT instr('abcdefg', 'cde');  -- 3

SELECT instr('abcdefg', 'ttt');  -- 0

/*
  left(문자열, 개수) : 문자열의 왼쪽부터 지정한 개수만큼 반환함
  right(문자열, 개수) : 문자열의 오른쪽부터 지정한 개수만큼 반환함
  mid(문자열, 시작위치, 개수) : 문자열에서 시작위치부터 개수만큼 반환함
  substring(문자열, 시작위치, 개수) : 문자열에서 시작위치부터 개수만큼 반환함
  ltrim(문자열) : 문자열의 왼쪽 공백 제거
  rtrim(문자열) : 문자열의 오른쪽 공백 제거
  trim(문자열) : 문자열의 양쪽 공백 제거
*/

SELECT left('globalit',3);
SELECT right('globalit',3);
SELECT mid('globalit', 3, 3);

SELECT substring('globalit', 2, 4);

SELECT concat('[', '     global     ', ']');
SELECT concat('[', ltrim('     global     '), ']');
SELECT concat('[', rtrim('     global     '), ']');

/*
lcase(), lower() : 문자열을 모두 소문자로 변경함
ucase(), upper() : 문자열을 모두 대문자로 변경함
reverse() : 문자열을 거꾸로 반환함
*/
SELECT lcase('GLOBALIT');
SELECT Ucase('globalit');

SELECT reverse('globalit');

/*
  employees 테이블에서
  사원이 이름을 출력하세요 
  - 성과 이름을 연결해서 하나의 문자열로 반환하세요
*/
SELECT concat(first_name, ' ',last_name)
FROM employees;

SELECT lcase(concat(first_name, ' ',last_name))
FROM employees;

SELECT ucase(concat(first_name, ' ',last_name))
FROM employees;














