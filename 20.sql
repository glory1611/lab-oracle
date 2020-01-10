-- 테이블 수정

-- 테이블의 컬럼 이름 변경
alter table ex02 rename column ex_id to eid;

alter table ex02 modify ex_text varchar2(1000);

alter table ex02 add ex_date date;

alter table ex02 drop column ex_date;

alter table ex02 add constraint pkex02 primary key (eid);

alter table ex02 add constraint nn_ex02 not null (ex_text); -- 오류 

alter table ex02 add constraint nn_ex02 check(ex_text is not null);

alter table ex02 drop constraint nn_ex02;







desc ex02;        