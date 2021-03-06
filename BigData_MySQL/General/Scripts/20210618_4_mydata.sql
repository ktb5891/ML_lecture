use mydb;
use sqldb;
show tables;

create table korea(
	id			int unsigned not null auto_increment,
    name 		varchar(20) not null,
    model_num	varchar(10) not null,
    model_type	varchar(10) not null,
    primary key(id)
);

select * from korea;

create table product(
	product_code	varchar(20) not null,
	title			varchar(200) not null,
	origin_price	int,
	discount_price	int,
	discount_percent int,
	delivery		varchar(2),
	primary key(product_code)
);

select * from product;

desc product;

insert into product values ('1223','DBeaver MySQL',10000,10000,100,'Y');

select * from product;

delete from product where delivery = 'Y';


