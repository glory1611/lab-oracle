/*
1. 익명(무명) 불록(anonymous block):
        이름을 지정하지 않은 PL/SQL 블록
            - 오라클 서버에 저장되지 못함.
            - 스크립트 파일(*.sql)에는 저장 가능.
            - 실행될 때마다 새로 컴파일됨.

2. 저장 서브 프로그램(stored sub program):
        이름이 있는 PL/SQL 블록
            - 프로시저(procedure), 함수(function), 패키지(package, 트리거(trigger)
            - 오라클 서버에 저장된는 객체 -> 재사용(re-use)이 가능
            - 오라클 서버에 저장될 때 컴파일 됨 -> 실행 속도가 빠름.
            
3. 프로시저(procedure)
create [or repace] procedure 프로시저이름[(
    파라미터1 [mode] 타입,
    파라미터2 [mode] 타입,
    ...
)]      
is
    -- 선언부: 변수, 커서 선언
    
begin
    -- 실행부: 절차적으로 처리할 코드들;
    
[exception 예외 처리부]

end;
/

*/

set serveroutput on;


-- 프로시저 생성
create or replace procedure my_proc1

is
    v_empno emp.empno%type := 7788;
    v_ename emp.ename%type;
    
begin
    select ename into v_ename from emp where empno = v_empno;
    dbms_output.put_line ('이름: ' || v_ename);

end;
/

-- 프로시저 실행
begin
    my_proc1(); -- 파라미터를 갖지 않는 프로시저를 호출할 때는 () 생략 가능
    
end;
/

-- 프로시져 확인
select * from user_source where name = upper('my_proc1');

-- 프로시져 삭제
drop procedure my_proc1;


-- 파라미터를 갖는 프로시저 생성
create or replace procedure my_proc2(
    p_empno emp.empno%type
)
is
    v_ename emp.ename%type;
begin
    select ename into v_ename from emp where empno = p_empno;
    dbms_output.put_line ('name: ' || v_ename);
end;
/

-- 프로시저 실행
declare
    cursor my_cursor is
        select empno from emp;    
begin
    for r in my_cursor
    loop
        my_proc2(r.empno);
    end loop;
end;
/


-- 프로시저 파라미터의 모드(mode)
-- in: 프로시저를 호출할 때 전달한 값을 저장하는 매개변수(parameter)
-- out: 프로시저를 호출한 곳으로 반환할 때 사용하는 매개변수
-- in out: 값을 전달받기도 하고, 값을 반환하기도 하는 매개변수
-- 프로시저 파라미터의 기본 모드는 in 이기 때문에, 보통 in은 생략


create or replace procedure my_proc3(
    in_empno emp.empno%type,        -- in 모드 파라미터
    out_ename out emp.ename%type,   -- out 모드 파라미터
    out_deptno out emp.deptno%type    
)
is
begin
    select ename, deptno into out_ename, out_deptno from emp
        where empno = in_empno;
end;
/

declare
    v_ename emp.ename%type;
    v_deptno emp.deptno%type;
begin
    my_proc3(7788, v_ename, v_deptno);
    dbms_output.put_line (v_ename || ' , ' || v_deptno);
end;
/



create or replace procedure my_proc4(
    v_num in out number
)
is
begin
    v_num := 2 * v_num;
end;
/


declare
    v_test number := 10;

begin
    dbms_output.put_line ('프로시저 호출 전 v_test :' || v_test);
    my_proc4(v_test); -- 프로시저 호출
    dbms_output.put_line ('프로시저 호출 후 v_test :' || v_test);

end;
/


-- 기본값을 갖는 프로시저의 파라미터
create or replace procedure my_proc5(
    par1 number,        -- 기본 값이 지정되지 않은 파라미터
    par2 number := 123  -- 기본 값이 지정된 파라미터
)
is
begin
    dbms_output.put_line (par1 || ' , ' || par2);
end;
/


begin
    my_proc5(1, 2);
    my_proc5(100);
end;
/



/* 프로시저: get_total_sal
    파라미터:
    p_empno - in 모드, emp 테이블의 empno 타입
    p_total - out 모드, 숫자 타입
    p_tax - in 모드, 숫자 타입, 기본값 = 0.05
    기능 : 전달받은 사번으로 sal, comm을 검색
        -> total = (sal + comm) * (1 - tax)
*/
create or replace procedure get_total_sal(
    p_empno     emp.empno%type,
    p_total out number,
    p_tax       number := 0.05
)
is
begin
    select (sal + nvl(comm, 0)) * (1 - p_tax) into p_total from emp
    where empno = p_empno;
--    dbms_output.put_line ('사번 : ' || p_empno || ' , ' || 'Total Sal : ' || p_total);
    
end;
/


declare
    cursor c_emp is
        select empno from emp;
    
    v_total number;
    
begin
    for i in c_emp
    loop
        get_total_sal(i.empno, v_total);
        dbms_output.put_line ('사번 : ' || i.empno || ' , ' || 'Total Sal : ' || v_total);
    end loop;
end;
/