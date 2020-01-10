-- hr 계정

-- 부서별 급여 최소값
select min(salary) 
    from employees
    group by department_id;
    
select employee_id, first_name, salary, department_id
    from employees
    where salary in 
        (select min(salary) from employees group by department_id);
-- 정확하지 않음

select nvl(department_id,-1), min(salary)
    from employees
    group by department_id;
    
select employee_id, first_name, salary, department_id
    from employees
    where (nvl(department_id,-1), salary) in
        (select nvl(department_id,-1), min(salary)
    from employees
    group by department_id)
order by department_id, employee_id;

-- null 값은 안나온다
-- null 은 등호로 비교 불가, is null 이어야 함

