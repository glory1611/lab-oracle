set serveroutput on;

-- �̸��� �Է� �޾Ƽ� 
-- ���, �μ���ȣ �˻��ؼ�
-- ���, �̸�, �μ���ȣ ���

accept p_ename prompt '�̸� �Է�';

declare
    v_ename     varchar2(100) := trim(upper('&p_ename'));
    v_empno     number;
    v_deptno    number;
begin
    select  empno, deptno
    into    v_empno, v_deptno
    from    emp
    where   upper(ename) = v_ename;
    
    dbms_output.put_line ('��� : ' || v_empno);
    dbms_output.put_line ('�̸� : ' || v_ename);
    dbms_output.put_line ('�μ���ȣ : ' || v_deptno);
end;
/


-- �̸��� �Է� �޾Ƽ� 
-- emp, dept ���̺��� ����ؼ�(JOIN)
-- 'SCOTT�� DALLAS�� RESEARCH �μ����� �ٹ��մϴ�.' �� ���� �������� ���


accept p_ename prompt '�̸� �Է�';

declare
    v_ename     varchar2(100):= trim(upper('&p_ename'));
    v_loc       varchar2(100);
    v_dname     varchar2(100);
begin
    select  d.loc, d.dname
    into    v_loc, v_dname
    from    emp e join dept d
                  on e.deptno = d.deptno
    where   upper(e.ename) = v_ename;
    dbms_output.put_line (v_ename || '��(��) ' || 
                          v_loc || '�� '  || 
                          v_dname || '�μ����� �ٹ��մϴ�.' );
end;
/

-------------------------------------------
accept p_ename prompt '�̸� �Է�';

declare
    v_ename     varchar2(100):= trim(upper('&p_ename'));
    v_loc       varchar2(13);
    v_dname     varchar2(14);
    v_deptno    number(2);
begin
    -- ��� �̸����� �� ����� �ٹ��ϴ� �μ� ��ȣ�� �˻�
    select  deptno
    into    v_deptno
    from    emp
    where   upper(ename) = v_ename;
    -- �μ� ��ȣ�� ����ؼ� �μ��� �̸�, ��ġ�� �˻�
    select  dname, loc
    into    v_dname, v_loc
    from    dept
    where   deptno = v_deptno;
    -- �˻��� ������ ȭ�鿡 ���
    dbms_output.put_line (v_ename || '��(��) ' || 
                          v_loc || '�� '  || 
                          v_dname || '�μ����� �ٹ��մϴ�.' );
end;
/







