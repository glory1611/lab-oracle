/*
Procedure(프로시저) vs Function(함수)

1. Procedure(프로시저)
    (1) 특정 로직을 수행하기만 하고, 명시적으로 반환(return)하지 않는 서브 프로그햄
    (2) 실행: 다른 PL/SQL (프로그램) 내부에서 실행됨. SQL 문서에서는 실행될 수 없음.
    (3) 파라미터 : in, out, in out 모드들을 사용할 수 있음.
    (4) 반환 : return 문을 사용한 반환을 할 수 없음.
        out, in out 파라미터를 통해서 1개 이상의 값을 반환할 수는 있음.
    
2. Function(함수)
    (1) 특정한 기능을 수행한 쥐 반드시 결과값을 반환(return)하는 서브 프로그햄
    (2) 실행: 다른 PL/SQL (프로그램) 내부 또는 SQL 문장 안에서 실행될 수 있음.
    (3) 파라미터: in 모드의 파라미터만 사용. in은 생략.
        문법적으로는 한수에서도 out, in out 파라미터를 사용할 수 있지만,
        out/ in out 파라미터를 갖는 함수는 SQL 문장에서 사용할 수 없음.
    (4) 반환: 반드시 return 문을 사용해서 1개의 값을 반환해야 함.
    
함수를 선언하는 방법

create [or replace] function 함수이름 [(
    파라미터1 타입 [:= 기본값1],
    파라미터2 타입 [:= 기본값2],
    ...
)]
return 리턴타입
is
begin
[exception]
end;
/

*/

create or replace function my_add(
    p_x number,
    p_y number
) 
return number
is
    v_result number;
begin
    v_result := p_x + p_y;
    return v_result;
end;
/


select my_add(1, 2) from dual;



-- 숫자 두개를 파라미터로 전달 받아서 뺄셈의 결과를 러턴하는 함수
create or replace function my_func(
    p_x number,
    p_y number
)
return number
is
--    v_result number;
begin
--    v_result := p_x - p_y;
--    return v_result;
    return p_x - p_y;
end;
/


select my_func(10, 20) from dual;

declare
    r number;
begin
    r := my_func(10, 20);
    dbms_output.put_line (r);
end;
/


-- 문자열 두개를 파라미터로 전달 받아서 두 문자열을 하나로 합친 문자열을 리턴하는 함수
create or replace function my_func2(
    str1 varchar2,
    str2 varchar2
)
return varchar2
is
--    v_text varchar2(100);
begin
--    v_text := str1 || str2;
--    return v_text;
    return str1 || str2;
end;
/

select my_func2('Hello', 'World') from dual;

declare
    text varchar2(100);
    str1 varchar2(20);
    str2 varchar2(20);
begin
    select my_func2(ename, job) into text from emp
    where empno = 7788;
    
    dbms_output.put_line (text);
end;
/

-- 사번과 세율을 파라미로 전달받아서
-- 해당 사원의 총 급여 (sal + comm) * (1 - tax) 를 계산해서 리턴하는 함수

create or replace function my_func3 (
    p_tax number := 0.05
    p_empno number,
)
return number
is 
    v_total number;
begin
    select (sal + nvl(comm, 0)) * (1 - p_tax) into v_total from emp
    where empno = p_empno;
    return v_total;
end;
/


select empno, ename, my_func3(p_empno => 7788) from emp where empno = 7788;

-- 팩토리얼 함수 만들기
create or replace function my_fact (
    n number
)
return number
is 
    v_fact number := 1;
begin
    for i in 1..n
    loop
        v_fact := v_fact * i;
    end loop;
    return v_fact;
end;
/

begin
    for i in 0..5
    loop
        dbms_output.put_line (my_fact(i));
    end loop;
end;
/

