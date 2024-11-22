-- Task_08_02 : having subquery 

select * from departments;

select * from employees;


-- The average salary for each department
select department_id, avg(salary) as avg_salary
from employees
group by department_id
having avg(salary) > (select avg(salary) from employees);


-- The total salary from all employees that exceeds the average salary
select department_id, sum(salary) as total_salary
from employees
group by department_id
having sum(salary) > (select avg(salary) from employees);