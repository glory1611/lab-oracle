set serveroutput on;

-- 1. ������(2�� ~ 9��)�� ���
-- 2. ������(2�� ~ 9��)�� ���
--  2���� 2*2����, 3���� 3*3����, ...

declare

begin
    for x in 2..9
        loop
        for a in 1..9
        loop
        dbms_output.put_line ( x || '*' || a || ' = ' || (x * a));
        if a = 9
            then dbms_output.put_line ('---------------------------------');        
        end if;
        end loop;
    end loop;    
end;
/








declare
    x number := 1;
    a number := 2;
    
begin
--    while x < 10
    loop
        dbms_output.put_line (a || ' * ' || x || ' = ' || (x * a));
        x := x + 1;
        if  x = 10
            then 
        dbms_output.put_line ('---------------------------------');
            a := a + 1;
            x := 1;
        end if;
    exit when a = 10;
    end loop;
end;
/

--------------
-- 2. ������(2�� ~ 9��)�� ���
--  2���� 2*2����, 3���� 3*3����, ...
--------------

declare
    x number := 1;
    a number := 2;
    
begin
--    while x < 10
    loop
        dbms_output.put_line (a || ' * ' || x || ' = ' || (a * x));
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


declare

begin
    for x in 2..9
        loop
        for a in 1..9
            loop
            dbms_output.put_line ( x || '*' || a || ' = ' || (x * a));
                if a = x
                then dbms_output.put_line ('---------------------------------');        
                end if;
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


-- 4. ����ī���� �˰����� �̿��� pi�� �ٻ簪(3.141592...) ���
-- (1) dbms_random.value() �Լ��� ����ؼ�, 2���� ��ǥ���(x-y) ���� ���� ��ǥ (x, y)�� �������� ����. ��, 0 <= x < 1, 0 <= y < 1
-- (2) x ** 2 + y ** 2 < 1�� �����ϸ� v_hit ������ ���� 1 ����
-- (3) (1), (2)�� ������ 1000�� �ݺ�
-- (3) (v_hit / 1000) * 4�� ����� ���� ���
