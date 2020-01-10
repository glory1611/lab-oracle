--1. ��� �̸� 5������ ��� ���� empno, ename�� ���.
--����� �� �� �ڸ��� �����ְ� �������� *�� ���
--�̸��� ù ���ڸ� �����ְ� �������� *�� ���
--(��� ����)
--empno mask_no ename mask_name
-----------------------------
-- 7369    73** SMITH S****


select
    empno, ename,
    rpad(trunc(empno, -2) / 100, 4, '*') as ���,
    rpad(substr(empno, 1, 2), 4, '*') as ���,
    rpad(substr(ename, 1, 1), length(ename), '*') as �̸�
from emp
    where length(ename) = 5;





--1. ��� �̸� 5������ ��� ���� empno, ename�� ���.
--����� �� �� �ڸ��� �����ְ� �������� *�� ���
--�̸��� ù ���ڸ� �����ְ� �������� *�� ���
--(��� ����)
--empno mask_no ename mask_name
-----------------------------
-- 7369    73** SMITH S****



select
    empno, ename
from emp
    where length(ename) = 5;






--2. ������� �� ��� �ٹ��ϼ��� 21.5���̰�, �Ϸ� �ٹ� �ð��� 8�ð��̶�� �� ��,
--������� �� �޿�(day_pay), �ñ�(time_pay)�� ����Ͽ� ���.
--�� �޿��� �Ҽ��� ����° �ڸ����� ����, �ñ��� �Ҽ��� �ι�° �ڸ����� �ݿø�
--(��� ����)
--empno ename sal day_pay time_pay
--------------------------------
-- 7369 SMITH 800   37.20      4.7



select
    empno as ���,
    ename as �̸�,
    trunc(sal/ 21.5, 2) as �ϱ�,
    trunc(sal/ 21.5, 2) as �ϱ�,
    round(sal/ 21.5/ 8, 1) as �ñ�
from emp;



--3. �Ի糯¥�� �������� 3������ ���� �� ù��° �����Ͽ� �������� �ȴٰ� �� ��,
--������� �������� �Ǵ� ��¥�� YYYY-MM-DD �������� ���.
--(Hint) next_day(��¥, 'x����'): ���ƿ��� ������ ��¥�� ����
--(��� ����)
--empno ename hiredate   regular
---------------------------------
-- 7369 SMITH 1980/12/17 1981-03-23



select
    empno "���",
    ename "�̸�",
    to_char(hiredate, 'YYYY-MM-DD') "�Ի���",
    to_char(next_day(add_months(hiredate, 3), '��'), 'YYYY-MM-DD') as "������ ��ȯ��"
from emp;



-- 
select
    sysdate, next_day(sysdate, '��') 
from dual;
