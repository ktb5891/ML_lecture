drop database if exists goodsdb;
create database goodsdb default charset=utf8 collate=utf8_bin;

use goodsdb;
create table userTBL(
  userid    char(10) not null primary key,
  name      varchar(10) not null,
  birthYear int not null,
  addr      char(2) not null,
  mobile1   char(3),
  mobile2   char(10),
  height    smallint,
  mDate     DATE
) default charset=utf8 collate=utf8_bin;
 desc userTBL;


drop table buyTBL;
create table buyTBL(
  num          int auto_increment not null primary key,
  userid       char(8) not null,
  productName  char(5),
  groupName    char(5),
  price        int not null,
  amount       smallint not null,
  foreign KEY(userid) references userTBL(userid)
) default charset=utf8 collate=utf8_bin;
desc buyTBL;


insert into userTBL 
values('LSH','이순신', 1980, '서울', '010', '11111111', 192, '2000-01-01');
insert into userTBL 
values('YKS','유관순', 1981, '천안', '010', '22222222', 162, '2000-01-02');
insert into userTBL 
values('EJMD','을지문덕', 1982, '평양', '010', '3333333', 180, '2000-01-03');
insert into userTBL 
values('AJK','안중근', 1983, '해주', '010', '1231234', 178, '2000-01-04');
insert into userTBL 
values('YBK','윤봉길', 1984, '이천', '010', '5555555', 176, '2000-01-05');

SELECT * from userTBL; 


insert into buyTBL(userid, productName, groupName, price, amount) 
            values('YKS', '운동화', '의류', 30, 2);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('YKS', '노트북', '전자', 1000, 1);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('LSH', '모니터', '전자', 200, 1);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('YBK', '모니터', '전자', 200, 5);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('YKS', '청바지', '의류', 50, 2);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('YBK', '메모리', '전자', 80, 10);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('AJK', '책', '도서', 15, 5);

-- 외래키 제약조건 위반
-- buyTBL의 userid 는 userTBL의 userid값 중에서만
-- 사용할 수 있음           
-- insert into buyTBL(userid, productName, groupName, price, amount) 
--          values('KKK', '책', '도서', 15, 5);

select * from buyTBL;


insert into buyTBL(userid, productName, groupName, price, amount) 
            values('EJMD', '운동화', '의류', 30, 2);

set autocommit = 0;
select @@autocommit;

commit;

insert into buyTBL(userid, productName, groupName, price, amount) values('EJMD', '모니터', '전자', 200, 3);

select * from buyTBL;

rollback;

use goodsdb;
show tables;


