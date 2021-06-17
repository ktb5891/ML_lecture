
SELECT * FROM userTBL WHERE name = '이재명';
SELECT * FROM userTBL;

SELECT userID, name FROM userTBL
WHERE birthYear >= 1900 AND height >= 190;

SELECT * FROM userTBL WHERE name = '윤봉길';

SELECT userID, name FROM userTBL
WHERE birthYear >= 1900 OR height >= 190;

SELECT * FROM userTBL;

SELECT userID, name, height FROM userTBL
WHERE 175 <= height AND height <= 187;

SELECT userID, name, height FROM userTBL
WHERE height BETWEEN 175 AND 187;

SELECT name, height FROM userTBL;

SELECT name, addr FROM userTBL
WHERE addr='해주' OR addr='선천' OR addr='예산';

SELECT name, addr FROM userTBL
WHERE addr IN ('해주', '선천', '예산');

SELECT name, height FROM userTBL
WHERE name LIKE '이%';

SELECT name, height FROM userTBL
WHERE name LIKE '_순신';

-- 안중근 보다 키가 큰 사람 조회하기 : sub query 
SELECT name, height FROM userTBL
WHERE height > (SELECT height FROM userTBL WHERE name='안중근');

-- userTBL에서 
-- 예산에 사는 사람보다 키가 큰 사람의 이름과 키를 출력(조회)하세요 
SELECT name, height FROM userTBL
WHERE height > (SELECT height FROM userTBL WHERE addr = '예산');

-- 예산에 사는 사람의 키
SELECT height FROM userTBL WHERE addr = '예산';

-- ANY : sub query에서 하나의 조건만 만족하면 True
SELECT name, height FROM userTBL
WHERE height >= ANY(SELECT height FROM userTBL WHERE addr='서울');

-- ALL : sub query에서 모든 조건이 만족해야 True
SELECT name, height FROM userTBL
WHERE height >= ALL(SELECT height FROM userTBL WHERE addr='서울');

SELECT height FROM userTBL WHERE addr='서울'; -- 189, 192

SELECT * FROM userTBL;