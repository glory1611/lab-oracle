-- 조건을 만족한 레코드 검색
-- select 컬럼, ... from where 조건;

-- 사원 테이블에서 부서 번호가 10인 사원들의 모든 컬럼 검색

select * from emp where deptno = 10;

select ename from emp where deptno = 10;

-- 사원 테이블에서 급여가 2500 이상 (>=) 인 직원들을 검색
select * from emp where sal >= 2500;

select * from emp where sal >= 2500 and deptno = 10;


-- 사원 테이블에서 급여가 1000 이상, 2000미만인 직원들의 모든 컬럼을 검색
select * from emp where sal >= 1000 and sal < 2000;

select * from emp 
    where sal >= 1000 and sal < 2000;



select * from emp 
    where sal >= 3000 and sal <= 5000;
    
select * from emp
    where sal between 3000 and 5000;
    
    
-- 사원 테이블에서 급여가 1000 이하이거나 또는 5000 이상인 직원들의 모든 컬럼 검색
select * from emp 
    where sal <=1000 or sal >= 5000;

-- 사원 테이블에서 10번 또는 20번 부서에서 일하는 직원들의 모든 걸럼 검사
select * from emp
    where deptno = 10 or deptno = 20;
    
select * from emp
    where deptno in (10, 20);
    


-- 사원 테이블에서 부서 번호가 10번이 아닌 직원들의 모든 컬럼 검색
-- 다름 : != , <>, ^=
select * from emp
    where deptno != 10;

select * from emp
    where deptno <> 10;
    
select * from emp
    where not deptno = 10;
    

-- 직원 테이블에서 직책이 'CLERK' 인 직원들의 모든 정보를 검색

select * from emp
    where job = 'CLERK';
-- Oracle 에서 예약어(select, from, whre, ...), 테이블 이름, 컬럼 이름은 대소문자를 구별하지 않음
-- 변수(Column)에 저장된 값은 대소문자를 구별함
-- 'Clerk' != 'CLERK'


-- 문자열도 크기 비교가 가능함.
select * from emp
    where ename > 'F';
    
    
    
-- 직원 테이블에서 부서 번호가 20번 이거나 직책이 Salesman 인 직원들의 모든 정보를 검색
select * from emp
    where deptno = 20 or job = 'SALESMAN';
    
    
-- 직원 테이블에서 직책이 'CLERK'이거나 또는 'ANALYST' 또는 'MANAGER' 인 직원들의 모든 정보
select * from emp
    where job = 'CLERK' or job = 'ANALYST' or job = 'MANAGER';

select * from emp
    where job IN ('CLERK', 'ANALYST', 'MANAGER');
    
    
    
-- 직원 테이블에서 직책이 'CLERK', 'ANALYST', 'MANAGER' 가 아닌 직원들의 모든 정보를 검색
SELECT
    *
FROM EMP
    WHERE JOB != 'CLERK' AND JOB != 'ANALYST' AND JOB != 'MANAGER';
    

SELECT
    *
FROM EMP
    WHERE JOB NOT IN ('CLERK', 'ANALYST', 'MANAGER');
    
    
    
-- 직원 테이블에서 이름이 'A'로 시작하는 직원들의 모든 정보 검색
SELECT
    *
FROM EMP
WHERE ENAME LIKE 'A%';


SELECT
    *
FROM EMP
WHERE JOB LIKE '_LERK';






-- 직원 테이블에서 수당(comm)이 null인 직원들의 모든 정보를 검색
select * from emp
    where comm is null;


-- 직원 테이블에서 수당(comm)이 null이 아닌 직원들의 모든 정보를 검색
select * from emp
    where comm is not null;
    

select ename "이름" from emp
    where comm is not null;
    
    
-- 직원 테이블에서 수당을 받는 직원 중에서 급여가 1500 초과하는 직원의 사번과 이름과 급여를 검색
select empno "사번", ename "이름" from emp
    where comm is not null and sal > 1500;
    

-- 직원 테이블에서 수당을 받지 않는 직원 중에서 급여가 1500 초과하는 직원의 사번과 이름과 급여를 검색
select empno "사번", ename "이름" from emp
    where comm is null and sal > 1500;
    
    
-- 합집합(union), 교집합(intersect), 차집합(minus)

select * from emp where deptno = 10 or deptno = 20;

select * from emp where deptno = 10
union
select * from emp where deptno = 20;


-- 집합 연산자를 사용할 때 두개의 select 문장은 같은 컬럼들을 같은 순서로 검색해야 함(!)

select * from emp where deptno = 10 or deptno = 20;




select empno, ename, deptno from emp where deptno = 10
union
select empno, ename, deptno from emp where deptno = 20;


-- 이름이 'E'를 포함하는 모든 직원 정보 [a 집합]
select * from emp 
    where ename like '%E%';
    
-- job이 'E'를 포함하는 모든 직원 정보 [b 집합]
select * from emp
    where job like '%E%';
    
-- [a, b 교집합]
select * from emp 
    where ename like '%E%'
intersect
select * from emp
    where job like '%E%';



-- 30번 부서에서 일하는 직책이 SALESMAN인 직원들의 모든 정보 검색
select empno "사번", ename "이름", sal "급여", deptno "부서" from emp
    where deptno = 30 and job = 'SALESMAN';
    


-- 20, 30번 부서에서 근무하는 직원들 중 급여가 2000을 초과하는 직원들의 사번, 이름, 급여, 부서번호를 검색
select empno "사번", ename "이름", sal "급여", deptno "부서" from emp
    where deptno in (20, 30) and sal > 2000;
    
select empno "사번", ename "이름", sal "급여", deptno "부서" from emp
    where (deptno = 20 or deptno = 30) and sal > 2000;


-- 수당이 없는 직원들 중에서, 메니저가 있고, 직책이 'MANAGER' 또는 'CLERK'인 직원들의 모든 정보를 검색
select * from emp
    where comm is null and mgr is not null and job in ('MANAGER', 'CLERK');




