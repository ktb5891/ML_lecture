/*
set
	두 select 문을 통해서 얻어온 결과를 집합 연산을 사용해서 하나의 결과로 만드는 것
    
    합집합, 교집합, 차집합 등의 연산을 할 수 있음
    
    ==================================================
    이 경우, 두 select 문을 사용해서 가져오는 컬럼이 같아야 함
    ==================================================
    
    합집합
    
		두 select 문의 결과를 모두 포함한 결과를 반환
        UNION : 중복되지 않는 결과를 반환
        UNION ALL : 중복을 허용한 결과를 반환
        
*/

select emp_no from titles
where title='Senior Staff'
union 
select emp_no from titles
where title='Staff';

select emp_no, title from titles
where title='Senior Staff'
union all
select emp_no,title from titles
where title='Staff'
order by emp_no;

select * from titles;

-- 교집합 : join

select t1.emp_no as t1_emp, t1.title as t1_title, t2.title as t2_title
from titles t1, titles t2
where t1.emp_no = t2.emp_no
and t1.title = 'Senior Staff'
and t2.title = 'Staff';

-- 차집합
-- subquery 사용
select emp_no, title
from titles
where title = 'Staff'
and emp_no not in (select emp_no
					from titles
					where title = 'Senior Staff');
                    
