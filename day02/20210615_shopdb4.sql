set sql_safe_updates=0; -- 일시적인 safe모드 해제 

SELECT * FROM memberTBL;

DESC memberTBL;

INSERT INTO memberTBL VALUES('yang', '양만춘', '안시성');

UPDATE memberTBL SET memberAddress='인천시'
WHERE memberName='유관순';

DELETE FROM memberTBL WHERE memberName='양만춘';
DROP TABLE deletedMemberTBL;
CREATE TABLE deletedMemberTBL(
  memberID char(8),
  memberName char(5),
  memberAddress char(20),
  deleteDate date  -- 탈퇴한 날짜
);

DESC deletedMemberTBL;

use shopdb;

DELIMITER //
CREATE TRIGGER t_deletedMemberTBL -- 트리거 이름
  AFTER DELETE -- 삭제 후에 동작하게 설정하기
  ON memberTBL -- 트리거를 적용할 테이블 이름 지정하기
  FOR EACH ROW -- 각각의 행(ROW)마다 적용함
BEGIN
  -- 테이블의 내용을 백업테이블(deletedMemberTBL)에 삽입함
  -- OLD(memberTBL).memberID : memberTBL에서 삭제된 memberID
  INSERT INTO deletedMemberTBL
  VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE());  
END //
DELIMITER ;

-- TRIGGER 삭제하기
DROP TRIGGER t_deletedMemberTBL;

SELECT * FROM memberTBL;

DELETE FROM memberTBL WHERE memberName='안중근';

DELETE FROM memberTBL WHERE memberName='유관순';

SELECT * FROM memberTBL;

SELECT * FROM deletedMemberTBL;

SHOW TRIGGERS; -- 생성된 TRIGGER 확인하기
