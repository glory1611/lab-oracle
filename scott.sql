-- 테이블 생성
create table ex1(
    ex_id       number, 
    ex_text     varchar2(10),
    ex_date     date
);


-- 테이블 구조(컬럼 이름, 데이터 타입, Null 여부) 확인
desc ex1;

-- 테이블에 데이터(레코드) 저장(삽입)
insert into ex1(ex_id, ex_text, ex_date)
values (1, '안녕하새요', sysdate);

-- 테이블에 저장된 레코드 검색
select * from ex1;

-- 변경된 데이터를 DBMS에 영구 저장
commit; -- 트렌젝션을 완료하는 



-- DDL(Data Definition Language) : 데어터 정의 언어
-- 테이블 단위
-- create, alter, drop, truncate
-- 생성    수정   삭제
-- DDL 명령은 실행이 되면 자동으로 commit이 됨.

-- DML(Data Manuplation Language) : 데이터 조작 언어
-- 레코드 단위
-- insert, update, delete
-- 추가    수정    삭제
-- DB에 접속한 사용자가 commit 명령을 수행해야만 DBMS에 영수적으로 반영됨.


------------------
------------------

insert into ex1 (ex_id, ex_text)
values (2, 'abc');


select * from ex1;


-- 테이블의 모든 컬럼에 갑을 저장할 때는
-- insert into 구문에서 컬럼 이름을 생략할 수 있다.
-- 단, values는 테이블의 컬럼 순서에 일치시켜서 모든 컬럼의 값을 전달해야 함.
insert into ex1
values (11, 'data', sysdate);

insert into ex1 values (20); -- values의 갯구와 컬럼의 갯수가 다름.
insert into ex1 values (sysdate, 'test', 0); -- values의 순서가 컬럼 순서와 다름.

insert into ex1 (ex_text)
values ('재미있나요?'); -- varchar2(10)에 저장할 수 있는 문자열 길이를 초과

commit;


-- 테이블 이름: ex02
-- 컬럼: ex_id - number(2), ex_text - varchar2(5 char)

create table ex02(
    ex_id       number(2),
    ex_text     varchar2(5 char)
);
    
desc ex02;

insert into ex02
values (1, '안녕하세요');


desc emp;
