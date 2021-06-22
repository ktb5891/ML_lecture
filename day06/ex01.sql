show tables;
select database();
use mydb;
select * from product2;

create table product3(
  product_code    varchar(20) not null,
  title           varchar(200) not null,
  origin_price    int,
  discount_price  int,
  discount_rate   int,
  delivery        varchar(2),
  primary key(product_code)
);

desc product3;

create table ranking(
  id   int unsigned not null auto_increment,
  category  varchar(50),
  subcategory  varchar(50),
  ranking   int not null,
  product_code  varchar(20) not null,
  primary key(id)
);
desc ranking;

-- insert into product3 values(215673140, )



