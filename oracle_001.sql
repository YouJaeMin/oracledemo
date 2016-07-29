select * from JOBS;

-- 테이블에서 컬럼에 해당하는 데이터를 검색하라.
SELECT column1, column2, column3  --컬럼 선택
FROM table; -- 테이블명 검색

SELECT job_title, min_salary, max_salary
FROM jobs;


-- 한 라인 주석
/* 여러 라인 주석 */

SELECT * FROM EMPLOYEES;
-- 컬럼명, 테이블명에 별칭을 지정할 수 있다.
--별칭(alias)명으로 한글이나 영문공백을 사용할 때는 ""(따옴표)을 지정한다.
SELECT salary *10 as "보너스"
FROM employees;

-- 컬럼명들을 하나의 문장처럼 출력할 때 결합연산자(||)을 사용한다.
-- 오라클은 문자를 지정할때 '을 사용한다.
SELECT last_name || '님의 연봉은' || salary || '입니다.'as name
FROM employees;

-- distinct은 중복제거를 한 후 출력해 주는 명령어이다.
SELECT distinct first_name
FROM employees
WHERE first_name = 'David';

-- 여러개의 컬럼의 값(레코드)이 같아야 중복 제거 해준다.
-- 첫번째 컬럼명 앞에 써야한다.
SELECT distinct first_name, salary
FROM employees
WHERE first_name = 'David';

--커리문 작성할때 SELECT절과 FROM절은 반드시 입력해야한다.
--SELECT 입력순서
SELECT 컬럼명, 컬럼명
FROM 테이블명
WHERE 컬럼명='값'
GROUP BY 컬럼명
HAVING 컬럼명='값'
ORDER BY 컬럼명;


--SELECT 해석순서
FROM 테이블명
WHERE 컬럼명='값'
GROUP BY 컬럼명
HAVING 컬럼명='값'
SELECT 컬럼명, 컬럼명
ORDER BY 컬럼명;

-- employees 테이블에서 salary이 3000미만일때의 first_name, salary을 출력하라.
SELECT first_name, salary
FROM employees
WHERE salary < 3000;

-- employees테이블에서 first_name컬럼의 값이 'David'일때의
-- first_name, salary을 출력하시오.
SELECT first_name, salary
FROM employees
WHERE first_name='David'; -- 컬럼명 = 값( = 같다의 의미) 대소문자 비교잘해야함


-- employees테이블에서 first_name컬럼의 값이 'David'가 아닐때의
-- first_name, salary을 출력하시오.
SELECT first_name, salary
FROM employees
WHERE first_name <> 'David';

SELECT first_name, salary
FROM employees
WHERE first_name != 'David';

SELECT first_name, salary
FROM employees
WHERE NOT first_name = 'David';


-- employees테이블에서 salary이 3000, 9000, 17000일때
-- first_name, hire_date, salary을 출력하라.
-- 논리 연산자 or
SELECT first_name, hire_date, salary
FROM employees
WHERE salary = 3000 or salary = 9000 or salary = 17000;

-- IN 연산자
SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN(3000,9000,17000);


-- employees테이블에서 salary이 3000부터 5000까지 일때의
-- first_name, hire_date, salary을 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 and salary <= 5000;

-- 이상 이하 일때만 사용가능 하다.  <= >=
SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000; 


-- employees테이블에서 job_id가 'IT_PROG'이 아닐때
-- first_name, email, job_id을 출력하라.
SELECT first_name, email, job_id
FROM employees
WHERE job_id <> 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id != 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE NOT (job_id = 'IT_PROG');


-- employees테이블에서 salary이 3000부터 5000까지 아닐떄의
-- first_name, hire_date, salary 을 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary >= 3000 and salary <= 5000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary not between 3000 and 5000;

-- employees 테이블에서 commission_pct 이 null 일때
-- first_name, salary, commission_pct 을 출력하라
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct is null;


-- employees 테이블에서 commission_pct 이 null 아닐떄
-- first_name, salary, commission_pct 을 출력하라

SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct is not null;

-- employees 테이블에서 first_name 이 'der' 이 포함이된
-- first_name, salary, email 을 출력하라.
-- like 문을 사용할떄는 % 나 ? 기호를 사용해야한다. _ 도 포함
-- 정규식 .*과 같은뜻  
SELECT first_name, salary, email
FROM employees
WHERE first_name like '%der%';


-- employees 테이블에서 first_name 의 값중 A로 시작하고 두번째 문자는 임의 문자이며 
-- exander 로 끝나는 first_name, salary, email을 출력하라.
-- _ 임의문자
SELECT first_name, salary, email
FROM employees
WHERE first_name like 'A_exander';

-- employees 테이블에서 job_id 을 오름차순으로
-- first_name, email, job_id 을 출력하시오.
-- asc 생략가능 기본 오름차순
SELECT first_name, email, job_id
FROM employees
order by job_id asc;

-- employees 테이블에서 부서를 오름차순하고 사원명을 내림차순으로
-- department_id,first_name,salary
SELECT department_id,first_name,salary
FROM employees
order by department_id, first_name desc;


-- employees 테이블에서 가장 최근 입사 순으로
-- 사원의 first_name, salary, hire_date을 출력하시오.
select first_name, salary, hire_date
from EMPLOYEES
order by hire_date desc;


-- employees 테이블에서 직업이 'FI_ACCOUNT' 인 사원들의 연봉이(salary) 높은 순으로
-- first_name, job_id, salary을 출력하시오.
select first_name, job_id, salary
from EMPLOYEES
where job_id = 'FI_ACCOUNT'
order by salary desc;




--////////////////////////////////////
--문제--
--/////////////////////////////////////
SELECT * FROM employees;
--급여가 17000이하인 사원의 사원번호, 사원명(first_name), 급여를 출력하시오.
SELECT employee_id, first_name, salary
FROM employees
where salary <= 17000;

--연봉이 5000이상이고 직업이 'IT_PROG'이 사원의 사원명(first_name), 연봉, 
--직업을 출력하시오.
SELECT first_name, salary, job_id
FROM employees
where salary >= 5000 and job_id = 'IT_PROG';

--부서번호가 10, 40, 50 인 사원의 사원명(first_name), 부서, 이메일을 출력하시오.
SELECT first_name, department_id, email
FROM employees
--where department_id = 10 or department_id = 40 or department_id = 50;
where department_id IN(10, 40, 50);

--사원명(first_name)이 even이 포함된 사원명,연봉,입사일을 출력하시오.
SELECT first_name, salary, hire_date
FROM employees
where first_name like '%even%';

--사원명(first_name)이 teve앞뒤에 문자가 하나씩 있는 사원명,연봉,입사일을 출력하시오.
SELECT first_name, salary, hire_date
FROM employees
where first_name like '_teve_';

--연봉이 17000이하이고 커미션이 널이 아닐때의 사원명(first_name), 연봉, 
-- 커미션을 출력하시오.
SELECT first_name, salary, commission_pct
FROM employees
where salary <= 17000 and commission_pct is not null;


================================
집합연산자(set operator)
 - 둘 이상의 query결과를 하나의 결과로 조합한다.
 -select의 인자 갯수가 같아야 한다. 첫번째 select가 2개이면 두번째 select도 2개여야 한다.
 - 타입이 일치해야 한다.  예를 들어 character이면 character이여야 한다.
집합연산자 종류
union(합집합)- 중복행이 제거된 두 query  -- 중복된것은 뺴고 가지고온다
union all(합집합)-중복행이 포함된 두 query행 -- 중복된것까지 다가지고 온다
intersect(교집합)-두 query에 공통적인 행 -- 공통적인것만 가지고옴
minus(차집합)-첫번째 query에 있는 행 중 두번째 query에 없는 행표시 -- 겹친것 뺀 나머지만 가지고옴

집합연산자 사용이유
-서로 다른 테이블에서 유사한 형태의 결과를 반환하기 위해서
-서로 같은 테이블에서 서로 다른 질의를 수행하여 결과를 합치기 위해서
===============================================

--union - 컬럼의 갯수가 같아야하며 데이터타입이 같아야한다.
select department_id, first_name, last_name
from employees
where department_id = 20
union
select department_id, first_name, last_name
from employees
where department_id = 20;


create table emp01
as
select department_id, first_name, last_name
from employees
where department_id in(20,40,60);

select * from emp01;

create table emp02
as
select department_id, first_name, last_name
from employees
where department_id in(20,50,80);

select * from emp02;


select department_id, first_name, last_name
from emp01
union
select department_id, first_name, last_name
from emp02


--intersect(교집합)
select department_id, first_name, last_name
from emp01
intersect
select department_id, first_name, last_name
from emp02

-- minus(차집합)
select department_id, first_name, last_name
from emp01
minus
select department_id, first_name, last_name
from emp02


========================================
SQL(structured query language)함수
1. 단일행함수 : 행 하나당 하나의 결과를 출력한다
              (문자함수, 숫자함수, 날짜함수, 변환함수, 일반함수)
2. 복수행함수 : 행 여러개당 하나의 결과를 출력한다
               (합계, 평균, 최대, 최소, 갯수) 
========================================
--select문에서는 반드시 테이블명을 명시해야한다. 
--하지만 select절에 식이나 특정함수를 이용해서 결과값을
--가져올때 사용 할 수 있는 dual이라는 테이블을 제공하고있다.

select 3+2
from dual;

--현재 날짜
select sysdate
from dual;


--문자함수
--단어의 첫글자만 대문자로 변경해주는 함수이다.
select initcap('korea hello')
from dual;

--모든 문자를 대문자로 변경해주는 함수이다.
select upper('korea')
from dual;

select upper(first_name), upper(last_name)
from EMPLOYEES;

--모든 문자를 소문자로 변경해주는 함수이다.
select lower('KOREA')
from dual;

select first_name, lower(first_name)
from employees;

--first_name에서 대소문자 구분없이'ja'가 포함이 된
--first_name, salary 을 출력하라.
select first_name, salary
from employees
where lower(first_name) like '%ja%'


--문자의 길이를 리턴해주는 함수이다.
select length('korea')
from dual;

select length('한국')
from dual;

--문자의 길이를 바이트로 구해서 리턴해주는 함수이다.
select lengthb('korea')
from dual;

select lengthb('한국')
from dual;


create table user1(
data varchar2(5)
);

insert into user1(data)
values ('korea');

select * from user1;

insert into user1(data)
values ('한국');


--문자열 결합을 해주는 함수이다.
select 'oracla' || 'java'
from dual;

select concat('oracla','java')
from dual;


-- 특정범위의 문자를 추출해주는 함수이다.
-- substr('문자', 시작위치, 갯수) - index 번호 1번부터 시작
select substr('oracle test',2,4)
from dual;

select substr('오라클 테스트',4,4)
from dual;

-- 특정문자를 바이트로 추출해주는 함수이다.
select substrb('oracle test',2,4)
from dual;

--완벽하게 출력되는 글만 리턴해준다.
select substrb('오라클 테스트',4,4)
from dual;

--특정 문자의 인덱스를 추출해주는 함수이다.
select instr('korea', 'or')
from dual;

select instr('한국자바', '자')
from dual;

--특정 문자의 바이트인덱스를 추출해주는 함수이다.
select instrb('korea', 'or')
from dual;

select instrb('한국자바', '자')
from dual;

--주어진 문자열에서 왼쪽으로 특정문자를 채우는 함수이다.
select lpad('korea',8,'*')
from dual;

--주어진 문자열에서 오른쪽으로 특정문자를 채우는 함수이다.
select rpad('korea',8,'*')
from dual;

--주어진 문자열에서 왼쪽으로 특정문자를 삭제하는 함수이다.
select ltrim('***korea','*')
from dual;

--주어진 문자열에서 오른쪽으로 특정문자를 삭제하는 함수이다.
select rtrim('korea***','*')
from dual;

--주어진 문자열에서 특정문자를 다른 문자로 변경해주는 함수이다.
--replace(문자, 특정문자, 다른 문자)
select replace('oracle test', 'test', 'sample')
from dual;

-- 주어진 문자열에서 조건에 맞는 문자가 포함되어 있을때 출력해주는 함수이다.
select 'korea'
from dual
where 'korea' like '%a%' or 'korea' like '%b%' or 'korea' like '%c%';

select 'korea'
from dual
where regexp_like ('korea','[abc]');

select first_name, salary
from employees
where regexp_like (first_name,'[Dd]');

select first_name, salary
from employees
where first_name like 'D%';

select first_name, salary
from employees
where regexp_like (first_name,'^D'); -- D로 시작하는

select first_name, salary
from employees
where regexp_like (first_name,'d$'); -- d로 끝나는


select '123 korea'
from dual
where regexp_like ('123 korea','[0-9]');


-- employees 테이블에서 first_name 의 컬럼에 'le' 또는 'A'가 포함된
--데이터를 출력하시오.
select first_name
from employees
where regexp_like (first_name,'le|A');

