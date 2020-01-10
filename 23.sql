set serveroutput on;

-- 이름을 입력 받아서 
-- 사번, 부서번호 검색해서
-- 사번, 이름, 부서번호 출력

accept p_ename prompt '이름 입력';

declare
    v_ename     varchar2(100) := trim(upper('&p_ename'));
    v_empno     number;
    v_deptno    number;
begin
    select  empno, deptno
    into    v_empno, v_deptno
    from    emp
    where   upper(ename) = v_ename;
    
    dbms_output.put_line ('사번 : ' || v_empno);
    dbms_output.put_line ('이름 : ' || v_ename);
    dbms_output.put_line ('부서번호 : ' || v_deptno);
end;
/


-- 이름을 입력 받아서 
-- emp, dept 테이블을 사용해서(JOIN)
-- 'SCOTT은 DALLAS의 RESEARCH 부서에서 근무합니다.' 와 같은 형식으로 출력


accept p_ename prompt '이름 입력';

declare
    v_ename     varchar2(100):= trim(upper('&p_ename'));
    v_loc       varchar2(100);
    v_dname     varchar2(100);
begin
    select  d.loc, d.dname
    into    v_loc, v_dname
    from    emp e join dept d
                  on e.deptno = d.deptno
    where   upper(e.ename) = v_ename;
    dbms_output.put_line (v_ename || '은(는) ' || 
                          v_loc || '의 '  || 
                          v_dname || '부서에서 근무합니다.' );
end;
/

-------------------------------------------
accept p_ename prompt '이름 입력';

declare
    v_ename     varchar2(100):= trim(upper('&p_ename'));
    v_loc       varchar2(13);
    v_dname     varchar2(14);
    v_deptno    number(2);
begin
    -- 사원 이름으로 그 사원이 근무하는 부서 번호를 검색
    select  deptno
    into    v_deptno
    from    emp
    where   upper(ename) = v_ename;
    -- 부서 번호를 사용해서 부서의 이름, 위치를 검색
    select  dname, loc
    into    v_dname, v_loc
    from    dept
    where   deptno = v_deptno;
    -- 검색한 정보를 화면에 출력
    dbms_output.put_line (v_ename || '은(는) ' || 
                          v_loc || '의 '  || 
                          v_dname || '부서에서 근무합니다.' );
end;
/







