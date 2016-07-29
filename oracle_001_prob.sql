--////////////////////////////////////
--문제--풀이 한것
--/////////////////////////////////////

--급여가 17000이하인 사원의 사원번호, 사원명(first_name), 급여를 출력하시오.
select employee_id, first_name, salary
from employees
where salary<=17000;

--연봉이 5000이상이고 직업이 'IT_PROG'이 사원의 사원명(first_name), 연봉, 
--직업을 출력하시오.
select first_name, salary, job_id
from employees
where salary>=5000 and job_id='IT_PROG';

--부서번호가 10, 40, 50 인 사원의 사원명(first_name), 부서, 이메일을 출력하시오.
select first_name, department_id, email
from employees
where department_id in(10,40,50);

--사원명(first_name)이 even이 포함된 사원명,연봉,입사일을 출력하시오.
select first_name, salary, hire_date
from employees
where first_name like '%even%';

--사원명(first_name)이 teve앞뒤에 문자가 하나씩 있는 사원명,연봉,입사일을 출력하시오.
select first_name, salary, hire_date
from employees
where first_name like '_teve_';

--연봉이 17000이하이고 커미션이 널이 아닐때의 사원명(first_name), 연봉, 
-- 커미션을 출력하시오.
select first_name, salary, commission_pct 
from employees
where salary <=17000 and commission_pct is not null;










