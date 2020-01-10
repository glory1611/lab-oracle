-- ���̺� ����
create table ex1(
    ex_id       number, 
    ex_text     varchar2(10),
    ex_date     date
);


-- ���̺� ����(�÷� �̸�, ������ Ÿ��, Null ����) Ȯ��
desc ex1;

-- ���̺� ������(���ڵ�) ����(����)
insert into ex1(ex_id, ex_text, ex_date)
values (1, '�ȳ��ϻ���', sysdate);

-- ���̺� ����� ���ڵ� �˻�
select * from ex1;

-- ����� �����͸� DBMS�� ���� ����
commit; -- Ʈ�������� �Ϸ��ϴ� 



-- DDL(Data Definition Language) : ������ ���� ���
-- ���̺� ����
-- create, alter, drop, truncate
-- ����    ����   ����
-- DDL ����� ������ �Ǹ� �ڵ����� commit�� ��.

-- DML(Data Manuplation Language) : ������ ���� ���
-- ���ڵ� ����
-- insert, update, delete
-- �߰�    ����    ����
-- DB�� ������ ����ڰ� commit ����� �����ؾ߸� DBMS�� ���������� �ݿ���.


------------------
------------------

insert into ex1 (ex_id, ex_text)
values (2, 'abc');


select * from ex1;


-- ���̺��� ��� �÷��� ���� ������ ����
-- insert into �������� �÷� �̸��� ������ �� �ִ�.
-- ��, values�� ���̺��� �÷� ������ ��ġ���Ѽ� ��� �÷��� ���� �����ؾ� ��.
insert into ex1
values (11, 'data', sysdate);

insert into ex1 values (20); -- values�� ������ �÷��� ������ �ٸ�.
insert into ex1 values (sysdate, 'test', 0); -- values�� ������ �÷� ������ �ٸ�.

insert into ex1 (ex_text)
values ('����ֳ���?'); -- varchar2(10)�� ������ �� �ִ� ���ڿ� ���̸� �ʰ�

commit;


-- ���̺� �̸�: ex02
-- �÷�: ex_id - number(2), ex_text - varchar2(5 char)

create table ex02(
    ex_id       number(2),
    ex_text     varchar2(5 char)
);
    
desc ex02;

insert into ex02
values (1, '�ȳ��ϼ���');


desc emp;
