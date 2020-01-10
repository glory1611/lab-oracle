-- Sub Query
-- ����� 7369�� ����� �Ŵ��� ���
select mgr from emp where empno = 7369
;

-- ����� 7902�� ����� �̸�
select ename from emp where empno = 7902
;


select ename from emp
    where empno = (
        select mgr from emp where empno = 7369
);


-- ��� ���̺��� ��� �޿����� �� ���� �޿��� �޴� �����鸸 ���
select
    *
    from emp
    where sal > (
        select avg(sal) from emp
)
;


-- ALLEN ���� comm�� �� ���� �޴� ���� ���� ���
select
    *
    from emp
    where comm > (
        select comm from emp where ename = 'ALLEN'
)
;


-- �μ� ��ȣ�� 20 �Ǵ� 30���� �������� ���� ���
select
    *
    from emp
    where deptno = 20 or deptno = 30
;

select
    *
    from emp
    where deptno in(20, 30)
;

-- �� �μ����� �޿��� ���� ���� ������ ������ ���
select 
    *
    from emp
    where sal in (
        select min(sal) from emp group by deptno
        )
;


select min(sal) from emp group by deptno;
select * from emp where sal in(950, 800, 1300);


-- �� �μ����� �޿� �ּ� ���� �޴� ���� ������ ���
select deptno, min(sal) from emp group by deptno;

select * from emp
    where (deptno, sal) in (
        select deptno, min(sal) from emp group by deptno);
        
        
        

-- Sub Query�� all/any
select min(sal) from emp group by deptno;

select * from emp
where sal = any (select min(sal) from emp group by deptno
);



select * from emp where sal in (950, 800, 1300);
select * from emp where sal = any (950, 800, 1300);
select * from emp where sal > any (950, 800, 1300);




-- 