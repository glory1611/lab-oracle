-- 2. hr ����
-- 1) employees, job_history, jobs ���̺��� ����ؼ�
-- ���, �̸�, ��, job_id, job_title, job ������, job �������� ���.


select e.employee_id, e.first_name, e.job_id, j.job_title, h.job_id, h.start_date, h.end_date
from employees e, jobs j, job_history h
where e.job_id = j.job_id
    and e.employee_id = h.employee_id
;


select e.employee_id, e.first_name, e.job_id, j.job_title, h.job_id, j2.job_title, h.start_date, h.end_date
from employees e join jobs j
    on e.job_id = j.job_id
    join job_history h
        on e.employee_id = h.employee_id
        join jobs j2
            on h.job_id = j2.job_id
        ;



-- 2) employees, departments ���̺��� ����ؼ�
-- �μ���ȣ, �μ��̸�, �Ŵ��� ���̵�, �Ŵ��� �̸�/���� ���.
-- ��, �μ� ���̺��� ��� �μ� �̸��� ��µǵ���.


select d.department_id, d.department_name, d.manager_id, e.first_name
from departments d, employees e
    where d.manager_id = e.employee_id(+)

order by d.department_id
;


select d.department_id, d.department_name, d.manager_id, e.first_name
from departments d left join employees e
    on d.manager_id = e.employee_id

order by d.department_id
;



-- ���, �̸�, ����

select e.employee_id, e.last_name, r.region_name
from employees e, departments d, locations l, countries c, regions r

    where e.department_id = d.department_id(+)
        and 
        d.location_id = l.location_id(+)
        and 
        l.country_id = c.country_id(+)
        and 
        c.region_id = r.region_id(+)

order by e.employee_id
;

select e.employee_id, e.last_name, r.region_name
from employees e left join departments d
    on e.department_id = d.department_id
    left join locations l
        on d.location_id = l.location_id
        left join countries c
            on l.country_id = c.country_id
            left join regions r
                on c.region_id = r.region_id



order by e.employee_id
;