
--job_id가 'FI_MGR'인 사원이 속한 연봉(salary)의 최소값(min_salary),
--최대값(max_salary)을 출력하시오. 
    
select e.job_id, e.salary, j.min_salary, j.max_salary
from employees e, jobs j
where e.job_id = j.job_id and e.job_id = 'FI_MGR';

--부서가 'Seattle'에 있는 부서에서 근무하는  
--직원들의 first_name, hire_date, department_name, city 
--출력하는 SELECT문장을 작성하여라(결과 18행) 

select e.first_name, e.hire_date, d.department_name, l.city
from employees e, departments d, locations l
where d.location_id = l.location_id 
and e.department_id = d.department_id
and l.city = 'Seattle';

    
--20번 부서의 이름과 그 부서에 근무하는 사원의 이름을 출력하시오.(결과2행) 
select d.department_name, e.first_name, e.last_name
from employees e, departments d
where e.department_id = d.department_id and d.department_id = 20;

    
--1400,1500 번 위치의 도시 이름과 그곳에 있는 부서의 이름을 출력하시오.(결과2행)
select l.city, d.department_name
from departments d, locations l
where d.location_id = l.location_id and
(l.location_id in(1400,1500));



--사원테이블에서 manager가 null값일때에도 결과가 나오도록 사원의 매니저를
-- 출력하시오.( Lex 사원의 매니저는 Steven입니다.)  
  select e.first_name || ' 사원의 매니저는 ' || nvl2(m.first_name, m.first_name||'입니다.', '자신입니다.')
  from employees e, employees m
  where e.manager_id=m.employee_id(+);









