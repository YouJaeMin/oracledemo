select * from departments;


department_id
department_name
manager_id
location_id

d

select employee_id, first_name, salary, hire_date 
from employees 
where lower(first_name) like '%alex%' 
order by employee_id



select e.employee_id, e.first_name, e.salary,
d.department_id, d.department_name,
l.location_id, l.city
 from employees e, departments d, locations l
 where e.department_id = d.department_id
 and d.location_id=l.location_id




select employee_id, first_name, salary from employees where rownum between 1 and 5 order by employee_id
















