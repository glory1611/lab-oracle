-- ���� ����
-- ������ ����� ������ ���̺�鿡 ����� �������� Ȯ��
select constraint_name, constraint_type, table_name
from user_constraints;

-- ���� ���� �̸�, ���� ���� ����, ���̺� �̸�

select table_name from user_tables;

-- ���� ����
-- not null: �ݵ�� ���� �־�� ��.
-- unique: �ߺ��� ���� ����� �� ����.
-- primary key: ����Ű. ���̺��� ������ �Ѱ��� ��(��ũ��)�� �˻��� �� �ִ� �÷�.
-- foreign key: �ܺ�Ű. �ܷ�Ű. ���踦 �°� �ִ� ���� ���̺��� PK.
-- check: ����(condition)�� üũ�ϴ� ���� ����.
-- default: �÷��� �⺻��(insret���� �ʾƵ� �ڵ����� ����Ǵ� ��)�� ����.


-- ���̺� �̸�: ex03
-- �÷�: col1 - number, unique
--       col2 - varchar2(20), not null

create table ex03 (
        col1 number unique,
        col2 varchar2(20) not null
);


desc ex03;

insert into ex03 (col1, col2)
values (1, 'aaa');

insert into ex03 (col1, col2) 
values (1, 'bbb'); -- unique ���� ���� ����: insert ����

insert into ex03 (col2)
values ('bbb');

select * from ex03;

insert into ex03 (col1)
values (10);




-------------------
-------------------

-- ���̺� ���� �� ���� ���ǿ� �̸��� �ִ� ���
create table ex04 (
    col1 number constraint ex04_unq unique,
    col2 varchar2(20) constraint ex04_nn not null
);


desc ex04;


-- ���̺� �̸�: ex05
-- �÷�: col1 - number, primary key
--       col2 - varchar2(10)

create table ex05 (
    col1 number constraint ex05_PK primary key,
    col2 varchar2(10)
);

desc ex05;

insert into ex05
values(1, 'abc');


-- ���̺� �̸�: ex06
-- �÷�: col - varchar2(20), ���� ������ ���ԵǴ� ���ڿ��� ���̰� 8 �̻�.

create table ex06 (
    col varchar2(20) constraint ck_ex06 check(length(col) >= 8)
);


desc ex06;

insert into ex06 values('abcdefgh');

insert into ex06 values('abcd');


-- ���̺� �̸�: ex07
-- �÷�: ex_id - number, �⺻�� 0
--       ex_date - date, �⺻�� ����ð�

create table ex07 (
    ex_id   number default 0,
    ex_date date default sysdate
);
    
    
insert into ex07
values (1, to_date('2019-09-13', 'yyyy-mm-dd'));

select * from ex07;

insert into ex07 (ex_id)
values (100);

insert into ex07 (ex_date)
values (sysdate + 1);



create table ex_emp (
    empno   number(3)   constraint pk_ex_emp primary key,
    ename   varchar(20),
    deptno  number(2)   constraint fk_ex_dept references ex_dept(deptno)
);


create table ex_dept (
    deptno  number(2)   constraint pk_ex_dept primary key,
    dname   varchar2(20)
);





-- ex_dept ���̺� ����Ŀ�� ���� ��� (�μ� ��ȣ�� 1���� ���� ���)

insert into ex_emp
values (100, 'sam', 10);
-- �μ� ��ȣ�� ex_dept ���̺� �����Ǿ� ���� ���� �μ� ��ȣ�� insert�� �� ����.
-- FK�� ������ ex_emp ���̺��� deptno �÷����� null�� ����.

insert into ex_emp (empno, ename)
values (100, 'sam');


insert into ex_dept
values (10, '������');
insert into ex_dept
values (20, '�м���');

insert into ex_emp
values (201, 'joe', 10);

insert into ex_emp
values (301, 'ock', 20);


    
    
select * from ex_emp;