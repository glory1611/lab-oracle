/*  조건문(Conditional Statement)

(1)
    if  조건식 
        then 조건식이 참일 때 실행할 문장;
    end if;


(2)
    if  조건식
        then 조건식이 참일 때 실행할 문장;
        else 조건식이 거짓일 때 실행할 문장;
    end if;
    

(3)
    if  조건식1
        then 조건식1이 참일 때 실행할 문장;
        elsif 조건식2
            then 조건식2이 참일 때 실행할 문장;
            elsif ...
                ...
        else 위의 모든 조건이 거짓일 때 실행할 문장;
    end if;
    
    
*/
-- 1)

set serveroutput on;

declare
    v_num   number := 12;
begin
    if mod(v_num, 2) = 1 then
        dbms_output.put_line ('홀수');
    end if;
    
    dbms_output.put_line('End PL/SQL');
end;
/

-- 2)
accept p_num prompt '숫자를 입력하세요';

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
                    then    dbms_output.put_line ('4의 배수');
                    else    dbms_output.put_line ('4의 배수가 아닙니다.');
                end if;
        else    dbms_output.put_line ('odd number');
                if  mod(v_n, 4) = 0
                    then    dbms_output.put_line ('4의 배수');
                    else    dbms_output.put_line ('4의 배수가 아닙니다.');
                end if;
    end if;
    
end;
/

-------------------------------------
-------------------------------------

select power(5, 2) from dual;

-- 삼격형의 세 변의 길이를 입력
-- 피타고라스 정의를 이용해서, 직각삼격령인지 아닌지를 출력

accept p_a prompt 'a 변 입력';
accept p_b prompt 'b 변 입력';
accept p_c prompt 'c 변 입력';

declare
    a number := &p_a;
    b number := &p_b;
    c number := &p_c;

begin
    if  power(a, 2) + power(b, 2) = power(c, 2)
        then    dbms_output.put_line ('직삼각형입니다.');
        else    dbms_output.put_line ('직삼각형 아닙니다.');
    end if;
    
end;
/





