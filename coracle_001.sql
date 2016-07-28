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










