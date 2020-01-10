
desc employees;
select employee_id "사번", first_name "이름", last_name "성" from employees
    where first_name like 'J%';
    
select employee_id "사번", first_name "이름", last_name "성", phone_number "전화번호" from employees
    where phone_number like '011%';
    
select employee_id "사번", first_name "이름", manager_id "매니저 사번", department_id "부서번호" from employees
    where manager_id = 120;
    
select * from employees
    where employee_id = 120;
    
select employee_id "사번", first_name "이름", salary "급여" from employees
    where salary >= 3000 and salary <=5000;
    
select employee_id "사번", first_name "이름", salary "급여", commission_pct "수당", ((salary * 12)*(1 + commission_pct)) "1년 급여" from employees
    where commission_pct is not null;
    
    
    