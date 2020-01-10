/*  ���ǹ�(Conditional Statement)

(1)
    if  ���ǽ� 
        then ���ǽ��� ���� �� ������ ����;
    end if;


(2)
    if  ���ǽ�
        then ���ǽ��� ���� �� ������ ����;
        else ���ǽ��� ������ �� ������ ����;
    end if;
    

(3)
    if  ���ǽ�1
        then ���ǽ�1�� ���� �� ������ ����;
        elsif ���ǽ�2
            then ���ǽ�2�� ���� �� ������ ����;
            elsif ...
                ...
        else ���� ��� ������ ������ �� ������ ����;
    end if;
    
    
*/
-- 1)

set serveroutput on;

declare
    v_num   number := 12;
begin
    if mod(v_num, 2) = 1 then
        dbms_output.put_line ('Ȧ��');
    end if;
    
    dbms_output.put_line('End PL/SQL');
end;
/

-- 2)
accept p_num prompt '���ڸ� �Է��ϼ���';

declare
    v_test   number := trim(&p_num);
    
begin
    if  mod(v_test, 2) = 1
        then    dbms_output.put_line ('odd number');
        else    dbms_output.put_line ('even number');
    end if;
    
    dbms_output.put_line ('End PL/SQL');
end;
/

-- 3)
declare
    v_s number := 68;
begin
    if v_s >= 90
        then    dbms_output.put_line ('A');
        elsif   v_s >= 80
            then    dbms_output.put_line ('B'); 
            elsif   v_s >= 70
                then    dbms_output.put_line ('C');
        else    dbms_output.put_line ('F');
    end if;
end;
/


declare
    v_n number := 9;

begin
    dbms_output.put_line (v_n);
    if  mod(v_n, 2) = 0
        then    dbms_output.put_line ('even number');
                if  mod(v_n, 4) = 0
                    then    dbms_output.put_line ('4�� ���');
                    else    dbms_output.put_line ('4�� ����� �ƴմϴ�.');
                end if;
        else    dbms_output.put_line ('odd number');
                if  mod(v_n, 4) = 0
                    then    dbms_output.put_line ('4�� ���');
                    else    dbms_output.put_line ('4�� ����� �ƴմϴ�.');
                end if;
    end if;
    
end;
/

-------------------------------------
-------------------------------------

select power(5, 2) from dual;

-- ������� �� ���� ���̸� �Է�
-- ��Ÿ��� ���Ǹ� �̿��ؼ�, ������ݷ����� �ƴ����� ���

accept p_a prompt 'a �� �Է�';
accept p_b prompt 'b �� �Է�';
accept p_c prompt 'c �� �Է�';

declare
    a number := &p_a;
    b number := &p_b;
    c number := &p_c;

begin
    if  power(a, 2) + power(b, 2) = power(c, 2)
        then    dbms_output.put_line ('���ﰢ���Դϴ�.');
        else    dbms_output.put_line ('���ﰢ�� �ƴմϴ�.');
    end if;
    
end;
/





