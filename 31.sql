/*
�÷���(collection): ���� Ÿ���� ������ �������� ������ �� ���
1) ���� �迭(associative array, index by table)
2) ��ø ���̺�(nested table)
3) VARRAY(cariable-size array)

���� �迭: key/index�� value�� ������ �����Ǵ� �÷���
���� �迭���� key/index�� binary_integer(����), pls_integer(���� ����), varchar2(���ڿ�) Ÿ�� ����.

���� �迭 ����(����)�ϴ� ���:
type �迭�̸� is table of ������Ÿ�� index by �ε���Ÿ��;

*/
set serveroutput on;

declare
    -- ���ڿ��� ���ҷ� ����, ���� ������ �ε����� ����ϴ� ���� �迭�� ����
 
    type students is table of varchar2(20) 
        index by pls_integer;
 
    -- ������ ���� �迭 Ÿ���� ���� ����
    v_stu students;
    
begin
    -- ���� �迭�� ������ ����: �迭�̸�(�ε���) := ��;
    v_stu(1) := '������';
    v_stu(2) := '�����';
    v_stu(3) := '�迵��';
    
    -- ���� �迭�� ����� ����(������)�� ���� ���� ��: �迭�̸�(�ε���)
--    dbms_output.put_line (v_stu(1));
    for i in 1..3 
    loop
        dbms_output.put_line (v_stu(i));
    end loop;
    
end;
/





declare
    -- �ε��� Ÿ��: varchar2(20), ���� Ÿ��: number�� ���� �迭�� ����(����)
    type arr_menu is table of number
        index by varchar2(20);
        
    v_menu arr_menu;

begin
    -- ���� �迭�� �����͸� 3�� ����
    -- ���� �迭�� ����� �����͸� ���
    v_menu('�ѽ�') := 1000;
    v_menu('���') := 500;
    v_menu('�߽�') := 100;
    
    dbms_output.put_line (v_menu('�ѽ�'));
    dbms_output.put_line (v_menu('�߽�'));
    dbms_output.put_line (v_menu('���'));
    
end;
/


declare
    -- �ε��� : ���� ����, ����(������Ÿ��) : ������ ���� �迭(arr_numbers)�� ����(����)
    -- ���� �迭 Ÿ���� ����(v_scores)�� ����
    
    type arr_numbers is table of number
        index by binary_integer;
        
    v_scores arr_numbers;
    v_sum number; -- �������� �հ踦 ������ ����
    v_avg number; -- �������� ����� ������ ����
    n number;
    
begin
    -- ���� �迭 v_scores�� 5���� ����(0 ~ 100)�� �Է�
    -- 5�� ������ �հܸ� ����ؼ� ���
    -- 5�� ������ ����� ����ؼ� ���
    
    v_scores(1) := 90;
    v_scores(2) := 80;
    v_scores(3) := 70;
    v_scores(4) := 60;  
    v_scores(5) := 50;
    
    n := 5;
    v_sum := 0;
    for i in 1..v_scores.count -- v_scores.count �迭 ���� ī��Ʈ
    loop
        v_sum := v_sum + v_scores(i);
    end loop;
    dbms_output.put_line ('�հ� = ' || v_sum);
        
    v_avg := v_sum/v_scores.count;
    dbms_output.put_line ('��� = ' || v_avg);

end;
/






select sum(sal), avg(sal), variance(sal), stddev(sal) from emp;
-- emp ���̺��� �޿��� ����, ���, �л�, ǥ�������� ����ϴ� PL/SQL

declare
    v_sum number;
    v_avg number;
    v_var number;
    v_std number;
    
begin
    select sum(sal), avg(sal), variance(sal), stddev(sal) 
    into v_sum, v_avg, v_var, v_std
    from emp;

    dbms_output.put_line (trunc(v_sum, 2));
    dbms_output.put_line (trunc(v_avg, 2));
    dbms_output.put_line (trunc(v_var, 2));
    dbms_output.put_line (trunc(v_std, 2));
end;
/

-- �ε����� ��������, �迭�� ����(������)�� ���� Ÿ���� ���� �迭�� ����
-- ����(dbms_random.value(x, y)) �Լ��� trunc �Լ��� ���
-- for loop�� ����ؼ� ���� �迭�� 10���� ���� ����(0 ~ 100)�� ����
-- 10�� ���� ������ ����, ���, �л�, ǥ������, �ִ�, �ּڰ��� ����ϴ� ���� ����
create table ex_scores (
    sid number primary key,
    score number not null
    );


declare
    type arr_num is table of number
        index by binary_integer;

    v_scores arr_num;
    v_s    number;
    v_a    number;
    v_v    number;
    v_d    number;
    v_max  number;
    v_min  number;
    x   number; -- �ε��� ��ȣ
    
begin

    for i in 1..10
    loop
        v_scores(i) := trunc(dbms_random.value(0, 101), 0);
    dbms_output.put_line ('�л� ' || i || ' : ' || v_scores(i));
    end loop;
    dbms_output.put_line ('--------------------');
    
    v_s := 0;
    for i in 1..v_scores.count
    loop
        v_s := v_s + v_scores(i);
    end loop;
    dbms_output.put_line ('�Ѱ� : ' || v_s);
    dbms_output.put_line ('--------------------');
    
    v_a := v_s/v_scores.count;
    dbms_output.put_line ('��� : ' || v_a);
    dbms_output.put_line ('--------------------');
    
    for i in 1..v_scores.count
    loop
    
    end loop;
    
end;
/




--    v_scores(1)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(2)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(3)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(4)     := trunc(dbms_random.value(0, 101), 0);  
--    v_scores(5)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(6)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(7)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(8)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(9)     := trunc(dbms_random.value(0, 101), 0);  
--    v_scores(10)    := trunc(dbms_random.value(0, 101), 0);


