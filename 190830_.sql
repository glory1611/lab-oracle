-- 다중행 함수 (multi-row function, group function)
-- 여래개의 행이 함수의 argument로 전달되서 하나의 결과값이 출력되는 함수

-- 모든 사원의 급여의 총 합계, 평균, 최대값, 최소값
select 
    sum(sal),
    round(avg(sal), 2),
    trunc(avg(sal), 2),
    max(sal),
    min(sal),
    variance(sal),
    stddev(sal)
from emp;


-- count(변수) : 데이터의 갯수를 리턴
select 
    count(*), 
    count(comm), -- count 함수는 null이 아닌 값들의 갯수를 리턴
    count(distinct deptno) -- 중복값 제거한 갯수를 리턴
from emp;


--
select empno, count(empno) from emp; -- 에러
    
    
    
-- max() 와 min() 함수는 date 타입에도 사용할 수 있음.
select max(hiredate), min(hiredate) from emp;








-- order by 변수(컬럼)이름 asc(오름)/desc(내림)
-- order by 정렬 방식 : 디폴트값 오름차순 (asc 생략 가능)
select * from emp order by empno desc;

select * from emp order by deptno;

select * from emp order by deptno, empno desc;



-- 30번 부서 사원들의 급여의 합계, 최솟값, 최대값, 평균, 분산, 표준편차 계산
select 30 as Deptno,
    sum(sal) as sum,
    min(sal) as min,
    max(sal) as max,
    round(avg(sal), 2) as avg,
    round(variance(sal), 2) as var,
    round(stddev(sal), 2) as std
from emp
where deptno = 30;


-- 부서별 급여의 최소/최대/편균값을 출력
select 
        10 as Deptno,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg,
        round(variance(sal), 2) as var,
        round(stddev(sal), 2) as stddev
    from emp
    where deptno = 10
    union
select 
        20 as Deptno,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg,
        round(variance(sal), 2) as var,
        round(stddev(sal), 2) as stddev
    from emp
    where deptno = 20
    union
select 
        30 as Deptno,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg,
        round(variance(sal), 2) as var,
        round(stddev(sal), 2) as stddev
from emp
where deptno = 30
;


--------
--------

select 
    deptno,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg,
        round(variance(sal), 2) as var,
        round(stddev(sal), 2) as stddev
from emp

group by deptno;


--------
--------

-- 모든 그릅 함수는 기본적으로 null을 제외하고 기능을 수행
select sum(comm), avg(comm), avg(nvl(comm, 0)) from emp;



select 
    deptno,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg,
        round(variance(sal), 2) as var,
        round(stddev(sal), 2) as stddev
from emp
group by deptno
order by deptno;




select
    job,
        sum(sal) as sum,
        min(sal) as min,
        max(sal) as max,
        round(avg(sal), 2) as avg
    from emp
    group by job
order by job;






select
    mgr,
        round(avg(sal), 2) as avg
    from emp
    group by mgr
order by mgr;




-- 부서별 급여 평균 출력.
-- 단, 평균 급여가 2000 이상인 부서만 출력.


select
    deptno,
        avg(sal) as avg
    from emp
where avg(sal) > 2000
group by deptno; -- 오류 발생


select
    deptno,
        avg(sal) as avg
    from emp
group by deptno
having avg(sal) > 2000;


-- 메니져가 null이 아닌 직원 중에서, 메니저 별로 평균 급여 출력
select
    mgr,
    avg(sal)
    from emp
    where mgr is not null
    group by mgr;
    
    

-- 1) 부서 번호, 부서별 평균 급여, 부서별 최고/ 최소 급여, 사원수 출력
-- 소숫점은 한자리까지만 출력
select
    deptno, 
    round(avg(sal), 1) as avg,
    max(sal) as max,
    min(sal) as min,
    count(*) as 사원수
from emp
group by deptno
order by deptno;



-- 2) 같은 직책을 갖는 사원수가 3명 이상인 직책에 대해서
-- 직책별 사원수를 출력
select
    job,
    count(*) as 인원
from emp
group by job
having count(*) >=3
order by 인원
;
-- select 에서 만든 컬럼의 별명(alias)는 order by 구문에서만 사용 가능!



-- 3) 입사 연도별 급여 평균, 급여 최소/최대값 출력. 
-- 입사 연도를 'YYYY' 형식으로 출력.
select
    to_char(hiredate, 'YYYY') as 입사연도,
    count(ename) as 인원,
    round(avg(sal), 1) as "평균 연봉",
    max(sal),
    min(sal)
from emp
group by to_char(hiredate, 'YYYY')
order by 입사연도;



-- 4) 입사 연도별, 부서별로 몇명이 입사 했는지 출력.
select
    to_char(hiredate, 'YYYY') as 입사연도,
    deptno as 부서번호,
    count(ename) as 인원
from emp
group by to_char(hiredate, 'YYYY'), deptno
order by 입사연도;



-- 5) 수당을 받는 직원수와 받지 않는 직원수를 출력
select 
    count(comm) as 수당,
    count(nvl(comm, 0)) as 수당x
from emp;


select
    nvl2(comm, 'y', 'n'),
    count(*)
from emp
group by nvl2(comm, 'y', 'n')
;


