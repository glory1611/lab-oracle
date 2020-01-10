/*
Ŀ��(cursor): PL/SQL ���ο��� SQL ������ ó���ϴ� ������ ������ �޸� ����
(1) ����� Ŀ��(explicit cursor): �����ڰ� ���� �̸��� �����ϰ� ����ϴ� Ŀ��
(2) ������ Ŀ��(implicit cursor): ���ٸ� ���� ���� ����� Ŀ��

����� Ŀ��: ���� -> open -> fetch -> close
*/

set serveroutput on;

select * from dept;



declare
    v_dept dept%rowtype;
    
begin
    select * into v_dept from dept where deptno = 10;
    -- ����Ŭ DB ���ο��� ������ Ŀ���� �ڵ����� ������.
    dbms_output.put_line (v_dept.deptno);
end;
/

-- select into ������ 1�� �̻��� ��(row)�� select �Ǵ� ���� ����� �� ����.
-- ����� Ŀ���� select�� ��� ���� ������ ������� ����� �� �ִ�.

declare
    -- ����� Ŀ�� ����:
    -- cursor Ŀ���̸� is (SQL ����);
    cursor my_cursor is (
        select * from dept where deptno = 10
    );
        
    v_row dept%rowtype; -- Ŀ���� �����͸� ����(fetch)�� �� ����� ����
    
begin
    -- Ŀ�� open(����, ����)
    open my_cursor;
    
    -- Ŀ�� fetch(������ �б�)
    fetch my_cursor into v_row;
    dbms_output.put_line(v_row.deptno || ' , ' || v_row.dname || ' , ' || v_row.loc);
    
    -- Ŀ�� close(�ݱ�)
    close my_cursor;
    
end;
/



declare
    -- (1) Ŀ�� ����
    cursor sel_emp is (
        select * from emp where empno = 7788
    );

    v_row emp%rowtype; -- Ŀ�� ����� ����(fetch)�� ����
    
begin
    -- (2) Ŀ�� open
    open sel_emp;
    
    -- (3) �Ѽ� ���� ��� �б�(fetch)
    fetch sel_emp into v_row;
    dbms_output.put_line (v_row.empno || ' , ' || v_row.ename);
    
    
    -- (4) Ŀ�� close
    close sel_emp;

end;
/


-- ��� ���� �������� �� �� �ִ� ����� Ŀ��

declare
    -- ����� Ŀ�� ����
    cursor sel_dept is (
        select * from dept
    );

    -- Ŀ�� ���� ����� fetch�� �� ����� ����
    v_row dept%rowtype;
begin
    open sel_dept;
    
    -- fetch -- ��� ���� �������� ��� �ݺ��� �ȿ��� fetch
    loop
        fetch sel_dept into v_row;
        
    exit when sel_dept%notfound;
    
    dbms_output.put_line(v_row.deptno || ' , ' || v_row.dname || ' , ' || v_row.loc);
    end loop;
    
    close sel_dept;

end;
/




-- emp ���̺��� �μ���ȣ�� 30���� �������� ���, �̸�, �޿��� ���

declare
    cursor sel_emp is (
        select * from emp where deptno = 30
    );

    v_row emp%rowtype;
    
begin
    open sel_emp;
    
    loop
        fetch sel_emp into v_row;
    exit when sel_emp%notfound;
    
    dbms_output.put_line(v_row.empno || ' , ' || v_row.ename || ' , ' || v_row.sal);      
    
    end loop;
    
    close sel_emp;
    
end;
/




-- ����� Ŀ���� for loop���� ���
-- open, fetch, close�� �ڵ����� �����
-- for ���� in Ŀ�� loop ... end loop;

declare
    cursor my_cursor is (
    select * from dept
    );

begin
    for row in my_cursor
    loop
        dbms_output.put_line(row.deptno || ' , ' || row.dname || ' , ' || row.loc);
        
    end loop;

end;
/


-- 20�� �μ��� �������� ���, �̸�, �޿��� ���


declare
    cursor sel_emp is (
        select * from emp where deptno = 20
    );

begin
    for i in sel_emp
    loop
        dbms_output.put_line (i.empno || ' , ' || i.ename || ' , ' || i.sal);
    
    end loop;

end;
/

select * from emp where sal < 
(select avg(sal) from emp);

-- �Ķ����(parameter, �Ű�����)�� ���� Ŀ�� ����
-- cursor Ŀ���Ӹ�(���� Ÿ��, ���� Ÿ��, ... ) is SQL����;

declare
    v_avg number;
    
    cursor my_cursor(p_avg number) is
        select ename from emp where sal < p_avg;
begin
    select avg(sal) into v_avg from emp;
    dbms_output.put_line (v_avg);
    
    for row in my_cursor(v_avg)
    loop
        dbms_output.put_line (row.ename);
    end loop;
    
end;
/



-- ��ü ������ �޿� ��պ��� ���� �޿��� �޴� �������� �̸��� ����ϴ� PL/SQL

-- 10�� �μ�����, 10�� �μ� �������� �޿� ��պ��� ���� �޿��� �޴� �������� �̸��� ����ϴ� PL/SQL

-- ���μ�����, �� �μ� �������� �޿� ��պ��� ���� �޿��� �޴� �������� �μ���ȣ�� �����̸��� ����ϴ� PL/SQL

declare
    cursor my_cursor is (
        select * from emp 
        where 
            sal < (select avg(sal) from emp)
    );

begin
    for i in my_cursor
    loop
        dbms_output.put_line (i.ename);
    end loop;

end;
/

-- 10�� �μ�����, 10�� �μ� �������� �޿� ��պ��� ���� �޿��� �޴� �������� �̸��� ����ϴ� PL/SQL
declare
    cursor my_cursor is (
        select * from emp 
        where 
            deptno = 10 
            and
            sal < (select avg(sal) from emp where deptno = 10)
    );

begin
    for i in my_cursor
    loop
        dbms_output.put_line (i.ename);
    end loop;

end;
/


-- ���μ�����, �� �μ� �������� �޿� ��պ��� ���� �޿��� �޴� �������� �μ���ȣ�� �����̸��� ����ϴ� PL/SQL
-------------
-- (1)
declare
    cursor get_deptno is
        select deptno from dept;
    
    cursor my_cursor(p_deptno emp.deptno%type) is 
        select * from emp 
        where 
            deptno = p_deptno 
            and
            sal < (select avg(sal) from emp where deptno = p_deptno)
    ;

begin
    for rslt in get_deptno
    loop
--        dbms_output.put_line (rslt.deptno);
        
        for i in my_cursor(rslt.deptno)
        loop
            dbms_output.put_line (i.deptno || ' , ' || i.ename || ' , ' || i.sal);
        
        end loop;
    end loop;
end;
/

---------
---------

select deptno from dept;
select deptno, avg(sal) from emp group by deptno;

-------------
--(2)
-------------
declare
    cursor cur1 is 
        select deptno, avg(sal) average from emp group by deptno
        order by deptno
    ;
    cursor cur2(p_deptno emp.deptno%type, p_avg number) is
        select * from emp 
        where 
            deptno = p_deptno
            and
            sal < p_avg
    ; 

begin
    for r1 in cur1
    loop
--        dbms_output.put_line (r1.deptno || ' , ' || r1.average);
        
        for r2 in cur2(r1.deptno, r1.average)
        loop
            dbms_output.put_line (r2.deptno || ' , ' || r2.ename || ' , ' || r2.sal);
            
        end loop;    
    end loop;

end;
/


-------------
--(3)
-------------
select deptno, avg(sal) average from emp 
    group by deptno
order by deptno
;

select a.deptno
    from (select deptno, avg(sal) average from emp 
    group by deptno
order by deptno) a
;
    
select * from emp e
    join (select deptno, avg(sal) average from emp group by deptno) a
    on e.deptno = a.deptno
    where e.sal < a.average
order by e.deptno
;

--
declare
    cursor my_cursor is 
        select * from emp e
            join (select deptno d, avg(sal) average from emp group by deptno) a
            on e.deptno = a.d
            where e.sal < a.average
        order by e.deptno
        ;

begin
    for i in my_cursor
    loop
        dbms_output.put_line (i.deptno || ' , ' || i.ename || ' , ' || i.sal);
    end loop;

end;
/

