-- hr ����

-- �μ��� �޿� �ּҰ�
select min(salary) 
    from employees
    group by department_id;
    
select employee_id, first_name, salary, department_id
    from employees
    where salary in 
        (select min(salary) from employees group by department_id);
-- ��Ȯ���� ����

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

-- null ���� �ȳ��´�
-- null �� ��ȣ�� �� �Ұ�, is null �̾�� ��

