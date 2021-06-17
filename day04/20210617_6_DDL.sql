/*
	DDL : Data Definition Language
		  데이터     정의      언어
	
    Create, Alter, Drop, Truncate
      생성    변경	삭제	   초기화
      
	Create Database 이름
    Create Table 이름
    
    Use 데이터베이스 이름
    
    UTF-8 유니코드 인코딩(코딩 타임의 한글을 저장하는 경우 설정하는 code)
    
    Create Datebase 이름
    character set = 'utf8'
    collate = 'utf8_general_ci'; (한글이 깨질경우 시도)
    
*/

show databases;

create database testdb;

use testdb;
show tables;

/*
	테이블 생성하기
    
    create table 이름(
		컬럼1 자료형 제약조건,
        컬럼2 자료형 제약조건,
        컬럼3 자료형 제약조건
	)
    
    MySQL 자료형(data type)
    
    char(n)		고정길이 문자열(최대 255byte)
    varchar(n)	가변길이 문자열(최대 65535byte)
    int(n)		정수형 (4byte)
    bigint(n)	정수형 (8byte)
    float(n, m)	부동소수점(실수형 4byte)
    double(n, m)부동소수점(실수형 8byte)
    date		(날짜)
    time		(시간)
    datetime	(날짜와 시간)
    
*/

create table testtbl(
	data1	int(10),
    data2	varchar(10),
    data3	float(10,2)
);

desc testtbl;

select * from testtbl;

-- 서브쿼리를 사용해서 테이블 생성하기

create table testtbl2(select * from testtbl);

desc testtbl2;

create table testtbl3  as select * from testtbl;

desc testtbl3;

create table testtbl4 select * from testtbl;

desc testtbl4;
    