/*
	제약조건 : CONSTRAINT
    
    컬럼에 저장될 DATA의 조건을 설정하느 것
    
    제약 조건을 설정하면 조건에 위배되는 데이터는 저장할 수 없음
		-> DATA의 무결성을 보장함
        
	PRIMARY KEY : KEY = 컬럼
		-> 컬럼에 중복된 DATA를 저장할 수 없음
        -> 주로 각 ROW를 구분하기 위한 유일한 값(UNIQUE)을 
        -> 저장하는 컬럼에 사용함
        
	FOREIGN KEY (외래키) : FK - NULL 값을 허용
		-> 특정 테이블의 PRIMARY KEY 컬럼에 저장되어 있는 값만
        -> 저장할 수 있도록 함 <-- 제약조건
        -> 학과테이블의 PRIMARY KEY인 학과번호 컬럼의 값을
        -> 학생테이블과 교수테이블에서 사용함
        -> 학생테이블과 교수테이블에서 사용하는 학과번호 컬럼의 값들은
        -> 반드시 학과테이블의 PRIMARY KEY인 학과번호 컬럼의 값들 중 하나이다.
        -> 이 경우, 학과테이블은 부모테이블(값을 제공해 줌)이 되고
        -> 학생테이블과 교수테이블은 자식테이블이라고 함.
        -> 					(부모테이블의 값을 참조해서 사용하는 테이블)
        -> 학색테이블과 교수테이블에 있는 학과번호 컬럼은
        -> 학과테이블에 있는 학과번호 컬럼의 값을 참조함.
		-> 학생테이블과 교수테이블에 있는 학과번호 컬럼을 외래키(컬럼)
        -> 학과테이블에 있는 학과번호 컬럼은 참조키(컬럼)
        
	NOT NULL : NULL 값이 허용되지 않음
			   이 컬럼의 값은 반드시 입력되어야 함
               
	UNIQUE : 중복된 내용을 저장할 수 없음 - NULL 허용됨
    
    CHECK : 값의 범위나 종류를 지정하면
			지정된 조건에 맞는 값만 저장할 수 있음
            (MySQL 에서는 지원되지 않음)
	
    DEFAULT : NULL이 들어오는 경우 기본적으로 설정되는 값.
			  DEFAULT를 설정하는 경우에는
              해당 컬럼에는 NULL값을 저장할 수 없음
              
*/

create table testtbl6(
	data1 	int NOT NULL
);

insert into testtbl6 values(1);
insert into testtbl6 values(2);
insert into testtbl6 values(3);

select * from testtbl6;

insert into testtbl6 values(null);
-- Error Code: 1048. Column 'data1' cannot be null

drop table if exists testtbl7;
-- data1 int primary key
create table testtbl7 (
	data1	int,
    data2	int not null,
    constraint pk1 primary key(data1)
);
desc testtbl7;

insert into testtbl7(data1, data2) values(11,111);
insert into testtbl7(data1, data2) values(22,222);
insert into testtbl7(data1, data2) values(33,333);

select * from testtbl7;

insert into testtbl7(data1, data2) values(11,123);
-- Error Code: 1062. Duplicate entry '11' for key 'PRIMARY'

insert into testtbl7(data1, data2) values(null,123);
-- Error Code: 1048. Column 'data1' cannot be null

commit;

insert into testtbl7(data2) values(777);
-- Error Code: 1364. Field 'data1' doesn't have a default value

-- FOREIGN KEY
create table testtbl8(
	data1 int,
    data2 int,
    constraint pk2 primary key(data1),
    constraint fk2 foreign key(data2) references testtbl7(data1)
);

desc testtbl8;

insert into testtbl8(data1, data2) values(1,11);
insert into testtbl8(data1, data2) values(2,22);
insert into testtbl8(data1, data2) values(3,33);
insert into testtbl8(data1, data2) values(4,null);
insert into testtbl8(data1, data2) values(5,55);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`testdb`.`testtbl8`, CONSTRAINT `fk2` FOREIGN KEY (`data2`) REFERENCES `testtbl7` (`data1`))

select * from testtbl8;
