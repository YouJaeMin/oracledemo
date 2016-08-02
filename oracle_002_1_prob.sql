--'Lex'와 동일한 직업(job_id)을 가진 사원의 이름(first_name),
-- 직업(job_title), 입사일(hire_date)을 출력하시오.
 select e.first_name, j.job_title, e.hire_date
 from employees e, jobs j
 where e.job_id=j.job_id and j.job_id=(select job_id
		 from employees
		 where first_name='Lex');


--IT에 근무하는 사원의 이름, 부서번호를 출력하시오.
select first_name, department_id
from employees
where department_id=(select department_id
					from departments
					where department_name='IT'
					);

					
--Bruce보다 연봉을  많이 받은 사원이름(first_name), 부서명을 출력하시오.
select e.first_name, d.department_name
from employees e, departments d
where e.department_id=d.department_id
   and e.salary>(	
				select salary
				from EMPLOYEES
				where first_name='Bruce');





--부서명에 IT가 포함이된 사람이 속한 사원명, 부서번호, 부서명을 출력하시오(in)
select e.first_name, e.department_id, d.department_name
from EMPLOYEES e, DEPARTMENTS d
where e.department_id = d.department_id and e.department_id in(
						select department_id
						from departments
						where department_name like '%IT%');
						

						
--Toronto 사원들보다 많은 연봉을 받는 first_name, city, salary을 출력하시오
--(any연산자) 단 부서가 있는 사원의 정보만 출력한다.
--Toronto은 제외한다. 
select e.first_name, l.city, e.salary
from EMPLOYEES e, LOCATIONS l, DEPARTMENTS d
where e.department_id = d.department_id
and d.location_id = l.location_id
and e.salary > any(
select salary
from employees 
where department_id = (select DEPARTMENT_ID
						from DEPARTMENTS
						where LOCATION_ID = (select LOCATION_ID
											from LOCATIONS
											where city = 'Toronto'))
					)
and l.city != 'Toronto'
and e.department_id is not null;


------ 풀이 ---------
select e.first_name, l.city, e.salary
from EMPLOYEES e, LOCATIONS l, DEPARTMENTS d
where e.department_id = d.department_id
and d.location_id = l.location_id
and e.salary > any(
					select e.salary
					from EMPLOYEES e, LOCATIONS l, DEPARTMENTS d
					where e.department_id = d.department_id
					and d.location_id = l.location_id
					and l.city = 'Toronto')
and l.city != 'Toronto'
and e.department_id is not null;
---------------------------------------



--연봉이 상위 5~10사이의 사원명, 입사일, 연봉을 출력하시오.(Top-N)
select b.*
from (
		select rownum as rm, a.first_name, a.salary
		from (
				select first_name, salary
				from EMPLOYEES
				order by salary desc) a) b
where b.rm >= 5 and b.rm <= 10;




//1번파일
--[문제]연봉이 2500이하인 사원의 사원번호, 사원명, 연봉을 검색하시오.

select employee_id, first_name, salary
from employees
where salary <= 2500;

--[문제]사원테이블에서 'Lex'인 사원의 사원번호, 사원명, 연봉을 검색하시오.
select employee_id, first_name, salary
from employees
where first_name = 'Lex';


--[문제]사원번호가 132 이거나 140 이거나 148인 사원의 사원번호, 연봉을 검색하시오.
select employee_id, salary
from employees
where employee_id in(132,140,148);

--[문제]연봉이 20000이상인 사원들의 사원명(first_name),입사년도,연봉를 출력하시오.
select first_name as "사원명", to_char(hire_date, 'yyyy') as "년도", salary as "연봉"
from employees
where salary >= 20000;

--[문제]각 사원들의 사원명(first_name),사원명 길이를 출력하시오.
select first_name, length(first_name)
from employees

--[문제]"Steven님은 2003년 06월 17일 입사한 사원입니다" 처럼 각 사원을 출력하시오.
select first_name || '님은' || to_char(hire_date, 'yyyy') || '년' 
||  to_char(hire_date, 'mm')|| '월' || to_char(hire_date, 'dd') || '일 입사한사원입니다.' 
from employees;

//2번파일
--   [문제] 모든사원에게는 상관(Manager)이 있다. 하지만 employees테이블에 유일하게 상관이
--   없는 로우가 있는데 그 사원(CEO)의 MGR컬럼값이 NULL이다. 상관이 없는 사원한
--   출력하되 MGR컬럼값 NULL 대신 CEO로 출력하시오.

select manager_id, nvl(to_char(manager_id),'CEO')
from employees e



-- [문제] 가장최근에 입사한 사원의 입사일과 가장오래된 사원의 입사일을 구하시오.
select max(hire_date), min(hire_date)
from employees

-- [문제] 부서별로 커미션을 받는 사원의 수를 구하시오.
select count(commission_pct), department_id
from employees
group by department_id;

--[문제] 부서별 최대급여가 10000이상이 부서만 출력하시오.
select department_id, max(salary)
from employees
group by department_id
having max(salary) >= 10000
order by department_id;


--[문제] employees 테이블에서 직종이 'IT_PROG'인 사원들의 급여평균을 구하는 SELECT문장을 기술하시오
select avg(salary)
from employees
where job_id = 'IT_PROG';


--[문제] employees 테이블에서 직종이 'FI_ACCOUNT' 또는 'AC_ACCOUNT' 
--인 사원들 중 최대연봉을  구하는    SELECT문장을 기술하시오   
select max(salary*12)
from employees
where job_id in('FI_ACCOUNT', 'AC_ACCOUNT');

--[문제] employees 테이블에서 50부서의 최소급여를 출력하는 SELECT문장을 기술하시오
select min(salary)
from employees
where department_id = 50;

--[문제] employees 테이블에서 아래의결과처럼 입사인원을 출력하는 SELECT문장을 
select to_char(hire_date, 'yyyy'), count(hire_date)
from employees
group by to_char(hire_date, 'yyyy')
order by to_char(hire_date, 'yyyy');

--select sum(decode(to_char(hire_date, 'YYYY'), '2001',1,0)) as "2001",
--sum(decode(to_char(hire_date, 'YYYY'), '2002',1,0)) as "2002",
--sum(decode(to_char(hire_date, 'YYYY'), '2003',1,0)) as "2003",
--sum(decode(to_char(hire_date, 'YYYY'), '2004',1,0)) as "2004"
--from employees


--[문제] employees 테이블에서 각 부서별 인원이 10명 
--이상인 부서의 부서코드,인원수,급여의 합을 구하는  SELECT문장을 작성하여라
select department_id, count(*), sum(salary)
from employees
group by department_id
having count(*) >= 10
order by department_id;


//3번 파일
--문제개요 : EMPLOYEES 테이블에서 입사한 달(hire_date) 별로 인원수를 조회하시오 
select to_char(hire_date, 'mm') || '월' as "월", count(hire_date) as "직원수"
from employees
group by to_char(hire_date, 'mm')
order by to_char(hire_date, 'mm');


--문제 개요 : 각 부서에서 근무하는 직원수를 조회하는 SQL 명령어를 작성하시오.
--단, 직원수가 5명 이하인 부서 정보만 출력되어야 하며 부서정보가 없는 직원이 있다면 
--부서명에 “<미배치인원>” 이라는 문자가 출력되도록 하시오. 
--그리고 출력결과는 직원수가 많은 부서먼저 출력되어야 합니다.
select nvl(d.department_name, '<미배치인원>'), count(*)
from employees e, departments d
where e.department_id = d.department_id(+)
group by d.department_name
having count(*) <= 5
order by count(*) desc;

--각 부서 이름 별로 2003년 이전에 입사한 직원들의 인원수를 조회하시오.
select d.department_name, to_char(e.hire_date, 'yyyy'), count(*)
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name, to_char(e.hire_date, 'yyyy')
having to_number(to_char(e.hire_date, 'yyyy')) < 2003
order by to_char(e.hire_date, 'yyyy');



--문제 개요 : 직책(job_title)이 'manager' 인 사람의 이름(first_name),
--직책(job_title), 부서명(department_name)을 조회하시오.

select e.first_name, j.job_title, d.department_name
from employees e, jobs j, departments d
where e.job_id = j.job_id and e.department_id = d.department_id
and j.job_title like '%Manager%'


--문제 개요 : 'Executive' 부서에 속에 있는 직원들의 관리자 이름을 조회하시오. 
--단, 관리자가 없는 직원이 있다면 그 직원 정보도 출력결과에 포함시켜야 합니다.
select e.department_id, e.first_name, m.first_name
from employees e, employees m, departments d
where e.manager_id = m.employee_id(+)
and e.department_id = d.department_id
and d.department_name = 'Executive'


--문제개요 : department_id가 60인 부서의 도시명을 알아내는 SELECT문장을 기술하시오
select l.city
from locations l, departments d
where l.location_id = d.location_id
and d.department_id = 60;

--문제개요 : 사번이 107인 사람과 부서가같고,167번의 연봉보다 많은 사람들의 사번,이름,성,연봉를 출력하시오
select salary
from employees
where 
employee_id = 167
employee_id = 107 
and


select employee_id, first_name, last_name, salary
from employees
where 
	salary > (select salary
	from employees
	where employee_id = 167)
	and	department_id = (select department_id
					from employees
					where employee_id = 107)


--문제개요 :  급여평균보다 연봉을 적게받는 
--사람들중 커미션을 받는 사람들의 사번,이름,성,급여,커미션 퍼센트를 출력하시오
				
select employee_id, first_name, last_name, salary, commission_pct
from employees
where salary < (select avg(salary)
				from employees
				) and commission_pct is not null;


--문제개요 :  각 부서의 최소연봉가 20번 부서의 최소연봉보다 
--많은 부서의 번호와 그부서의 최소연봉를 출력하시오
--select department_id, salary
--from employees
--where (salary, department_id) in (select min(salary), department_id
--						from employees
--						group by department_id
--						) and salary > (select min(salary)
--											from employees
--											where department_id = 20) 
--order by department_id;


select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
				from employees
				where department_id = 20)
order by department_id;








