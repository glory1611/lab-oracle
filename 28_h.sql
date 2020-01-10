set serveroutput on;

-- 1. ������(2�� ~ 9��)�� ���

declare
    a number := 2;
    x number := 1;
    
begin
    while a < 10
    loop
        dbms_output.put_line (a || ' * ' || x || ' = ' || (x * a));
        x := x + 1;
        if  x = 10
            then 
        dbms_output.put_line ('---------------------------------');
            a := a + 1;
            x := 1;
        end if;
--    exit when a = 10;
    end loop;
end;
/

-- (1)
begin
    for a in 2..9
    loop
        for x in 1..9
            loop
            dbms_output.put_line ( a || '*' || x || ' = ' || (a * x));
            if x = 9
            then dbms_output.put_line ('---------------------------------');        
            end if;
        end loop;
    end loop;    
end;
/

--------------
-- 2. ������(2�� ~ 9��)�� ���
--  2���� 2*2����, 3���� 3*3����, ...
--------------
declare
        a number := 2;
        x number := 1;
    
begin
    while a < 10
    loop
        dbms_output.put_line (a || ' * ' || x || ' = ' || (a * x));
        x := x + 1;
        if  x > a
            then 
        dbms_output.put_line ('---------------------------------');
            a := a + 1;
            x := 1;
        end if;
--    exit when a = 10;
    end loop;
end;
/

-- (2)
declare
    x number := 1;
    a number := 2;
    
begin
    for i in 1..100
    loop
        dbms_output.put_line (a || ' * ' || x || ' = ' || (x * a));
        x := x + 1;
        if  x = a + 1
            then 
        dbms_output.put_line ('---------------------------------');
            a := a + 1;
            x := 1;
        end if;
    exit when a = 10;
    end loop;
end;
/

-- (2)
begin
    for a in 2..9
        loop
        for x in 1..9
            loop
            dbms_output.put_line ( a || '*' || x || ' = ' || (a * x));
                if a = x
                then dbms_output.put_line ('---------------------------------');        
                end if;
                exit when x = a;
        end loop;
    end loop;    
end;
/


-- 3. �������� ���� �������� �ո�� �޸��� ���� Ȯ���� 1/2���� �����ϼ���.
-- (1) dbms_random.value(x, y) �Լ��� ����ؼ� 0 �Ǵ� 1�� �������� ����ϴ� PL/SQL�� �ۼ��ϼ���.
-- (2) (1)���� �ۼ��� �ڵ带 �����ؼ�, 
-- ������ 0�̸� '���� �ո�(head)', 1�̸� '���� �޸�(tail)'�̶�� ����ϴ� PL/SQL�� �ۼ��ϼ���.
-- (3) 0 �Ǵ� 1�� �����ϰ� ����� ����((1) �ڵ�)�� 1000�� �ݺ��ؼ�, 0�� 1�� �߻� Ƚ���� �����ϰ�,
-- 0�� ���� Ƚ�� / ��ü Ƚ��, 1�� ���� Ƚ�� / ��ü Ƚ�� �� ���
select dbms_random.value(0, 1) from dual;
/

declare
    n number := trunc(dbms_random.value(0, 2), 0);
    
begin
    if n = 0
    then 
    dbms_output.put_line ('���� �ո�(head)');
    else
    dbms_output.put_line ('���� �޸�(tail)');
    end if;
end;
/


declare
    x number;
    n number := 0;
    a number := 10000;
begin
    for i in 1..a
    loop 
    x := trunc(dbms_random.value(0, 2), 0);
--    dbms_output.put_line ( x );
        if x = 0
        then n := n + 1;
        end if;
    end loop;
--    dbms_output.put_line ('0 �� ���� Ƚ�� = ' || n/a );
--    dbms_output.put_line ('1 �� ���� Ƚ�� = ' || (a - n)/a );
--    dbms_output.put_line ('��ü Ƚ�� = ' || a );
--        dbms_output.put_line ('---------------------------------');    
    dbms_output.put_line ('0 �� ���� Ƚ�� = ' || n );
    dbms_output.put_line ('1 �� ���� Ƚ�� = ' || (a - n) );
    dbms_output.put_line ('��ü Ƚ�� = ' || a );
    dbms_output.put_line ('0 �� ���� % = ' || trunc(n/a, 2));
end;
/


-- 4. ����ī���� �˰����� �̿��� pi�� �ٻ簪(3.141592...) ���
-- (1) dbms_random.value() �Լ��� ����ؼ�, 2���� ��ǥ���(x-y) ���� ���� ��ǥ (x, y)�� �������� ����. ��, 0 <= x < 1, 0 <= y < 1
-- (2) x ** 2 + y ** 2 < 1�� �����ϸ� v_hit ������ ���� 1 ����
-- (3) (1), (2)�� ������ 1000�� �ݺ�
-- (3) (v_hit / 1000) * 4�� ����� ���� ���

declare
    x number;
    y number;
    v_hit number := 0;
    a number := 1000000;
begin
    for i in 1..a
    loop
    x := dbms_random.value(0, 1);
    y := dbms_random.value(0, 1);
        if sqrt(x ** 2 + y ** 2) < 1
        then v_hit := v_hit + 1;  
        end if;
    end loop;
    dbms_output.put_line ((v_hit/a) * 4);
    
end;
/






