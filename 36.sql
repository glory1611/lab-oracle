/*
Procedure(���ν���) vs Function(�Լ�)

1. Procedure(���ν���)
    (1) Ư�� ������ �����ϱ⸸ �ϰ�, ��������� ��ȯ(return)���� �ʴ� ���� ���α���
    (2) ����: �ٸ� PL/SQL (���α׷�) ���ο��� �����. SQL ���������� ����� �� ����.
    (3) �Ķ���� : in, out, in out ������ ����� �� ����.
    (4) ��ȯ : return ���� ����� ��ȯ�� �� �� ����.
        out, in out �Ķ���͸� ���ؼ� 1�� �̻��� ���� ��ȯ�� ���� ����.
    
2. Function(�Լ�)
    (1) Ư���� ����� ������ �� �ݵ�� ������� ��ȯ(return)�ϴ� ���� ���α���
    (2) ����: �ٸ� PL/SQL (���α׷�) ���� �Ǵ� SQL ���� �ȿ��� ����� �� ����.
    (3) �Ķ����: in ����� �Ķ���͸� ���. in�� ����.
        ���������δ� �Ѽ������� out, in out �Ķ���͸� ����� �� ������,
        out/ in out �Ķ���͸� ���� �Լ��� SQL ���忡�� ����� �� ����.
    (4) ��ȯ: �ݵ�� return ���� ����ؼ� 1���� ���� ��ȯ�ؾ� ��.
    
�Լ��� �����ϴ� ���

create [or replace] function �Լ��̸� [(
    �Ķ����1 Ÿ�� [:= �⺻��1],
    �Ķ����2 Ÿ�� [:= �⺻��2],
    ...
)]
return ����Ÿ��
is
begin
[exception]
end;
/

*/

create or replace function my_add(
    p_x number,
    p_y number
) 
return number
is
    v_result number;
begin
    v_result := p_x + p_y;
    return v_result;
end;
/


select my_add(1, 2) from dual;



-- ���� �ΰ��� �Ķ���ͷ� ���� �޾Ƽ� ������ ����� �����ϴ� �Լ�
create or replace function my_func(
    p_x number,
    p_y number
)
return number
is
--    v_result number;
begin
--    v_result := p_x - p_y;
--    return v_result;
    return p_x - p_y;
end;
/


select my_func(10, 20) from dual;

declare
    r number;
begin
    r := my_func(10, 20);
    dbms_output.put_line (r);
end;
/


-- ���ڿ� �ΰ��� �Ķ���ͷ� ���� �޾Ƽ� �� ���ڿ��� �ϳ��� ��ģ ���ڿ��� �����ϴ� �Լ�
create or replace function my_func2(
    str1 varchar2,
    str2 varchar2
)
return varchar2
is
--    v_text varchar2(100);
begin
--    v_text := str1 || str2;
--    return v_text;
    return str1 || str2;
end;
/

select my_func2('Hello', 'World') from dual;

declare
    text varchar2(100);
    str1 varchar2(20);
    str2 varchar2(20);
begin
    select my_func2(ename, job) into text from emp
    where empno = 7788;
    
    dbms_output.put_line (text);
end;
/

-- ����� ������ �Ķ�̷� ���޹޾Ƽ�
-- �ش� ����� �� �޿� (sal + comm) * (1 - tax) �� ����ؼ� �����ϴ� �Լ�

create or replace function my_func3 (
    p_tax number := 0.05
    p_empno number,
)
return number
is 
    v_total number;
begin
    select (sal + nvl(comm, 0)) * (1 - p_tax) into v_total from emp
    where empno = p_empno;
    return v_total;
end;
/


select empno, ename, my_func3(p_empno => 7788) from emp where empno = 7788;

-- ���丮�� �Լ� �����
create or replace function my_fact (
    n number
)
return number
is 
    v_fact number := 1;
begin
    for i in 1..n
    loop
        v_fact := v_fact * i;
    end loop;
    return v_fact;
end;
/

begin
    for i in 0..5
    loop
        dbms_output.put_line (my_fact(i));
    end loop;
end;
/

