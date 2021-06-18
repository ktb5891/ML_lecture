drop database if exists goodsdb;

create database goodsdb default charset=utf8 collate=utf8_bin;

use goodsdb;

create table usertbl(
	userid	char(10) not null primary key,
	name 	varchar(10) not null,
	birthYear int not null,
	addr	char(2) not null,
	mobile1	char(3),
	mobile2	char(3),
	height	smallint,
	mDate	date
) default charset=utf8 collate=utf8_bin;

desc usertbl;

drop table if exists buytbl;
create table buytbl(
	num			int auto_increment not null primary key,
	userid		char(8) not null,
	productname char(5),
	groupname	char(5),
	price		int not null,
	amount		smallint not null,
	foreign key(userid) references usertbl(userid)
)default charset=utf8 collate=utf8_bin;

insert into usertbl values ('LHS','이순신',1980,'서울','010','111',182,'2000-01-01');
