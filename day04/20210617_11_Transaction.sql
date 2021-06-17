/*
	Truncate 를 사용하면 지정된 테이블의 모든 row가 삭제됨
		Delete(DML)는 commit과 rollback이 적용되지만
        Truncate는 DML이 아니므로 commit과 rollback이 적용되지 않음
        rollback을 해도 복원되지 않음
        
        ****************************
        DML : INSERT, UPDATE, DELETE
        ****************************
*/

select * from testtbl2;
commit;

delete from testtbl2;
select * from testtbl2;
rollback;
select * from testtbl2;

truncate testtbl2;
rollback;
select * from testtbl2;

/*
	테이블 변경하기
		-> 테이블의 이름, 속성 등을 변경함
*/

show tables;
create table testtbl5 (select * from testtbl);
rename table testtbl5 to testtbl55;

desc testtbl2;
alter table testtbl2 modify data1 int(100);
desc testtbl2;

-- testtbl2 테이블의 data1 컬럼이름을 data10으로 변경하고
-- int(200)으로 크기도 변경하기

alter table testtbl2 change data1 data10 int(200);
desc testtbl2;

-- 새로운 컬럼 추가하기
-- data4 int(20)
alter table testtbl2 add data4 int(20);
desc testtbl2;

-- 컬럼 삭제하기
-- 컬럼을 삭제하면 해당 컬럼의 모든 data도 삭제됨
alter table testtbl2 drop data4;
desc testtbl2;

-- 테이블 삭제하기
-- drop table 테이블이름
