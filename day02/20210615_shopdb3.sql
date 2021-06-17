/*
  View (뷰) : 실제 테이블은 아닌 가상의 테이블
*/
use shopdb;

SELECT memberID, memberAddress FROM memberTBL;

CREATE VIEW v_memberTBL
AS 
SELECT memberID, memberAddress FROM memberTBL;

SELECT * FROM v_memberTBL;



-- STORED PROCEDURE (cf. Orcal PL/SQL)

SELECT * FROM productTBL;
DESC productTBL;
INSERT INTO productTBL(productName, cost, amount)
VALUES('자동차', 30000000, 653);
INSERT INTO productTBL(productName, cost, amount)
VALUES('세탁기', 1000000, 84);
INSERT INTO productTBL(productName, cost, amount)
VALUES('냉장고', 2000000, 65);

SELECT * FROM memberTBL WHERE memberName = '유관순';
SELECT * FROM productTBL WHERE productName = '냉장고';

-- PROCEDURE 생성하기
DELIMITER //
  CREATE PROCEDURE testProc()
  BEGIN
    SELECT * FROM memberTBL WHERE memberName = '유관순';
    SELECT * FROM productTBL WHERE productName = '냉장고';
END //
DELIMITER ;

CALL testProc() ;

use shopdb;

-- PROCEDURE 생성하기
DELIMITER //
  CREATE PROCEDURE getProducts()
    BEGIN
      SELECT * FROM productTBL;
    END //
DELIMITER ;    

CALL getProducts() ;

SELECT * FROM productTBL;

CALL getProducts() ;

-- PROCEDURE 삭제하기
DROP PROCEDURE getProducts;

-- 생성된 PROCEDURE 목록 보기
SHOW PROCEDURE STATUS;







