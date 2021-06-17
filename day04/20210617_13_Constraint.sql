/*
	UNIQUE 
*/

create table testtbl9(
	data1 int,
    data2 int not null,
    constraint uk1 unique(data1),
    constraint uk2 unique(data2)
);
desc testtbl9;

insert into testtbl9 (data1, data2) values(1,11);
insert into testtbl9 (data1, data2) values(2,22);
select * from testtbl9;
insert into testtbl9 (data1, data2) values(1,33);
-- Error Code: 1062. Duplicate entry '1' for key 'uk1'
 
 insert into testtbl9 (data1, data2) values(null,44);
 insert into testtbl9 (data1, data2) values(null,55);
 select * from testtbl9;
 
 commit;
 
 create table testtbl10(
	data1 int not null,
    data2 int not null,
    constraint ck1 check (data1 > 11),
    constraint ck2 check (data2 in (11,22,33))
);
insert into testtbl10(data1, data2) values(22,33);
select * from testtbl10;
insert into testtbl10(data1, data2) values(1,111);
-- Error Code: 3819. Check constraint 'ck1' is violated.
insert into testtbl10(data1, data2) values(15,111);
-- Error Code: 3819. Check constraint 'ck2' is violated.

/*
	DEFAULT 제약조건
*/
create table testtbl11(
	data1 int not null default 1,
    data2 int not null default 111
);
insert into testtbl11 values(111,222);
select * from testtbl11;

insert into testtbl11 values();
select * from testtbl11;

insert into testtbl11 values(null,null);
-- Error Code: 1048. Column 'data1' cannot be null

    