-- ���ڵ� ����/����

select * from ex_emp3;

-- ex_emp3 ���̺��� ����� 7369�� ����� �޿��� 2000���� ����

update ex_emp3 
set deptno = null
where deptno = 20;

-- update ���忡�� where ���� �����ϸ� ���̺��� ��� ���� �����ϰ� ��.

update ex_emp3 
set sal = 1234
;

rollback;
-- �ٷ� ������ commit ����(���� commit ����)�� �ǵ����� ��ɾ�



-- ex_emp3 ���̺��� �μ� ��ȣ�� 10���� �������� ���ڵ带 ����
delete from ex_emp3 where deptno = 10;


-- ex_emp3 ���̺��� 20�� �μ����� ���ϴ� �������� ������ 100���� ����

update ex_emp3
set comm = 100
where deptno = 20;

select * from ex_emp3
order by deptno;





-- ex_emp3 ���̺��� �޿��� ��պ��� ���� �������� �޿��� 2��� �λ�
update ex_emp3
set sal = sal * 2
where sal < (
            select avg(sal) from ex_emp3);

select * from ex_emp3
order by deptno;


select avg(sal) from ex_emp3;