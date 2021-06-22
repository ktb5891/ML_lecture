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
values('LSH','�̼���', 1980, '����', '010', '11111111', 192, '2000-01-01');
insert into userTBL 
values('YKS','������', 1981, 'õ��', '010', '22222222', 162, '2000-01-02');
insert into userTBL 
values('EJMD','��������', 1982, '���', '010', '3333333', 180, '2000-01-03');
insert into userTBL 
values('AJK','���߱�', 1983, '����', '010', '1231234', 178, '2000-01-04');
insert into userTBL 
values('YBK','������', 1984, '��õ', '010', '5555555', 176, '2000-01-05');

SELECT * from userTBL; 


insert into buyTBL(userid, productName, groupName, price, amount) 
            values('YKS', '�ȭ', '�Ƿ�', 30, 2);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('YKS', '��Ʈ��', '����', 1000, 1);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('LSH', '�����', '����', 200, 1);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('YBK', '�����', '����', 200, 5);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('YKS', 'û����', '�Ƿ�', 50, 2);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('YBK', '�޸�', '����', 80, 10);
insert into buyTBL(userid, productName, groupName, price, amount) 
            values('AJK', 'å', '����', 15, 5);

-- �ܷ�Ű �������� ����
-- buyTBL�� userid �� userTBL�� userid�� �߿�����
-- ����� �� ����           
-- insert into buyTBL(userid, productName, groupName, price, amount) 
--          values('KKK', 'å', '����', 15, 5);

select * from buyTBL;


insert into buyTBL(userid, productName, groupName, price, amount) 
            values('EJMD', '�ȭ', '�Ƿ�', 30, 2);

set autocommit = 0;
select @@autocommit;

commit;

insert into buyTBL(userid, productName, groupName, price, amount) values('EJMD', '�����', '����', 200, 3);

select * from buyTBL;

rollback;

use goodsdb;
show tables;


