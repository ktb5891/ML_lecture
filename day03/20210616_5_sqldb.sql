 use sqlDB;
 DROP TABLE testTBL2;
 CREATE TABLE testTBL2(
  id       int,
  userName char(3),
  age      int  
 );
 show tables;
 
 INSERT INTO testTBL2 VALUES(1, '이순신', 48);
 INSERT INTO testTBL2 VALUES(2, '안중근', 30);
 INSERT INTO testTBL2 VALUES(3, '윤봉길', 25);
 INSERT INTO testTBL2 VALUES(4, '양만춘', 32);
 INSERT INTO testTBL2(id, userName) VALUES(5, '사임당');
 
 SELECT * FROM testTBL2;
/*
1	이순신	48
2	안중근	30
3	윤봉길	25
4	양만춘	32
5	사임당	(NULL)
*/
DROP TABLE testTBL3; 
CREATE TABLE testTBL3(
id       int AUTO_INCREMENT PRIMARY KEY,
userName char(3),
age      int
); 

SELECT * FROM testTBL3;

INSERT INTO testTBL3 VALUES(NULL,'이재명', 56);
INSERT INTO testTBL3 VALUES(NULL,'강감찬', 72);
INSERT INTO testTBL3 VALUES(NULL,'김상옥', 52);
DESC testTBL3;

-- LAST_INSERT_ID() <-- 마지막으로 생성된 SUTO_INCREMENT 값을 반환함
SELECT LAST_INSERT_ID(); -- 3

ALTER TABLE testTBL3 AUTO_INCREMENT=100;

INSERT INTO testTBL3 VALUES(NULL, '김규식', 46);

SELECT * FROM testTBL3;

DROP TABLE testTBL4;
CREATE TABLE testTBL4(
  id       int AUTO_INCREMENT PRIMARY KEY,
  userName char(3),
  age      int
);
ALTER TABLE testTBL4 AUTO_INCREMENT=1000;
-- 증가값 설정하기
SET @@auto_increment_increment=3;
INSERT INTO testTBL4 VALUES(NULL,'이재명', 56);
INSERT INTO testTBL4 VALUES(NULL,'강감찬', 72);
INSERT INTO testTBL4 VALUES(NULL,'김상옥', 52);

SELECT * FROM testTBL4;
/*
1000	이재명	56
1003	강감찬	72
1006	김상옥	52
*/

SHOW VARIABLES LIKE 'auto_inc%';

/*
auto_increment_increment	3  : 증가값
auto_increment_offset	    1  : 초기값
*/






 
 
 
 
 