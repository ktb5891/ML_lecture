use sqlDB;

DROP TABLE IF EXISTS cart2;
-- cart 테이블 모든 컬럼으로 cart2 테이블 생성하기
CREATE TABLE cart2(SELECT * FROM cart);
SELECT * FROM cart;
SELECT * FROM cart2;
select * from usertbl;

DROP TABLE IF EXISTS cart3;
-- cart 테이블의 userID, productName 컬럼으로 cart3 테이블 생성하기
CREATE TABLE cart3(SELECT userID, productName FROM cart);
SELECT * FROM cart3;

SELECT userID, amount FROM cart
ORDER BY userID;

-- GROUP BY 
SELECT userID, amount FROM cart;

SELECT userID, SUM(amount) FROM cart
GROUP BY userID;

SELECT userID '아이디', SUM(amount) 구매합계
FROM cart GROUP BY userID;
 
SELECT userID '사용자 아이디', SUM(amount) '총 구매 개수'
FROM cart GROUP BY userID; 

SELECT userID '사용자 아이디', SUM(price * amount) '총 구매 금액'
FROM cart GROUP BY userID;

-- AVG() : 평균 구하기 : 결과를 실수로 반환함
SELECT AVG(amount) '평균 구매 개수' FROM cart;
SELECT amount '구매 개수' FROM cart;
SELECT SUM(amount) '구매 개수' FROM cart;
SELECT COUNT(*) FROM cart;

SELECT userID, amount FROM cart;
SELECT * FROM cart;

SELECT userID, AVG(amount) '사용자별 평균 구매 개수' FROM cart
GROUP BY userID;

SELECT price FROM cart;

SELECT SUM(price) FROM cart;

SELECT AVG(price) FROM cart;

SELECT name, height FROM userTBL;

-- GROUP BY 를 하지 않으면 원하는 결과가 나오지 않음
SELECT name, MAX(height), MIN(height) FROM userTBL;

-- GROUP BY name 를 하면 name 을 기준으로 그룹이 형성됨
-- 같은 이름 중에서 키가 제일 큰 사람, 제일 작은 사람을 검색함
SELECT name, MAX(height), MIN(height) FROM userTBL
GROUP BY name;

-- sub query 사용하기
SELECT name, height FROM userTBL
WHERE height = (SELECT MAX(height) FROM userTBL)  -- '키가 제일 큰 사람'
   OR height = (SELECT MIN(height) FROM userTBL);  -- '키가 제일 작은 사람'

SELECT COUNT(*) FROM userTBL; -- 9
SELECT * FROM userTBL;

-- 휴대폰을 가지고 있는 사용자 수
SELECT COUNT(mobile1) '휴대폰 있는 사람' FROM userTBL; -- 8

INSERT INTO userTBL VALUES('eul', '을지문덕', 629, '평양', NULL, NULL, 190, '659-01-01');
