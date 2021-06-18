use myDB;

show tables;

desc mytable;

alter table myTable change column modelnumber model_num varchar(10);

alter table mytable modify column name varchar(20) not null;

alter table mytable change column series model_type varchar(10);

desc mytable ;

drop table if exists myTable;

create table myTable(
	id			int unsigned not null auto_increment,
    name 		varchar(20) not null,
    model_num	varchar(10) not null,
    model_type	varchar(10) not null,
    primary key(id)
);

desc mytable ;

insert into mytable values(1,'17','7700','Kaby Lake');

select * from mytable;

alter table mytable modify column model_type varchar(30) not null;

insert into mytable(name, model_num, model_type) values('17','7700k','Kaby Lake');
insert into mytable(name, model_num, model_type) values('17','9600k','Coffee lake Refresh');
insert into mytable(name, model_num, model_type) values('17','9400f','Coffee lake Refresh');
insert into mytable(name, model_num, model_type) values('17','9700k','Coffee lake Refresh');
insert into mytable(name, model_num, model_type) values('17','8700','Coffee lake');
insert into mytable(name, model_num, model_type) values('17','8500','Coffee lake');

select * from mytable;

select name as cpu_name, model_num cpu_num
from mytable
order by id desc;



