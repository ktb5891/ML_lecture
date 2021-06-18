/*
	시퀀스(Sequence) --> auto_increment
    
    row를 추가할 때 자동으로 증가하는 값이 저장되는 것 
    
*/

drop table if exists testtbl3;
create table testtbl3(
	data1	int auto_increment,
    data2	int not null,
    data3	int not null,
    constraint pk1 primary key(data1)
);

insert into testtbl3(data2, data3) values(11,111);
insert into testtbl3(data2, data3) values(22,222);
insert into testtbl3(data2, data3) values(33,333);

select * from testtbl3;

drop table if exists testtbl4;
create table testtbl4(
	data1	int auto_increment not null,
    data2	int not null,
    data3	int not null,
    constraint pk1 primary key(data1)
);

insert into testtbl4(data2, data3) values(11,111);
insert into testtbl4(data2, data3) values(22,222);
insert into testtbl4(data2, data3) values(33,333);

select * from testtbl4;

/*
	LIMIT
		-> select해서 출력되는 ROW의 개수를 지정함 
        -> 게시판 : 페이징 처리하는 경우에도 사용함 
        
        SELECT 문 LIMIT [시작인덱스 : OFFSET], 개수 
        
        SELECT 문 LIMIT 개수 OFFSET 시작인덱스
        
        SELECT 문 LIMIT 3,5 == SELECT 문 LIMIT 5 OFFSET 3
        
*/

SELECT * FROM employees
order by emp_no limit 0,10;

create database myDB;
use myDB;
create table myTable(
	id			int unsigned not null auto_increment,
    name 		varchar(50) not null,
    modelnumber varchar(15) not null,
    series		varchar(30) not null,
    primary key(id)
);
desc myTable;

show tables;

commit;

