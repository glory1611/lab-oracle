/*  반복문

(1) LOOP

loop
    반복할 문장;
    exit when 조건식;
end loop;


(2) WHILE LOOP

while 조건식 
    loop
    조건식이 참일 때 반복한 문장;
end loop;


(3) FOR LOOP

for 변수 
    in 시작값..마지막값 
    loop    
    반복할 문장;
end;
-- for loop에서 사용한 변수는 declare 구문에서 선언하지 않음(!)
-- for loop에서 사용하는 변수는 자동으로 1씩 증가됨(!)

*/

set serveroutput on;

-- 1)
declare
    v_num number := 1;
begin
    loop
        -- v_num의 값을 출력
        dbms_output.put_line ('v_num = ' || v_num); 
        -- v_num의 값을 1증가
        v_num := v_num + 1;
        -- loop 종료 조건
        exit when v_num > 9999; -- v_num = 6
        
    end loop;
end;
/

-----------------------
-- loop을 이용해서 구구단 2단을 출력
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
-- while loop을 이용해서 구구단 3단을 출력
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

-- while loop에서 exit 사용 5까지 출력
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
-- for loop을 이용해서 구구단 3단을 출력

begin
    for n in 1..9 
    loop
    dbms_output.put_line ('4 x ' || n || ' = ' || (n * 4));
    end loop;
end;
/

-- for loop에서 exit 사용 5까지 출력

begin
    for i in 1..10
    loop
    dbms_output.put_line ('i = ' || i);
    exit when i = 5;
    end loop;
end;
/

-- for loop에서 범위의 역순으로 감소시키면서 반복
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
    continue when mod(i, 2) = 0; -- continue 조건을 만족하면 loop로 다시 올라가라
    dbms_output.put_line (i);
    end loop;

end;
/

