/*
커서(cursor): PL/SQL 내부에서 SQL 문장을 처리하는 정보를 저장한 메모리 공간
(1) 명시적 커서(explicit cursor): 개발자가 직접 이름을 선언하고 사용하는 커서
(2) 묵시적 커서(implicit cursor): 별다른 선언 없이 사용한 커서

명시적 커서: 선어 -> open -> fetch -> close
*/

set serveroutput on;

select * from dept;



declare
    v_dept dept%rowtype;
    
begin
    select * into v_dept from dept where deptno = 10;
    -- 오라클 DB 내부에서 묵시적 커서가 자동으로 생성됨.
    dbms_output.put_line (v_dept.deptno);
end;
/

-- select into 구문은 1개 이상의 행(row)가 select 되는 경우는 사용할 수 없다.
-- 명시적 커서는 select의 결과 행의 갯수에 상관없이 사용할 수 있다.

declare
    -- 명시적 커서 선언:
    -- cursor 커서이름 is (SQL 문장);
    cursor my_cursor is (
        select * from dept where deptno = 10
    );
        
    v_row dept%rowtype; -- 커서의 데이터를 저장(fetch)할 때 사용할 변수
    
begin
    -- 커서 open(열기, 접근)
    open my_cursor;
    
    -- 커서 fetch(데이터 읽기)
    fetch my_cursor into v_row;
    dbms_output.put_line(v_row.deptno || ' , ' || v_row.dname || ' , ' || v_row.loc);
    
    -- 커서 close(닫기)
    close my_cursor;
    
end;
/



declare
    -- (1) 커서 선언
    cursor sel_emp is (
        select * from emp where empno = 7788
    );

    v_row emp%rowtype; -- 커서 결과를 저장(fetch)할 변수
    
begin
    -- (2) 커서 open
    open sel_emp;
    
    -- (3) 켜서 실행 결과 읽기(fetch)
    fetch sel_emp into v_row;
    dbms_output.put_line (v_row.empno || ' , ' || v_row.ename);
    
    
    -- (4) 커서 close
    close sel_emp;

end;
/


-- 결과 행이 여러개가 됭 수 있는 명시적 커서

declare
    -- 명시적 커서 선언
    cursor sel_dept is (
        select * from dept
    );

    -- 커서 실행 결과를 fetch할 때 사용할 변수
    v_row dept%rowtype;
begin
    open sel_dept;
    
    -- fetch -- 결과 행이 여러개일 경우 반복문 안에서 fetch
    loop
        fetch sel_dept into v_row;
        
    exit when sel_dept%notfound;
    
    dbms_output.put_line(v_row.deptno || ' , ' || v_row.dname || ' , ' || v_row.loc);
    end loop;
    
    close sel_dept;

end;
/




-- emp 테이블에서 부서번호가 30번인 직원들의 사번, 이름, 급여를 출력

declare
    cursor sel_emp is (
        select * from emp where deptno = 30
    );

    v_row emp%rowtype;
    
begin
    open sel_emp;
    
    loop
        fetch sel_emp into v_row;
    exit when sel_emp%notfound;
    
    dbms_output.put_line(v_row.empno || ' , ' || v_row.ename || ' , ' || v_row.sal);      
    
    end loop;
    
    close sel_emp;
    
end;
/




-- 명시적 커서를 for loop에서 사용
-- open, fetch, close가 자동으로 수행됨
-- for 변수 in 커서 loop ... end loop;

declare
    cursor my_cursor is (
    select * from dept
    );

begin
    for row in my_cursor
    loop
        dbms_output.put_line(row.deptno || ' , ' || row.dname || ' , ' || row.loc);
        
    end loop;

end;
/


-- 20번 부서에 직원들의 사번, 이름, 급여를 출력


declare
    cursor sel_emp is (
        select * from emp where deptno = 20
    );

begin
    for i in sel_emp
    loop
        dbms_output.put_line (i.empno || ' , ' || i.ename || ' , ' || i.sal);
    
    end loop;

end;
/

select * from emp where sal < 
(select avg(sal) from emp);

-- 파라미터(parameter, 매개변수)를 갖는 커서 선언
-- cursor 커서임름(변수 타입, 변수 타입, ... ) is SQL문장;

declare
    v_avg number;
    
    cursor my_cursor(p_avg number) is
        select ename from emp where sal < p_avg;
begin
    select avg(sal) into v_avg from emp;
    dbms_output.put_line (v_avg);
    
    for row in my_cursor(v_avg)
    loop
        dbms_output.put_line (row.ename);
    end loop;
    
end;
/



-- 전체 직원의 급여 평균보다 적은 급여를 받는 직원들의 이름을 출력하는 PL/SQL

-- 10번 부서에서, 10번 부서 직원들의 급여 평균보다 적은 급여를 받는 직원들의 이름을 출력하는 PL/SQL

-- 각부서에서, 그 부서 직원들의 급여 평균보다 적은 급여를 받는 직원들의 부서번호와 직원이름을 출력하는 PL/SQL

declare
    cursor my_cursor is (
        select * from emp 
        where 
            sal < (select avg(sal) from emp)
    );

begin
    for i in my_cursor
    loop
        dbms_output.put_line (i.ename);
    end loop;

end;
/

-- 10번 부서에서, 10번 부서 직원들의 급여 평균보다 적은 급여를 받는 직원들의 이름을 출력하는 PL/SQL
declare
    cursor my_cursor is (
        select * from emp 
        where 
            deptno = 10 
            and
            sal < (select avg(sal) from emp where deptno = 10)
    );

begin
    for i in my_cursor
    loop
        dbms_output.put_line (i.ename);
    end loop;

end;
/


-- 각부서에서, 그 부서 직원들의 급여 평균보다 적은 급여를 받는 직원들의 부서번호와 직원이름을 출력하는 PL/SQL
-------------
-- (1)
declare
    cursor get_deptno is
        select deptno from dept;
    
    cursor my_cursor(p_deptno emp.deptno%type) is 
        select * from emp 
        where 
            deptno = p_deptno 
            and
            sal < (select avg(sal) from emp where deptno = p_deptno)
    ;

begin
    for rslt in get_deptno
    loop
--        dbms_output.put_line (rslt.deptno);
        
        for i in my_cursor(rslt.deptno)
        loop
            dbms_output.put_line (i.deptno || ' , ' || i.ename || ' , ' || i.sal);
        
        end loop;
    end loop;
end;
/

---------
---------

select deptno from dept;
select deptno, avg(sal) from emp group by deptno;

-------------
--(2)
-------------
declare
    cursor cur1 is 
        select deptno, avg(sal) average from emp group by deptno
        order by deptno
    ;
    cursor cur2(p_deptno emp.deptno%type, p_avg number) is
        select * from emp 
        where 
            deptno = p_deptno
            and
            sal < p_avg
    ; 

begin
    for r1 in cur1
    loop
--        dbms_output.put_line (r1.deptno || ' , ' || r1.average);
        
        for r2 in cur2(r1.deptno, r1.average)
        loop
            dbms_output.put_line (r2.deptno || ' , ' || r2.ename || ' , ' || r2.sal);
            
        end loop;    
    end loop;

end;
/


-------------
--(3)
-------------
select deptno, avg(sal) average from emp 
    group by deptno
order by deptno
;

select a.deptno
    from (select deptno, avg(sal) average from emp 
    group by deptno
order by deptno) a
;
    
select * from emp e
    join (select deptno, avg(sal) average from emp group by deptno) a
    on e.deptno = a.deptno
    where e.sal < a.average
order by e.deptno
;

--
declare
    cursor my_cursor is 
        select * from emp e
            join (select deptno d, avg(sal) average from emp group by deptno) a
            on e.deptno = a.d
            where e.sal < a.average
        order by e.deptno
        ;

begin
    for i in my_cursor
    loop
        dbms_output.put_line (i.deptno || ' , ' || i.ename || ' , ' || i.sal);
    end loop;

end;
/

