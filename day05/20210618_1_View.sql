select database();
use employees;
select * from titles;
select emp_no from titles;

-- 중복을 제거해 줌 : DISTINCT
select distinct emp_no from titles;

/*
	View (뷰) : 가상 테이블
	두 개 이상의 테이블을 join하거나 sub query를 사용하는
    select 문은 query문이 복잡해짐
    이 때, 이러한 식으로 작업을 계속 하다보면
    개발자가 번거로워 짐
    
		-> join이나 sub query를 사용해서 얻어진 결과를
			View로 만들어 놓으면 개발자는 View를 통해서 결과를
            확인할 수 있음
		-> View는 select문을 사용해서 얻어진 결과를 가지고 있지 않고
			select문 자체를 가지고 있어서 View를 select하면
            이전에 사용한 Query문이 실행되어 결과를 가지고 옴 
*/

drop table if exists testtbl;
create table testtbl(
	data1	int,
    data2	int not null,
    constraint pk1 primary key(data1)
);

drop table if exists testtbl2;
create table testtbl2(
	data1	int,
    data2	int not null,
    constraint pk1 foreign key(data1) references testtbl(data1),
    data3	int
);

insert into testtbl values(1,11);
insert into testtbl values(2,22);
insert into testtbl values(3,33);
select * from testtbl;

insert into testtbl2 values(1,11,111);
insert into testtbl2 values(2,22,222);
insert into testtbl2 values(3,33,333);
select * from testtbl2;

/*
	View 생성하기
    create view 뷰이름 as select 쿼리문
    
    View 삭제하기 
    drop view 뷰이름 
    
*/

-- data1, data2, data3 조회하기 
-- testtbl과 testtbl2를 join해야 함 

select t1.data1, t1.data2, t2.data3
from testtbl t1, testtbl2 t2
where t1.data1 = t2.data1;

create view testview1
as
select t1.data1, t1.data2, t2.data3
from testtbl t1, testtbl2 t2
where t1.data1 = t2.data1;

select * from testview1;

insert into testtbl values(4,44);
insert into testtbl values(5,55);

insert into testtbl2(data1,data3) values(4,444);
insert into testtbl2(data1,data3) values(5,555);
