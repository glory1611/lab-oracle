-- 레코드 & 컬렉션

-- 레코드(record): 데어터 타입이 서로 다른 여러개의 값(데이터)들을 저장할 때 사용
/*
레코드 저의 방법:
type 레코드이름 is record (
     변수이름 변수타입,
     ...
     );
     
-- 레커드 값을 저장:
레코드.필드 := 값;

*/

set serveroutput on;

declare
    -- 레코드 정의
    type rec_dept is record (
        deptno number,
        dname varchar2(20),
        loc varchar2(20)
    );

    -- 레코드의 이름은 변수를 선언할 때 사용
    v_dept_row rec_dept; -- 변수 이름 타입;
    
begin
    -- 레코드 변수에 값을 저장
    v_dept_row.deptno := 99;
    v_dept_row.dname := 'ITWILL';
    v_dept_row.loc := '서울 강남';
    
    -- 레코드 변수의 값을 읽어올 때: 레코드변수.필드
    dbms_output.put_line ('번호: ' || v_dept_row.deptno);
    dbms_output.put_line ('이름: ' || v_dept_row.dname);
    dbms_output.put_line ('위치: ' || v_dept_row.loc);
end;
/

select * from dept2
order by deptno;

-- dept2 테이블에 레코드를 insert

declare
    type rec_dept is record (
    deptno  dept2.deptno%type,
    dname   dept2.dname%type,
    loc    dept2.loc%type
    );
    
    v_row rec_dept;
begin
    v_row.deptno    := 11;
    v_row.dname     := '데이터베이스';
    v_row.loc       := 'Seoul';
    
    -- dept2 테이블에 v_row 레코드를 저장(insert)
--    insert into dept2
--    values (v_row.deptno, v_row.dname, v_row.loc);
    insert into dept2 values v_row;


    -- 레코드 타입의 변수를 사용한 dept2 테이블 update
    -- update dept2 set deptno = ?, dname = ' ', loc = ' ' whete deptno = 11;
    v_row.deptno := 99;
    v_row.dname := 'PL/SQL';
    v_row.loc := '강남';
    update dept2 set row = v_row where deptno = 11;
    
    
end;
/

select * from dept2
order by deptno;


declare
    -- row 타입 참조 변수 선언
    v_row1 dept%rowtype;
    
begin
    v_row1.deptno  := 22;
    v_row1.dname   := 'abc';
    v_row1.loc     := 'korea';
    
    insert into dept2 values v_row1;
    
end;
/



-- 레코드를 사용한 select

declare
    -- 테이블의 모든 컬럼을 검색하는 경우에는
    -- 레코드를 직접 정의하는 것보다 %rowtype 참조를 사용하는 것이 편리함.
    v_emp_row1 emp%rowtype;
    
    -- 테이블의 일부 컬럼만 검색하거나, 두개 이상의 테이블에서 조인하는 경우
    -- 사용자 정의 레크드를 선언하는 것이 편리함.
    type rec_emp is record (
        empno   emp.empno%type,
        ename   emp.ename%type,
        job     emp.job%type
    );
    
    v_emp_row2 rec_emp;

begin
    -- 테이블에서 전체 컬럼 검색
    select *  
        into    v_emp_row1 
        from    emp 
        where   empno = 7788;
    dbms_output.put_line (v_emp_row1.empno || ', ' || v_emp_row1.ename);

    -- 테이블에서 일부 컬럼만 검색
    select empno, ename, job 
        into    v_emp_row2
        from    emp 
        where   empno = 7839;
    dbms_output.put_line (v_emp_row2.empno || ', ' || v_emp_row2.ename || ', ' || v_emp_row2.job );
        
end;
/

-- emp 테이블과 dept 테이블에서
-- 사번, 이름, 급여, 부서이름, 부서위치
-- 변수들을 저장할 수 있는 레코드(emp_dept)를 정의
-- join 문장을 작성해서 SCOTT의 정보를 출력하는 PL/SQL

declare
    type rec1 is record (
    empno   emp.empno%type,
    ename   emp.ename%type,
    sal     emp.sal%type,
    dname   dept.dname%type,
    loc     dept.loc%type
    );
    

    emp_dept rec1;

begin
    select e.empno, e.ename, e.sal, d.dname, d.loc
        into emp_dept
        from emp e join dept d
            on e.deptno = d.deptno
        where ename = 'SCOTT';
        
        dbms_output.put_line (emp_dept.empno || ', ' || emp_dept.ename || ', ' || emp_dept.sal || ', ' || emp_dept.dname || ', ' || emp_dept.loc );

end;
/






