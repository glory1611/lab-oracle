-- ������ ������ ���ڵ� �˻�
-- select �÷�, ... from where ����;

-- ��� ���̺��� �μ� ��ȣ�� 10�� ������� ��� �÷� �˻�

select * from emp where deptno = 10;

select ename from emp where deptno = 10;

-- ��� ���̺��� �޿��� 2500 �̻� (>=) �� �������� �˻�
select * from emp where sal >= 2500;

select * from emp where sal >= 2500 and deptno = 10;


-- ��� ���̺��� �޿��� 1000 �̻�, 2000�̸��� �������� ��� �÷��� �˻�
select * from emp where sal >= 1000 and sal < 2000;

select * from emp 
    where sal >= 1000 and sal < 2000;



select * from emp 
    where sal >= 3000 and sal <= 5000;
    
select * from emp
    where sal between 3000 and 5000;
    
    
-- ��� ���̺��� �޿��� 1000 �����̰ų� �Ǵ� 5000 �̻��� �������� ��� �÷� �˻�
select * from emp 
    where sal <=1000 or sal >= 5000;

-- ��� ���̺��� 10�� �Ǵ� 20�� �μ����� ���ϴ� �������� ��� �ɷ� �˻�
select * from emp
    where deptno = 10 or deptno = 20;
    
select * from emp
    where deptno in (10, 20);
    


-- ��� ���̺��� �μ� ��ȣ�� 10���� �ƴ� �������� ��� �÷� �˻�
-- �ٸ� : != , <>, ^=
select * from emp
    where deptno != 10;

select * from emp
    where deptno <> 10;
    
select * from emp
    where not deptno = 10;
    

-- ���� ���̺��� ��å�� 'CLERK' �� �������� ��� ������ �˻�

select * from emp
    where job = 'CLERK';
-- Oracle ���� �����(select, from, whre, ...), ���̺� �̸�, �÷� �̸��� ��ҹ��ڸ� �������� ����
-- ����(Column)�� ����� ���� ��ҹ��ڸ� ������
-- 'Clerk' != 'CLERK'


-- ���ڿ��� ũ�� �񱳰� ������.
select * from emp
    where ename > 'F';
    
    
    
-- ���� ���̺��� �μ� ��ȣ�� 20�� �̰ų� ��å�� Salesman �� �������� ��� ������ �˻�
select * from emp
    where deptno = 20 or job = 'SALESMAN';
    
    
-- ���� ���̺��� ��å�� 'CLERK'�̰ų� �Ǵ� 'ANALYST' �Ǵ� 'MANAGER' �� �������� ��� ����
select * from emp
    where job = 'CLERK' or job = 'ANALYST' or job = 'MANAGER';

select * from emp
    where job IN ('CLERK', 'ANALYST', 'MANAGER');
    
    
    
-- ���� ���̺��� ��å�� 'CLERK', 'ANALYST', 'MANAGER' �� �ƴ� �������� ��� ������ �˻�
SELECT
    *
FROM EMP
    WHERE JOB != 'CLERK' AND JOB != 'ANALYST' AND JOB != 'MANAGER';
    

SELECT
    *
FROM EMP
    WHERE JOB NOT IN ('CLERK', 'ANALYST', 'MANAGER');
    
    
    
-- ���� ���̺��� �̸��� 'A'�� �����ϴ� �������� ��� ���� �˻�
SELECT
    *
FROM EMP
WHERE ENAME LIKE 'A%';


SELECT
    *
FROM EMP
WHERE JOB LIKE '_LERK';






-- ���� ���̺��� ����(comm)�� null�� �������� ��� ������ �˻�
select * from emp
    where comm is null;


-- ���� ���̺��� ����(comm)�� null�� �ƴ� �������� ��� ������ �˻�
select * from emp
    where comm is not null;
    

select ename "�̸�" from emp
    where comm is not null;
    
    
-- ���� ���̺��� ������ �޴� ���� �߿��� �޿��� 1500 �ʰ��ϴ� ������ ����� �̸��� �޿��� �˻�
select empno "���", ename "�̸�" from emp
    where comm is not null and sal > 1500;
    

-- ���� ���̺��� ������ ���� �ʴ� ���� �߿��� �޿��� 1500 �ʰ��ϴ� ������ ����� �̸��� �޿��� �˻�
select empno "���", ename "�̸�" from emp
    where comm is null and sal > 1500;
    
    
-- ������(union), ������(intersect), ������(minus)

select * from emp where deptno = 10 or deptno = 20;

select * from emp where deptno = 10
union
select * from emp where deptno = 20;


-- ���� �����ڸ� ����� �� �ΰ��� select ������ ���� �÷����� ���� ������ �˻��ؾ� ��(!)

select * from emp where deptno = 10 or deptno = 20;




select empno, ename, deptno from emp where deptno = 10
union
select empno, ename, deptno from emp where deptno = 20;


-- �̸��� 'E'�� �����ϴ� ��� ���� ���� [a ����]
select * from emp 
    where ename like '%E%';
    
-- job�� 'E'�� �����ϴ� ��� ���� ���� [b ����]
select * from emp
    where job like '%E%';
    
-- [a, b ������]
select * from emp 
    where ename like '%E%'
intersect
select * from emp
    where job like '%E%';



-- 30�� �μ����� ���ϴ� ��å�� SALESMAN�� �������� ��� ���� �˻�
select empno "���", ename "�̸�", sal "�޿�", deptno "�μ�" from emp
    where deptno = 30 and job = 'SALESMAN';
    


-- 20, 30�� �μ����� �ٹ��ϴ� ������ �� �޿��� 2000�� �ʰ��ϴ� �������� ���, �̸�, �޿�, �μ���ȣ�� �˻�
select empno "���", ename "�̸�", sal "�޿�", deptno "�μ�" from emp
    where deptno in (20, 30) and sal > 2000;
    
select empno "���", ename "�̸�", sal "�޿�", deptno "�μ�" from emp
    where (deptno = 20 or deptno = 30) and sal > 2000;


-- ������ ���� ������ �߿���, �޴����� �ְ�, ��å�� 'MANAGER' �Ǵ� 'CLERK'�� �������� ��� ������ �˻�
select * from emp
    where comm is null and mgr is not null and job in ('MANAGER', 'CLERK');




