/*
	Transaction(트랜잭션) : DML(저장, 수정, 삭제)
    -> 데이터베이스에서 데이터를 처리하는 한 단위를 말함
    
	데이터베이스에서 데이터를 저장, 수정, 삭제하는 작업의 결과를 바로 물리적인 하드디스크에 저장된 데이터에 반영하지는 않음.
    
    개발자가 commit 이라는 작업을 하기 전까지
    물리적인 하드디스크에 저장되지 않고 메모리에만 남아있음.
    
    개발자가 데이터에 대한 작업을 하기 위해서 입력하는
    명령문들의 시작부터 commit까지를
    하나의 Transaction이라고 함.
    
    Rollback
    
		개발자가 저장, 수정, 삭제 작업을 하던 도중에
        rollback을 하게 되면
        바로 이전에 commit한 상태로 돌아감.
        
	workbench에서는 auto commit(default 값)
    -> rollback을 할 수없음
    Edit > Preferences > SQL Editor > SQL Execution > New Connections use auto commit mode 로 변경불가;
    set @@autocommit = 0 ;
*/
set @@autocommit = 0 ;
select @@autocommit;
use testdb;
select * from testtbl2;

insert into testtbl2(select * from testtbl);
commit;

delete from testtbl2;

select * from testtbl2;

rollback;

select * from testtbl2;

delete from testtbl2;

select * from testtbl2;

commit;
rollback;

select * from testtbl2;

/*
	savepoint를 지정하면 rollback할 때 지정된 위치로 복원할 수 있음
    savepoint A + rollback to A
*/

select * from testtbl2;
insert into testtbl2 select * from testtbl;
select * from testtbl2;

commit;

update testtbl2 set data2 = '새문자열', data3 = 55.55
where data1 = 111;

savepoint ns;

select * from testtbl2;

delete from testtbl2 where data1 = 111;
select * from testtbl2;

rollback to ns;

select * from testtbl2;

