-- 2. hr 계정
-- 1) employees, job_history, jobs 테이블을 사용해서
-- 사번, 이름, 성, job_id, job_title, job 시작일, job 종료일을 출력.


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



-- 2) employees, departments 테이블을 사용해서
-- 부서번호, 부서이름, 매니저 아이디, 매니저 이름/성을 출력.
-- 단, 부서 테이블의 모든 부서 이름이 출력되도록.


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



-- 사번, 이름, 지역

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