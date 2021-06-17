 -- 사용자 별 총구매액
 SELECT userID 사용자, SUM(price * amount) 총구매액
 FROM cart
 GROUP BY userID;
 
 -- 총구매액이 50이 넘는 사람만 조회하기
SELECT userID 사용자, SUM(price * amount) 총구매액
FROM cart
-- WHERE SUM(price * amount) > 60
-- GROUP BY 에서는 WHERE 대신에 HAVING을 사용함
GROUP BY userID;
 
SELECT userID 사용자, SUM(price * amount) 총구매액
FROM cart
GROUP BY userID
HAVING SUM(price * amount) > 50;
/*
lss	400
yks	60
*/

-- 총구매액이 50이 넘는 사람만 조회하기
-- 총구매액 오름차순으로 정렬하기
SELECT userID 사용자, SUM(price * amount) 총구매액
FROM cart
GROUP BY userID
HAVING SUM(price * amount) > 50
ORDER BY SUM(price * amount);
/*
yks	60
lss	400  <-- ORDER BY SUM(price * amount)
*/

SELECT num, groupName, SUM(price * amount) 비용
FROM cart
GROUP BY groupName, num
WITH ROLLUP;
/*
2	IT	300
3	IT	100
	IT	400
4	과일	60
	과일	60
1	서적	40
	서적	40
5	신발	50
	신발	50
		550
*/

SELECT num, groupName, price, amount
FROM cart;

SELECT * FROM cart;


SELECT num, groupName, SUM(price * amount) 비용
FROM cart
GROUP BY groupName
WITH ROLLUP;
/*
2	IT	400
4	과일	60
1	서적	40
5	신발	50
5		550
*/



