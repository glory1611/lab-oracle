-- ������ �Լ� (multi-row function, group function)
-- �������� ���� �Լ��� argument�� ���޵Ǽ� �ϳ��� ������� ��µǴ� �Լ�

-- ��� ����� �޿��� �� �հ�, ���, �ִ밪, �ּҰ�
select 
    sum(sal),
    round(avg(sal), 2),
    trunc(avg(sal), 2),
    max(sal),
    min(sal),
    variance(sal),
    stddev(sal)
from emp;


-- count(����) : �������� ������ ����
select 
    count(*), 
    count(comm), -- count �Լ��� null�� �ƴ� ������ ������ ����
    count(distinct deptno) -- �ߺ��� ������ ������ ����
from emp;


--
select empno, count(empno) from emp; -- ����
    
    
    
-- max() �� min() �Լ��� date Ÿ�Կ��� ����� �� ����.
select max(hiredate), min(hiredate) from emp;








-- order by ����(�÷�)�̸� asc(����)/desc(����)
-- order by ���� ��� : ����Ʈ�� �������� (asc ���� ����)
select * from emp order by empno desc;

select * from emp order by deptno;

select * from emp order by deptno, empno desc;



-- 30�� �μ� ������� �޿��� �հ�, �ּڰ�, �ִ밪, ���, �л�, ǥ������ ���
select 30 as Deptno,
    sum(sal) as sum,
    min(sal) as min,
    max(sal) as max,
    round(avg(sal), 2) as avg,
    round(variance(sal), 2) as var,
    round(stddev(sal), 2) as std
from emp
where deptno = 30;


-- �μ��� �޿��� �ּ�/�ִ�/��հ��� ���
select 
        10 as Deptno,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg,
        round(variance(sal), 2) as var,
        round(stddev(sal), 2) as stddev
    from emp
    where deptno = 10
    union
select 
        20 as Deptno,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg,
        round(variance(sal), 2) as var,
        round(stddev(sal), 2) as stddev
    from emp
    where deptno = 20
    union
select 
        30 as Deptno,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg,
        round(variance(sal), 2) as var,
        round(stddev(sal), 2) as stddev
from emp
where deptno = 30
;


--------
--------

select 
    deptno,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg,
        round(variance(sal), 2) as var,
        round(stddev(sal), 2) as stddev
from emp

group by deptno;


--------
--------

-- ��� �׸� �Լ��� �⺻������ null�� �����ϰ� ����� ����
select sum(comm), avg(comm), avg(nvl(comm, 0)) from emp;



select 
    deptno,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg,
        round(variance(sal), 2) as var,
        round(stddev(sal), 2) as stddev
from emp
group by deptno
order by deptno;




select
    job,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg
    from emp
    group by job
order by job;






select
    mgr,
        round(avg(sal), 2) as avg
    from emp
    group by mgr
order by mgr;




-- �μ��� �޿� ��� ���.
-- ��, ��� �޿��� 2000 �̻��� �μ��� ���.


select
    deptno,
        avg(sal) as avg
    from emp
where avg(sal) > 2000
group by deptno; -- ���� �߻�


select
    deptno,
        avg(sal) as avg
    from emp
group by deptno
having avg(sal) > 2000;


-- �޴����� null�� �ƴ� ���� �߿���, �޴��� ���� ��� �޿� ���
select
    mgr,
    avg(sal)
    from emp
    where mgr is not null
    group by mgr;
    
    

-- 1) �μ� ��ȣ, �μ��� ��� �޿�, �μ��� �ְ�/ �ּ� �޿�, ����� ���
-- �Ҽ����� ���ڸ������� ���
select
    deptno, 
    round(avg(sal), 1) as avg,
    max(sal) as max,
    min(sal) as min,
    count(*) as �����
from emp
group by deptno
order by deptno;



-- 2) ���� ��å�� ���� ������� 3�� �̻��� ��å�� ���ؼ�
-- ��å�� ������� ���
select
    job,
    count(*) as �ο�
from emp
group by job
having count(*) >=3
order by �ο�
;
-- select ���� ���� �÷��� ����(alias)�� order by ���������� ��� ����!



-- 3) �Ի� ������ �޿� ���, �޿� �ּ�/�ִ밪 ���. 
-- �Ի� ������ 'YYYY' �������� ���.
select
    to_char(hiredate, 'YYYY') as �Ի翬��,
    count(ename) as �ο�,
    round(avg(sal), 1) as "��� ����",
    max(sal),
    min(sal)
from emp
group by to_char(hiredate, 'YYYY')
order by �Ի翬��;



-- 4) �Ի� ������, �μ����� ����� �Ի� �ߴ��� ���.
select
    to_char(hiredate, 'YYYY') as �Ի翬��,
    deptno as �μ���ȣ,
    count(ename) as �ο�
from emp
group by to_char(hiredate, 'YYYY'), deptno
order by �Ի翬��;



-- 5) ������ �޴� �������� ���� �ʴ� �������� ���
select 
    count(comm) as ����,
    count(nvl(comm, 0)) as ����x
from emp;


select
    nvl2(comm, 'y', 'n'),
    count(*)
from emp
group by nvl2(comm, 'y', 'n')
;


