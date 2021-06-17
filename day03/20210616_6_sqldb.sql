 use sqlDB;
 
 CREATE TABLE testTBL5(
   id      int,
   Fname   varchar(50),
   Lname   varchar(50)
 );
 INSERT INTO testTBL5
   SELECT emp_no, first_name, last_name
     FROM employees.employees;

SELECT * FROM employees.employees;

SELECT * FROM testTBL5;

CREATE TABLE testTBL6
  (SELECT emp_no, first_name, last_name FROM employees.employees)     ;
 
SELECT * FROM testTBL6; 
 
SELECT * FROM testTBL5;

UPDATE testTBL5 SET Lname = '아무개' 
WHERE Fname = 'kyoichi';

SELECT price FROM cart;

UPDATE cart SET price = price * 1.5;

SELECT price FROM cart;

DELETE FROM testTBL5 WHERE Fname='Aamer';

SELECT * FROM testTBL5 WHERE Fname='Aamer';
SELECT count(*) FROM testTBL5 WHERE Fname='Aamer';

SELECT * FROM testTBL5 WHERE Fname='Georgi';
SELECT count(*) FROM testTBL5 WHERE Fname='Georgi'; -- 253
 
DELETE FROM testTBL5 WHERE Fname='Georgi' LIMIT 5; 
SELECT count(*) FROM testTBL5 WHERE Fname='Georgi'; -- 248

CREATE TABLE bigTBL1 (SELECT * FROM employees.employees);
CREATE TABLE bigTBL2 (SELECT * FROM employees.employees);
CREATE TABLE bigTBL3 (SELECT * FROM employees.employees);

show tables;

-- data만 삭제되고 table구조는 남아있음 : WHERE 조건으로 삭제 가능함
DELETE FROM bigTBL1;  -- (WHERE gender='M');

-- data가 모두 삭제되고 컬럼이름만 남음 : data 전체가 삭제됨
TRUNCATE TABLE bigTBL2;

-- data도 삭제되고 table도 삭제됨
-- index 도 삭제됨 / 제약조건도 삭제됨
DROP TABLE bigTBL3;

SELECT * FROM bigTBL1;  

CREATE TABLE memberTBL (SELECT userID, name, addr FROM userTBL LIMIT 8);

SELECT * FROM memberTBL;
DESC memberTBL;

-- table 생성 후에 제약조건(constraint) 설정하기
ALTER TABLE memberTBL 
  ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID); -- PK 지정하기
DESC memberTBL; 
SELECT * FROM memberTBL;
INSERT INTO memberTBL VALUES('bjk', '박제가', '회령');
INSERT INTO memberTBL VALUES('bjs', '박제상', '울산');
INSERT INTO memberTBL VALUES('jys', '장영실', '동래');

-- PRIMARY KEY 값 중복 INSERT 인 경우 에러를 발생시키지 않음
INSERT IGNORE INTO memberTBL VALUES('bjk', '박제가', '회령');
INSERT IGNORE INTO memberTBL VALUES('bjs', '박제상', '울산');
INSERT IGNORE INTO memberTBL VALUES('jys', '장영실', '동래');
SELECT COUNT(*) FROM memberTBL;
SELECT * FROM memberTBL;

 
INSERT INTO memberTBL VALUES('bjk', '박제가', '회령')
  ON DUPLICATE KEY UPDATE name='박제가', addr='회령';
  
INSERT INTO memberTBL VALUES('ydj', '윤동주', '룽징')
  ON DUPLICATE KEY UPDATE name='윤동주', addr='룽징';

-- ON DUPLICATE KEY UPDATE (RECORD 가 추가되지 않음)
-- : PRIMARY KEY 중복이 발생하면 지정한 PRIMARY KEY에 해당하는
--   RECORD 의 컬럼(키)값들이 지정한 값들로 변경됨
INSERT INTO memberTBL VALUES('ydj', '윤동주', '룽징')
  ON DUPLICATE KEY UPDATE name='윤동준', addr='인천';

INSERT INTO memberTBL VALUES('bjk', '박제가', '회령')
  ON DUPLICATE KEY UPDATE name='박제가', addr='회령';
  
SELECT * FROM memberTBL;
SELECT COUNT(*) FROM memberTBL;

-- REPLACE INTO (RECORD 가 추가되지 않음)
-- : PRIMARY KEY 중복이 발생하면 레코드가 추가되지는 않고
--   같은 PRIMARY KEY를 유지하면서 다른 컬럼(키)들의 DATA만 변경됨
REPLACE INTO memberTBL VALUES('ydj', '윤동진', '이천');

SELECT * FROM memberTBL;
SELECT COUNT(*) FROM memberTBL;

-- 현재 DATABASE 확인하기
SELECT DATABASE();

SELECT userID 사용자, SUM(price*amount) 총구매액
FROM cart 
GROUP BY userID;

WITH abc(userID, total)
AS
(SELECT userID, SUM(price*amount)
 FROM cart GROUP BY userID)
SELECT * FROM abc ORDER BY total DESC;

WITH cte_userTBL(addr, maxHeight)
AS
(SELECT addr, MAX(height) FROM userTBL GROUP BY addr)
SELECT AVG(maxHeight * 1.0) '각 지역별 최고키의 평균' FROM cte_userTBL;

SELECT addr, MAX(height) FROM userTBL GROUP BY addr;

