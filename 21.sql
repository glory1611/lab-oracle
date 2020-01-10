-- PL/SQL(Procudural Language extension to SQL)
-- SQL에 대한 절차적 언어 확장 기능


-- PL/SQL의 필요성
-- 직원emp) 테이블에서 부서별 직원들의 정보를 출력
select * from emp where deptno = ?;
-- 어떤 부서 번호들이 있는 지를 확인하기 위해서 부서(dept) 테이블 확인
select deptno from dept;
-- 알아낸 버서 번호를 가지고 select문을 부서 갯수만큼 실행
select * from emp where deptno = 10;
select * from emp where deptno = 20;
select * from emp where deptno = 30;
select * from emp where deptno = 40;

-- 하나의 업무를 완수하기 위해서 작업을 절차적으로 진행해야 할 필요가 있다.

/*
PL/SQL 블록의 기복 구조

declare     -- 선언부. 선택사항
    변수 선언;
begin       -- 실행부. 필수사항
    실행문;
exception   -- 예외처리부. 선택사항
    예외처리문;
end;

declare, begin, exception네는 세미콜론(;)을 사용하지 않음
end


*/

set serveroutput on;

declare
    v_num number := 1000; -- 변수 선언
begin
    dbms_output.put_line('v_num 값 = '|| v_num);
end;
/

/* PL/SQL 변수
    1) 변수를 선언하면서 동시에 값을 할당(초기화)하는 경우
       변수이름 데이터타입 := 값; 
    2) 변수를 선언만 하고, 값을 할당(초기화)하지 않는 경우
       변수이름 데이터타입;
       초기화 되지 않은 변수는 begin 블록 안에서 반드시 초기화를 해야 함.
PL/SQL의 변수 이름은 대/소문자를 구분하지 않음 
변수에 저장된 값은 대/소문자를 구분함
*/
       

declare  -- 변수 선언부
    -- 변수 선언과 동시에 초기화
    v_age number(3) := 16;
    
    -- 변수 선언
    v_name varchar2(20);
    
begin -- 실행부
    -- 화면(콘솔) 출력
    dbms_output.put_line('나이: ' || v_age);
    -- v_name은 초기화 되지 않은 변수. v_name은 null.
    -- 선언부에서 초기화되지 않은 변수는 실행부에서 초기화를 함
    v_name := '오쌤';
    dbms_output.put_line('이름: ' || v_name);
end; 
/



-- declare, declaration(선언): 변수의 이름과 변수의 데이터 타입을 말하는 것
-- assign, assignment(할당): 선언된 변수에 값ㅇ을 저장/변경하는 것
-- initialize, initialization(초기화): 변수에 최초로 갑을 저장(할당)하는 것


accept p_age prompt '아니가 어떻게 되세요?';

declare
     v_age number := &p_age;
     -- & 연산자는 프롬프트 창에서 입력 받은 값을 저장하는 변수를 참조(reference)
begin
    dbms_output.put_line('당신의 나이는 ' || v_age);
end;
/
       
------------------------------------------------------------------------       
------------------------------------------------------------------------

-- 프롬프트 창에서 직사각형의 가로와 세로 길이를 입력받아서
-- 직사각형의 넓이를 계산하고, 그 결과를 화면(콘솔)에 출력


accept p_width prompt '가로 길이 입력';
accept p_height prompt '세로 길이 입력';

declare
     v_area number := &p_width * &p_height;
begin
    dbms_output.put_line('직사각형 넓이는 ' || v_area);
end;
/

------------------------------------------------------------------------

accept p_width prompt '가로 길이 입력';
accept p_height prompt '세로 길이 입력';

--declare
begin
    dbms_output.put_line('직사각형 넓이는 ' || (&p_width * &p_height));
end;
/

------------------------------------------------------------------------

accept p_width prompt '가로 길이 입력';
accept p_height prompt '세로 길이 입력';

declare
     v_width number := &p_width;
     v_height number := &p_height;
     v_area number;
begin
    v_area := v_width * v_height;
    dbms_output.put_line ('직사각형 넓이는 ' || v_width);
    dbms_output.put_line ('직사각형 넓이는 ' || v_height);
    dbms_output.put_line ('직사각형 넓이는 ' || v_area);
end;
/

------------------------------------------------------------------------

