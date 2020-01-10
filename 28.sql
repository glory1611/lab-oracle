set serveroutput on;

-- 1. 구구단(2단 ~ 9단)을 출력
-- 2. 구구단(2단 ~ 9단)을 출력
--  2단은 2*2까지, 3단은 3*3까지, ...

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
-- 2. 구구단(2단 ~ 9단)을 출력
--  2단은 2*2까지, 3단은 3*3까지, ...
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

-- 3. 무작위로 던진 동전에서 앞면과 뒷면이 나올 확률이 1/2임을 증명하세요.
-- (1) dbms_random.value(x, y) 함수를 사용해서 0 또는 1을 무작위로 출력하는 PL/SQL을 작성하세요.
-- (2) (1)에서 작성한 코드를 수정해서, 
-- 난수가 0이면 '동전 앞면(head)', 1이면 '동전 뒷면(tail)'이라고 출력하는 PL/SQL을 작성하세요.
-- (3) 0 또는 1을 랜덤하게 만드는 과정((1) 코드)을 1000번 반복해서, 0과 1의 발생 횟수를 저장하고,
-- 0이 나온 횟수 / 전체 횟수, 1이 나온 횟수 / 전체 횟수 를 계산


-- 4. 몬테카를로 알고리즘을 이용한 pi의 근사값(3.141592...) 계산
-- (1) dbms_random.value() 함수를 사용해서, 2차원 좌표평면(x-y) 위의 점의 좌표 (x, y)를 무작위로 만듦. 단, 0 <= x < 1, 0 <= y < 1
-- (2) x ** 2 + y ** 2 < 1을 만족하면 v_hit 변수의 값을 1 증가
-- (3) (1), (2)의 과정을 1000번 반복
-- (3) (v_hit / 1000) * 4를 계산한 값을 출력
