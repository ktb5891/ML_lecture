 /*
  날짜 함수
  
  now(), sysdate(), current_timestamp(): 현재 날짜와 시간을 반환함
  curdate(), current_date() : 현재 날짜를 반환함
  curtime(), current_time() : 현재 시간을 반환함
  date_add(날짜, INTERVAL 기준값) : 날짜에서 기준값 만큼 더함
  (YEAR, MONTH, DAY, HOUR, MINUTE, SECOND)
  date_sub(날짜, INTERVAL 기준값) : 날짜에서 기준값 만큼 빼줌
  (YEAR, MONTH, DAY, HOUR, MINUTE, SECOND)  
 */
 SELECT now();
 SELECT sysdate();
 SELECT current_timestamp();
 
 SELECT curdate();
 SELECT current_date();
 
 -- 날짜 더하기
 SELECT now(), date_add(now(), INTERVAL 100 day);
 SELECT hire_date, date_add(hire_date, INTERVAL 100 day)
 FROM employees;
 
 -- 날짜 빼기
 SELECT now(), date_sub(now(), INTERVAL 100 day);
 SELECT hire_date, date_sub(hire_date, INTERVAL 100 day)
 FROM employees;
 
 /*
 YEAR(날짜) : 날짜의 연도를 반환함
 MONTH(날짜) : 날짜의 월을 반환함
 MONTHNAME(날짜) : 날짜의 월을 영어로 반환함
 DAYNAME(날짜) : 날짜의 요일을 영어로 반환함
 DAYOFMONTH(날짜) : 날짜의 월별 일자를 반환함
 DAYOFWEEK(날짜) : 날짜의 주별 일자를 반환함
   ㄴ 일요일(1), 월요일(2), 화요일(3), ..., 토요일(7)
 WEEKDAY(날짜) : 날짜의 주별 일자를 가져옴   
   ㄴ 월요일(0), 화요일(1), ..., 일요일(7)
 DAYOFYEAR(날짜) : 일년을 기준으로 한 날짜까지의 날수
 WEEK(날짜) : 일년 중 몇 번째 주
 FROM_DAYS(날짜) : 00년 00월 00일부터 날 수 만큼 지난 날짜를 반환함
 TO_DAYS(날짜) :  00년 00월 00일부터 날짜까지의 일 수를 반환함
 
 */
 
SELECT now(), year(now());
SELECT now(), month(now());
SELECT now(), monthname(now());
SELECT now(), dayname(now());
SELECT now(), dayofweek(now());
SELECT now(), weekday(now());
SELECT now(), dayofyear(now());
SELECT now(), week(now());

/*
 DATE_FORMAT(날짜, 형식) : 날짜를 형식에 맞게 반환함
 년도 : %Y(4자리), %y(2자리)
 월 :  %M(긴 월이름) / %m(월을 숫자로 : 01, 02, 03, ...) / 
       %b(짧은 월이름) / %c(월을 숫자로 : 1, 2, 3, ...))
 요일 : %W(긴 요일) / %a(짧을 요일) / %w(0-일요일, 1-월요일)
 일 : %D(1st, 2nd, 3rd, ...) / %d(01,02,03,...) / %e()1, 2, 3, ...)
     %j(일년 중 날짜 : 001,002,003,...)
 시 : %l(12시간제- 1, 2, 3, ...) / %k(24시간제 - 1, 2, 3, ..., 12, 13, 14, ...)    
     %h(12시간제- 01, 02, 03, ...) / %H(24시간제 - 01, 02, 03, ..., 12, 13, 14, ...)    
     %I(12시간제- 01, 02, 03, ...) 
 분 : %i(00,01,...)    
 초 : %S(00,01,02,...) / %s(0, 1, 2, 3, ...)
 시간 : %r(12시간제 시간) / %T(24시간제 시간)
 주 : %U(일요일을 기준으로 계산한 주)
      %u(월요일을 기준으로 계산한 주)
 오전/오후 : %p(AM/PM)
*/

SELECT now(), date_format(now(), '%Y년 %m월 %d일 %H시 %i분 %S초');


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 