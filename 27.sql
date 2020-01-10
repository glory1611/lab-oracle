/*  �ݺ���

(1) LOOP

loop
    �ݺ��� ����;
    exit when ���ǽ�;
end loop;


(2) WHILE LOOP

while ���ǽ� 
    loop
    ���ǽ��� ���� �� �ݺ��� ����;
end loop;


(3) FOR LOOP

for ���� 
    in ���۰�..�������� 
    loop    
    �ݺ��� ����;
end;
-- for loop���� ����� ������ declare �������� �������� ����(!)
-- for loop���� ����ϴ� ������ �ڵ����� 1�� ������(!)

*/

set serveroutput on;

-- 1)
declare
    v_num number := 1;
begin
    loop
        -- v_num�� ���� ���
        dbms_output.put_line ('v_num = ' || v_num); 
        -- v_num�� ���� 1����
        v_num := v_num + 1;
        -- loop ���� ����
        exit when v_num > 9999; -- v_num = 6
        
    end loop;
end;
/

-----------------------
-- loop�� �̿��ؼ� ������ 2���� ���
declare
    n number := 1;
begin
    loop
        dbms_output.put_line ('2 x ' || n || ' = ' || n * 2);
        n := n + 1;
        exit when n > 59259;
end loop;
end;
/


-- 2)

declare
    v_num number := 1;
begin
    while v_num < 6
    loop
        dbms_output.put_line ('v_num = ' || v_num);
        v_num := v_num + 1;
    end loop;

end;
/

-----------------------
-- while loop�� �̿��ؼ� ������ 3���� ���
declare
    n number := 1;
    
begin
    while n < 10
    loop
        dbms_output.put_line ('3 x ' || n || ' = ' || (n * 3));
        n := n + 1;
    end loop;

end;
/

-- while loop���� exit ��� 5���� ���
declare
    v_n number := 1;
begin
    while v_n < 10 
    loop
    dbms_output.put_line ('v_n = ' || v_n);
    v_n := v_n + 1;
    exit when v_n > 5;
--    exit when v_n = 5;
--    v_n := v_n + 1;
    end loop;
end;
/

-- 3)
begin
    for n in 1..5 
    loop
    dbms_output.put_line ('n = ' || n);
    end loop;
end;
/

-----------------------
-- for loop�� �̿��ؼ� ������ 3���� ���

begin
    for n in 1..9 
    loop
    dbms_output.put_line ('4 x ' || n || ' = ' || (n * 4));
    end loop;
end;
/

-- for loop���� exit ��� 5���� ���

begin
    for i in 1..10
    loop
    dbms_output.put_line ('i = ' || i);
    exit when i = 5;
    end loop;
end;
/

-- for loop���� ������ �������� ���ҽ�Ű�鼭 �ݺ�
begin
    for i in reverse 1..5
    loop
    dbms_output.put_line ('i = ' || i);
    end loop;
end;
/




-- continue
begin
    for i in 1..10
    loop 
    continue when mod(i, 2) = 0; -- continue ������ �����ϸ� loop�� �ٽ� �ö󰡶�
    dbms_output.put_line (i);
    end loop;

end;
/

