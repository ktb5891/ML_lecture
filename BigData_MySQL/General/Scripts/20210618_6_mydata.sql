use mydb;

drop table if exists students;

create table students(
	id TINYINT not null AUTO_INCREMENT ,
	name varchar(10) not null,
	gender enum('male','female') not null,
	birth date not null,
	english TINYINT not null,
	math TINYINT not null,
	korean TINYINT not null,
	PRIMARY key(id)
)engine = innoDB default charset =utf8;

insert into students (name, gender, birth, english, math, korean) values ('이순신','male','1984-04-28',75,88,90);
insert into students (name, gender, birth, english, math, korean) values ('이순신0','male','1984-04-28',81,93,26);
insert into students (name, gender, birth, english, math, korean) values ('이순신1','male','1984-04-28',16,37,80);
insert into students (name, gender, birth, english, math, korean) values ('이순신2','male','1984-04-28',56,77,59);
insert into students (name, gender, birth, english, math, korean) values ('이순신3','male','1984-04-28',49,20,81);
insert into students (name, gender, birth, english, math, korean) values ('이순신4','male','1984-04-28',71,97,44);
insert into students (name, gender, birth, english, math, korean) values ('이순신5','male','1984-04-28',71,97,24);
insert into students (name, gender, birth, english, math, korean) values ('이순신6','male','1984-04-28',44,5,20);
insert into students (name, gender, birth, english, math, korean) values ('이순신7','male','1984-04-28',7,58,95);
insert into students (name, gender, birth, english, math, korean) values ('이순신8','male','1984-04-28',94,6,83);
insert into students (name, gender, birth, english, math, korean) values ('이순신9','male','1984-04-28',57,70,69);

select * from students;
