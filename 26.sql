/*  case ~ when 구문

(1)
    case    비교대상
        when    값1
            then    비교대상 = 값1 만족할 때 실행할 문장;
        when    값2
            then    비교대상 = 값2 만족할 때 실행할 문장;
        ...
        else 비교대상이 위의 모든 값과 일치하지 않을때 실행할 문장;
    end case;

(2)
    case    
        when    조건식1
            then    조건식1 만족할 때 실행할 문장;
        when    조건식2
            then    조건식2 만족할 때 실행할 문장;
        ...
        else 위의 모든 조건이 거짓일때 실행할 문장;
    end case;
    
    
*/
set serveroutput on;

-- (1)
declare
    v_s     number := 88;

begin
    case    trunc(v_s, -1)
        when   100    then    dbms_output.put_line ('A');
        when    90    then    dbms_output.put_line ('A');
        when    80    then    dbms_output.put_line ('B');    
        when    70    then    dbms_output.put_line ('C');    
        else    dbms_output.put_line ('D');    
    end case;

end;
/

-- (2)
declare
    v_s     number := 88;
    
begin
    case
        when    v_s >= 90   then    dbms_output.put_line ('A');
        when    v_s >= 80   then    dbms_output.put_line ('B');
        when    v_s >= 70   then    dbms_output.put_line ('C');
        when    v_s >= 60   then    dbms_output.put_line ('D');
    else    dbms_output.put_line ('F');
    end case;
end;
/



    