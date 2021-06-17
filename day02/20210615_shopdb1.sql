use shopdb;

CREATE TABLE shopdb.membertbl (
  memberID CHAR(8) NOT NULL,
  memberName CHAR(5) NOT NULL,
  memberAddress CHAR(20) NULL,
  PRIMARY KEY (memberID)
);  
show tables;
use employees;
show tables;

use shopdb;
CREATE TABLE `shopdb`.`producttbl` (
  `productName` CHAR(4) NOT NULL,
  `cost` INT NOT NULL,
  `makeDate` DATE NULL,
  `company` CHAR(5) NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`productName`));
  
SELECT * FROM shopdb.memberTBL;  
SELECT * FROM memberTBL; 
  
INSERT INTO `shopdb`.`memberTBL` (`memberID`, `memberName`, `memberAddress`) VALUES ('turtle', '이순신', '서울특별시');
INSERT INTO `shopdb`.`memberTBL` (`memberID`, `memberName`, `memberAddress`) VALUES ('ahn', '안중근', '해주시');
INSERT INTO `shopdb`.`memberTBL` (`memberID`, `memberName`, `memberAddress`) VALUES ('yoon', '윤봉길', '예산군');
INSERT INTO `shopdb`.`memberTBL` (`memberID`, `memberName`, `memberAddress`) VALUES ('yoo', '유관순', '천안시');

SELECT memberName FROM memberTBL;
SELECT memberID FROM memberTBL;
SELECT memberAddress FROM memberTBL;
SELECT memberID, memberAddress FROM memberTBL;

SELECT * FROM memberTBL;

SELECT * FROM memberTBL WHERE memberName='이순신';
SELECT * FROM memberTBL WHERE memberID='turtle';
SELECT * FROM memberTBL WHERE memberAddress='천안시';


use employees;



use shopdb;
CREATE TABLE testTBL(stdno int);
