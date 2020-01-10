set serveroutput on;
--

begin
    dbms_output.put_line ('hello');
    dbms_output.put_line ('world');    
    dbms_output.put ('hello');
    dbms_output.put ('world');    
    dbms_output.new_line;
    
end;
/


-- 화면에 ***** 출력

begin
    for i in 1..5
        loop
        dbms_output.put ('*');
        end loop;
    dbms_output.new_line;
end;
/

--

end;
/

--

begin
     for i in 1..5
     loop
        for j in 1..5
        loop
        dbms_output.put ('*');
        exit when i = j;
        end loop;
        dbms_output.new_line;
    end loop;    
end;
/



begin
     for i in 1..5
     loop
        for j in i..5
        loop
        dbms_output.put ('*');
        end loop;
        dbms_output.new_line;
    end loop;    
end;
/


/*
1 2 3 4 5 6 7 8 9 10
11 12 13 14 ...   20
21 22 23 24 ...   30
...
91 92 93 94 ...   100

*/


declare
    x number := 1;
    n number := 1;
begin
    for i in 1..100
    loop
        dbms_output.put ( x || ' ' );
        x := x + 1;
        n := n + 1;
            if n > 10
            then dbms_output.new_line;
            n := 1;
            end if;
    end loop;
end;
/



begin
        dbms_output.new_line;
    for i in 1..100
    loop
--        dbms_output.put ( i || ' ' );

        dbms_output.put (lpad(i, 4, ' ' )); -- 화면에 출력할 인수, 자릿수, 채울내용
            if mod(i, 10) = 0
            then dbms_output.new_line;
            end if;
    end loop;
end;
/


begin
    for j in 0..9
    loop
        for i in 1..10
        loop
        dbms_output.put ( 10 * j + i || ' ');

        end loop;
    dbms_output.new_line;
    end loop;
--    dbms_output.new_line;
end;
/

begin
        dbms_output.new_line;
    for i in 1..100
    loop
--        dbms_output.put ( i || ' ' );

        dbms_output.put (lpad(i, 4, ' ' )); -- 화면에 출력할 인수, 자릿수, 채울내용
            if mod(i, 10) = 0
            then dbms_output.new_line;
            end if;
    end loop;
end;
/


declare
    n number := 1;
    x varchar2(100) := '1';
begin
    for i in 1..100
    loop
        if x = '%3%'
        then x := '*';
        else x := n;
        end if;
            
            dbms_output.put ( x || ' ' );
            
        if mod(x, 10) = 0
        then dbms_output.new_line;
        end if;
    n := n + 1;
    x := n;
    end loop;
end;
/

--===========================================================--
/*
    1    2    *    4    5    *    7    8    *   10
   11   12    *   14   15    *   17   18    *   20
   21   22    *   24   25    *   27   28    *    *
    *    *    #    *    *    #    *    *    #   40
   41   42    *   44   45    *   47   48    *   50
   51   52    *   54   55    *   57   58    *    *
    *    *    #    *    *    #    *    *    #   70
   71   72    *   74   75    *   77   78    *   80
   81   82    *   84   85    *   87   88    *    *
    *    *    #    *    *    #    *    *    #  100
*/
--===========================================================--

declare
    n1  number; --  1의 자리 숫자를 저장할 변수
    n10 number; -- 10의 자리 숫자를 저장할 변수
    
begin
    dbms_output.new_line;
    
    for i in 1..100
    loop
        n1  := mod(i, 10); -- 나머지
        n10 := trunc(i/10, 0); -- 몫
        
        if n1 in (3, 6, 9) and n10 in (3, 6, 9)
        then dbms_output.put (lpad('#', 5, ' '));
        elsif n1 in (3, 6, 9) or n10 in (3, 6, 9)
            then dbms_output.put (lpad('*', 5, ' '));
            else
            dbms_output.put (lpad(i, 5, ' '));
        end if;
        
        if mod(i, 10) = 0
        then dbms_output.new_line;
        end if;

    end loop;
end;
/

declare
    n number;
begin
    for x in 0..9
    loop
        for y in 1..10
        loop
        n := x * 10 + y;
        
            if n in (30, 60, 90)
            then dbms_output.put ('* ');
            elsif x in (3, 6, 9) and y in (3, 6, 9)
            then dbms_output.put ('# ');
            elsif x in (3, 6, 9) and y != 10 or y in (3, 6, 9)
            then dbms_output.put ('* ');
            else dbms_output.put ( n || ' ' );
            end if;
         
        end loop;  
        dbms_output.new_line ();
    end loop;
end;
/

-- factorial

-- 5! = 1 * 2 * 3 * 4 * 5
-- n! = 1 * 2 * 3 * 4 * 5 ...


declare
    n number := 5;
    f number := 1;
begin
    for i in 1..n
    loop
        f := f * i;
    
    end loop;
    dbms_output.put_line ( f );
end;
/



