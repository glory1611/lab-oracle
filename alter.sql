/*
1. emp ���̺�� �Ȱ��� ����(�÷��̸�, ������ Ÿ��)�� ���� ���̺��� hw_emp��� �̸����� ����

2. hw_emp ���̺� ���ο� �÷��� �߰�
   �÷� �̸�: etc
   ������ Ÿ��: �ִ� 20 bytes ���� ���� ���ڿ�

3. etc �÷��� 100 bytes���� ���ڿ��� ������ �� �ֵ��� ����

4. etc �÷��� �̸��� remark�� ����

5. emp ���̺��� �����͸� ��� hw_emp�� ����. remark �÷��� ���� ��� null

6. hw_emp ���̺��� empno �÷��� ����Ű ���� ������ �߰�

7. hw_emp ����
*/

-- 1
create table hw_emp
             as select * from emp
             where 1 != 1
;
    
desc hw_emp;
select * from hw_emp;

-- 2
alter table hw_emp add etc varchar2(20);

-- 3
alter table hw_emp modify etc varchar2(100);

-- 4
alter table hw_emp rename column etc to remark;

-- 5
insert into hw_emp 
            (empno, ename, job, mgr, hiredate, sal, comm, deptno)
            select 
            empno, ename, job, mgr, hiredate, sal, comm, deptno -- *
            from emp
;

-- 6
alter table hw_emp add constraint pk_hw primary key (empno);

-- 7
drop table hw_emp;





create sequence seq1;
select seq1.nextval from dual;


insert into ex02(eid, ex_text)
values(seq1.nextval, 'aabbcc');


select * from ex02;



