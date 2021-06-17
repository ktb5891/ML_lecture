use employees;

select * from departments;

create table dept1
as
select * from departments;

desc departments;
desc dept1;

select * from dept1;

use testdb;
show tables;
desc testtbl;

insert into testtbl values(111,'문자열111',1.11);
insert into testtbl values(222,'문자열222',2.22);
insert into testtbl values(333,'문자열333',3.33);

select * from testtbl;

insert into testtbl(data1, data2, data3)
		values('555','777','999');
        
select * from testtbl;

