/*
1. emp 테이블과 똑같은 구조(컬럼이름, 데이터 타입)을 갖는 테이블을 hw_emp라는 이름으로 생성

2. hw_emp 테이블에 새로운 컬럼을 추가
   컬럼 이름: etc
   데이터 타입: 최대 20 bytes 가변 길이 문자열

3. etc 컬럼이 100 bytes까지 문자열을 저장할 수 있도록 변경

4. etc 컬럼의 이름을 remark로 변경

5. emp 테이블의 데이터를 모두 hw_emp에 저장. remark 컬럼의 값은 모두 null

6. hw_emp 테이블의 empno 컬럼에 고유키 제약 조건을 추가

7. hw_emp 삭제
*/

-- 1
create table hw_emp
             as select * from emp
             where 1 != 1
;
    
desc hw_emp;
select * from hw_emp;

-- 2
alter table hw_emp add etc varchar2(20);

-- 3
alter table hw_emp modify etc varchar2(100);

-- 4
alter table hw_emp rename column etc to remark;

-- 5
insert into hw_emp 
            (empno, ename, job, mgr, hiredate, sal, comm, deptno)
            select 
            empno, ename, job, mgr, hiredate, sal, comm, deptno -- *
            from emp
;

-- 6
alter table hw_emp add constraint pk_hw primary key (empno);

-- 7
drop table hw_emp;





create sequence seq1;
select seq1.nextval from dual;


insert into ex02(eid, ex_text)
values(seq1.nextval, 'aabbcc');


select * from ex02;



