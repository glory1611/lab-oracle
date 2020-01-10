set serveroutput on;

declare
    a number := 2;
    x number := 1;
    
begin
    loop
        x := 1; 
        loop
            dbms_output.put_line ( a || ' * ' || x || ' = ' || (a * x) );
            x := x + 1;
        exit when x = 10;
        end loop;

        a := a + 1;
        dbms_output.put_line ( '-----------------------------------' );
    exit when a = 10;
    end loop;
end;
/



declare
    a number ;
    n number ;
    
begin
    a := 2;
    while a < 10
    loop
        dbms_output.put_line ( a || '단' );
        n := 1;
        
        while n < 10
        loop
            dbms_output.put_line ( a || ' * ' || n || ' = ' || (a * n) );
            n := n + 1;
            exit when a < n;
        end loop;
        
        dbms_output.put_line ( '-----------------------------------' );
        a := a + 1;
    end loop;    

end;
/



begin
    for a in 2..9
    loop
        for x in 1..9
            loop
            dbms_output.put_line ( a || '*' || x || ' = ' || (a * x));
        exit when x = a;
        end loop;
        
            dbms_output.put_line ( '------------------------------' );       
    end loop;    
end;
/


begin
    for a in 2..9
    loop
        for x in 1..a
            loop
            dbms_output.put_line ( a || '*' || x || ' = ' || (a * x));

        end loop;
        
            dbms_output.put_line ( '------------------------------' );       
    end loop;    
end;
/




accept n prompt '실험 횟수 입력';

declare
    x number;
    a number := 0;
    b number := 0;
    n number := 1000000000;
begin
    for i in 1..n
    loop 
    x := trunc(dbms_random.value(0, 2), 0);
--    dbms_output.put_line ( x );
        if x = 0
        then a := a + 1;
        else b := b + 1;
        end if;
    end loop;
 
    dbms_output.put_line ('0 이 나온 횟수 = ' || a );
    dbms_output.put_line ('1 이 나온 횟수 = ' || b );
    dbms_output.put_line ('전체 횟수 = ' || n );
    dbms_output.put_line ( '-----------------------------' );   
    dbms_output.put_line ('0 이 나온 % = ' || round(a/n, 2));
    dbms_output.put_line ('1 이 나온 % = ' || round(b/n, 2));
    
--    dbms_output.put_line ('0 이 나온 횟수 = ' || a );
--    dbms_output.put_line ('1 이 나온 횟수 = ' || (n - a) );
--    dbms_output.put_line ('전체 횟수 = ' || n );
--    dbms_output.put_line ('0 이 나온 % = ' || trunc(a/n, 2));
end;
/


