/*
1. ���̺� ���� SQL �� �ۼ�
  1) emp ���̺��� �����ؼ� emp2�� ����
  2) dept ���̺��� �����ؼ� dept2�� ����
  3) salgrade ���̺��� �����ؼ� salgrade2�� ����

2. dept2 ���̺� �Ʒ��� ���� �μ� ������ ����ϴ� SQL �� �ۼ�
  deptno  dname   loc
  -----------------------
  50      ORACLE  Seoul
  60      SQL     Jeju
  70      DDL     Pusan
  80      DML     Incheon

3. 2���� ����� �μ����� �ٹ��ϴ� ��� ����(empno, ename, job, mgr, hiredate, sal, comm)�� �����Ӱ� emp2 ���̺� ����ϴ� SQL �� �ۼ�

4. emp2 ���̺��� 20�� �μ����� �ٹ��ϴ� ������� ��� �޿����� ���� �޿��� �޴� ������� 80�� �μ��� �ű�� SQL �� �ۼ�

5. emp2 ���̺��� ����� �߿�, 10�� �μ��� ��� �� �Ի����� ���� ���� ������� �� �ʰ� �Ի��� ������� �޿��� 10% �λ��ϰ�, �μ��� 70������ �̵��ϴ� SQL �� �ۼ�

6. emp2 ���̺��� ����� �� �޿� ����� 5�� ����� �����ϴ� SQL �� �ۼ�

7. ��� �۾� ����� �����ͺ��̽��� ������ ����
*/
desc emp2;

create table emp2 as select * from emp;
create table dept2 as select * from dept;
create table salgrade2 as select * from salgrade;

insert into dept2 values (50, 'oracle', 'seoul');
insert into dept2 values (60, 'SQL', 'JEJU');
insert into dept2 values (70, 'ddl', 'busan');
insert into dept2 values (80, 'dml', 'incheon');

/*
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)
*/
insert into emp2 values (1231, 'andres', 'left wing', 7839, to_date('2019/01/01', YYYY-MM-DD), 4000, 1000, 70);
insert into emp2 values (1111, 'ronaldo', 'FW', 1231, '2019/02/02', 10000, 5000, 80);
insert into emp2 values (1121, 'messi', 'FW', 1231, '2018/03/20', 90000, 8000, 50);
insert into emp2 values (1131, 'son', 'MD', 1231, '2010/12/23', 9800, 90000, 60);

select avg(sal)
from emp2
where deptno = 20;



-- 4. emp2 ���̺��� 20�� �μ����� �ٹ��ϴ� ������� ��� �޿����� ���� �޿��� �޴� ������� 80�� �μ��� �ű�� SQL �� �ۼ�

update emp2
set deptno = 80
where sal > (select avg(sal) from emp2 where deptno = 20)
)
;


-- 5. emp2 ���̺��� ����� �߿�, 10�� �μ��� ��� �� �Ի����� ���� ���� ������� �� �ʰ� �Ի��� ������� �޿��� 10% �λ��ϰ�, �μ��� 70������ �̵��ϴ� SQL �� �ۼ�


update emp2
set sal = sal * 1.1 , deptno = 70
where hiredate > (
    select max(hiredate) from emp2 where deptno = 10
    )
;

select max(hiredate) from emp2 where deptno = 30;


-- 6. emp2 ���̺��� ����� �� �޿� ����� 5�� ����� �����ϴ� SQL �� �ۼ�


delete from emp2
where ename in (
    select e.ename
    from emp2 e join salgrade2 s
    on e.sal between s.losal and s.hisal
    where s.grade = 5
)
;

delete from emp2
where sal between
        (select losal from salgrade2 where grade = 5)
        and
        (select hisal from salgrade2 where grade = 5)
;






