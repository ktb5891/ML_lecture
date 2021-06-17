USE employees;

SELECT * FROM employees;
SELECT * FROM titles;

SELECT * FROM employees.employees;
SELECT * FROM employees.titles;

SELECT first_name FROM employees;

SELECT first_name, last_name, gender 
FROM employees;

-- database 확인하기
show databases;

DESCRIBE employees;
DESC employees;


-- 컬러명을 바꿔서 조회하기
-- as 키워드 사용 : 생략할 수 있음
-- alias(별칭, 별명)

SELECT first_name as 이름, last_name as 성, gender 
FROM employees;

SELECT first_name 이름, last_name 성, gender 
FROM employees;

-- DATABASE 생성하기
DROP DATABASE IF EXISTS sqldb; 
CREATE DATABASE sqldb;

USE sqldb;

DROP TABLE IF EXISTS userTBL;
-- 회원 테이블
CREATE TABLE userTBL(  
  userID    CHAR(8)  NOT NULL PRIMARY KEY, -- 사용자 아이디
  name      VARCHAR(10) NOT NULL, -- 이름
  birthYear INT NOT NULL, -- 출생 연도
	addr      CHAR(2)  NOT NULL,  -- 지역(서울,부산,광주 - 2 글자만 입력함)
  mobile1   CHAR(3), -- 휴대폰 앞 3 자리 번호
  mobile2   CHAR(8), -- 휴대폰 뒤 8 자리 번호
  height    SMALLINT, -- 키
  mDate     DATE  -- 회원가입날짜
);
DESC userTBL;


INSERT INTO userTBL VALUES('lss', '이순신', 1545, '서울', '011', '11111111', 192, '1600-6-15');
INSERT INTO userTBL VALUES('yks', '유관순', 1902, '천안', '011', '12345678', 172, '1910-6-5');
INSERT INTO userTBL VALUES('ajk', '안중근', 1879, '해주', '016', '84956235', 186, '1890-10-15');
INSERT INTO userTBL VALUES('ljm', '이재명', 1877, '선천', '016', '84572195', 176, '1900-6-15');
INSERT INTO userTBL VALUES('yoon', '윤봉길', 1908, '예산', '011', '84956622', 190, '1920-6-15');
INSERT INTO userTBL VALUES('global', '글로벌', 2010, '서울', '011', '54329865', 189, '2015-6-15');


SELECT * FROM userTBL;




-- 장바구니 테이블
DROP TABLE IF EXISTS cart;
CREATE TABLE cart(
  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,  -- 순번(PK)
  userID      CHAR(8) NOT NULL,  -- 아이디 (FK : foreign key (외래키))
  productName CHAR(8) NOT NULL,  -- 구입한 상품이름
  groupName   CHAR(8),  -- 카테고리
  price       INT NOT NULL,  -- 가격
  amount      SMALLINT NOT NULL, -- 수량 
  FOREIGN KEY(userID) REFERENCES userTBL(userID)
);
set sql_safe_updates=0;
-- 컬럼 구조 변경하기
ALTER TABLE CART MODIFY productName CHAR(8);

DESC CART;

INSERT INTO CART VALUES(NULL,'lss', '노트북', 'IT', 150, 2);
INSERT INTO CART VALUES(NULL,'lss', '갤럭시21', 'IT', 100, 1);
INSERT INTO CART VALUES(NULL,'yks', '수박바', '아이스크림', 10, 1);
INSERT INTO CART VALUES(NULL,'yks', '키위', '과일', 20, 3);
INSERT INTO CART VALUES(NULL,'ajk', '운동화', '신발', 10, 5);
INSERT INTO CART VALUES(NULL,'ljm', '청바지', '의류', 30, 1);
INSERT INTO CART VALUES(NULL,'yoon', 'DB책', '서적', 10, 4);

SELECT * FROM CART;

DELETE FROM CART WHERE productName='노트북';

































