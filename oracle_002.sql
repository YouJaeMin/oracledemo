------------
숫자함수
------------
--3.55을 소수점 1의 자리까지 구하시오(반올림)
select round(3.55,1)
from dual;

--2535.598을 십의 자리까지 구하시오(반올림)
select round(2535.598, -1)
from dual;

--256.78을 무조건 올림한다.(올림)
select ceil(256.78)
from dual;

--289.78에서 소수이하는 무조건 버린다.(버림)
select floor(289.78)
from dual;

--2의 3승 (거듭제곱)
select power(2,3)
from dual;

--25의 제곱근
select sqrt(25)
from dual;

--나머지
select mod(10, 3)
from dual;

-----------------------------
날짜함수
-----------------------------

-- 현재 시스템에서 제공해주는 오늘의 날짜 구하는 함수
select sysdate
from dual;

--두 날짜 월의 차를 반환. 앞에 있는 값이 크면 +로 리턴하고 반대이면 -으로 리턴
select months_between('2013-01-01', '2013-09-30')
from dual;

--첫번째 인자의 달에 두번째 인자값을 더한 날짜를 반환
select add_months(sysdate, 10)
from dual;

--첫번째 인자를 기준으로 앞으로 다가올 날짜를 두번쨰에서
--지정한 요일의 날짜를 구함
select next_day(sysdate, '일요일')
from dual;

--현재 날짜를 기준으로 달의 마지막 일을 구함
select last_day(sysdate)
from dual;

숫자        >        문자          >          날짜
       to_char              to_date
          <                     <
       to_number            to_char                      

---------------------------
to_char()
1 숫자 -> 문자
2 날짜 -> 문자
---------------------------
--숫자 -> 문자
--첫번쨰 인자값을 두번째 인자값의 형식으로 변환해주는 함수
select to_char(2532, '999,999.99')
from dual;

select to_char(2532, '009,999.00')
from dual;

select to_char(2532, '$999,999.99')
from dual;

--각 나라의 통화를 표현해 줄 때 L기호를 사용한다.
select to_char(2532, 'L999,999.99')
from dual;

--날짜 -> 문자
select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss day')
from dual;

select to_char(sysdate, 'yyyy-mm-dd hh:mi:ss dy')
from dual;

select to_char(sysdate, 'yyyy-mon-dd hh24:mi:ss dy')
from dual;

-------------------------
to_number()
문자 -> 숫자
------------------------
select to_number('253')
from dual;


------------------------
to_date()
문자 -> 날짜
------------------------
select to_date('2013-10-14', 'yy-mm-dd')
from dual;

--hire_date(입사일) 을 이용해서 '홍길동님은 2003년 1월 3일에 입사했습니다'로
--출력하는 query를 작성하시오.
select first_name || '님은' || to_char(hire_date, 'yyyy') || '년' 
|| to_char(hire_date, 'mon') || ltrim(to_char(hire_date, 'dd'), '0') || '에 입사했습니다.' 
from employees;



-----------------------------
일반함수
nvl()
----------------------------
--nvl(컬럼, 대체값) : 첫번째 인자값이 null이면 0으로 대체해서 출력한다.
--대체할 값이 숫자이면 두번째 인자값에 숫자를 지정한다.
--대체할 값이 문자이면 두번째 인자값에 문자를 지정한다.
--대체할 값이 날짜이면 두번째 인자값에 날짜를 지정한다.


-- commission_pct 컬럼의 값이 null인 경우 0으로 대체해서 출력한다.
select first_name, commission_pct, nvl(commission_pct, 0)
from employees;

--nvl2(컬럼, 대체1, 대체2) : 컬럼의 값이 null아니면 대체1로, null이면 대체2로 출력한다.
select commission_pct, nvl2(commission_pct, commission_pct, -1)
from employees;


--------------------------
일반함수
decode()
--------------------------
--decode(컬럼, 조건1, 값1, 조건2, 값2, 조건3, 값3, 그밖의 값)
--department_id 값이 10이면 'AA', 20이면 'BB', 30이면 'CC' 그밖의 값은 'DD'
--java의 switch~case문과 비슷

select first_name, department_id, 
		decode(department_id, 10, 'AA', 20, 'BB', 30, 'CC', 'DD') as code
from employees
where department_id <= 50;


----------------------
일반함수
case()
-----------------------
case when 조건1 then 결과1
	 when 조건2 then 결과2
	 when 조건3 then 결과3
	 else 결과n
end

자바의 다중 if~else제어문과 비슷하다

select first_name, department_id,
	case 
	when department_id = 10 then 'AA'
	when department_id = 20 then 'BB'
	when department_id = 30 then 'CC'
	else 'DD'
	end as code
from employees
where department_id <= 50;


-- 입사일에서 월이 1-3이면 '1사분기', 4-6이면 '2사분기', 7-9이면 '3사분기', 10-12이면 '4사분기'
-- 로 처리를 하고 사원명(first_name), 입사일(hire_date), 분기로 출력하시오


select first_name as "사원명", hire_date as "입사일", 
		case 
--		when to_number(to_char(hire_date, 'mm')) in(1,2,3) then '1사분기'
--		when to_number(to_char(hire_date, 'mm')) in(4,5,6) then '2사분기'
--		when to_number(to_char(hire_date, 'mm')) in(7,8,9)  then '3사분기'
--		when to_number(to_char(hire_date, 'mm')) in(10,11,12)  then '4사분기'
		when to_number(to_char(hire_date, 'mm')) between 1 and 3 then '1사분기'
		when to_number(to_char(hire_date, 'mm')) between 4 and 6 then '2사분기'
		when to_number(to_char(hire_date, 'mm')) between 7 and 9 then '3사분기'
		when to_number(to_char(hire_date, 'mm')) between 10 and 12 then '4사분기'
		end as "분기"
from employees;





































