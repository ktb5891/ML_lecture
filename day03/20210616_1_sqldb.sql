use sqlDB;

-- ANY : sub query에서 하나의 조건만 만족하면 True
SELECT name, height FROM userTBL
WHERE height >= ANY(SELECT height FROM userTBL WHERE addr='서울');

-- ALL : sub query에서 모든 조건이 만족해야 True
SELECT name, height FROM userTBL
WHERE height >= ALL(SELECT height FROM userTBL WHERE addr='서울');

SELECT name, height FROM userTBL WHERE addr='서울'; -- 189, 192

SELECT * FROM userTBL;


-- 20210616

SELECT name, height FROM userTBL 
WHERE height IN (SELECT height FROM userTBL WHERE addr='서울');

SELECT name, height FROM userTBL 
WHERE height IN (189, 192);


-- 순서 정하기 : 정렬  (ORDER BY : 기본적으로 오름차순 정렬)
-- ASC (ascending) : 오름차순
-- DESC (descending) : 내림차순


DESC userTBL;

SELECT name, mDate FROM userTBL
ORDER BY mDate;

SELECT name, mDate FROM userTBL
ORDER BY mDate ASC;

SELECT name, mDate FROM userTBL
ORDER BY mDate DESC;

-- height DESC : 먼저 적용됨
-- name ASC : height 정렬 기준으로 name이 오름차순으로 정렬됨
-- height 가 같은 사람 중에서  name 을 내림차순으로 정렬하기
SELECT name, height FROM userTBL
ORDER BY height DESC, name ASC;

-- name 이 같은 사람 중에서  height 를 내림차순으로 정렬하기
SELECT name, height FROM userTBL
ORDER BY name ASC, height DESC ;

SELECT * FROM userTBL;

DESC userTBL;

INSERT INTO userTBL VALUES('kim', '김유신', 595, '진천', '010','65988754', 192, '600-01-01');
INSERT INTO userTBL VALUES('k', '김유신', 1890, '서울', '010','65412598', 185, '1920-02-01');

DELETE FROM userTBL WHERE name='김상옥'; 

SELECT addr, name FROM userTBL ORDER BY addr;

-- 같은 값 중복 제거 : DISTINCT
SELECT DISTINCT addr FROM userTBL ORDER BY addr;

SELECT addr FROM userTBL ORDER BY addr;

-- 아래의 경우, name이 다른 사람들이 있으므로 DISTINCT 적용이 안 됨
SELECT DISTINCT addr, name FROM userTBL ORDER BY addr;

