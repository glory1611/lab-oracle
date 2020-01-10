/*
1. 쇼핑몰에서 고객들의 정보를 저장할 customers 테이블을 만들려고 한다.
다음과 같은 구조의 테이블을 생성해 보자.
- 테이블 이름: customers
- 컬럼: customer_id(고객 아이디, 8 ~ 20 bytes의 문자열)
        customer_pw(고객 비밀번호, 8 ~ 20 bytes의 문자열)
        customer_email(고객 이메일, 100 bytes까지 가능한 문자열)
        customer_gender(고객 성별, 1자리 정수)
        customer_age(고객 나이, 3자리 정수)
- 제약 조건: PK는 customer_id
             customer_pw는 not null
             customer_gender는 0, 1, 2 중 하나만 가능
             customer_age는 0 ~ 200까지 가능, 기본값은 0
*/

create table c (
             c_id         varchar2(20),
             c_pw         varchar2(20)           constraint nn_c_pw not null,
             c_email      varchar2(100),
             c_gender     number(1),
             c_age        number(3)              default 0,  -- default
                constraint  pk_c_id              primary key (c_id),
                constraint  ck_c_id              check (lengthb(c_id) >= 8),
                constraint  ck_c_pw              check (lengthb(c_pw) >= 8),
                constraint  ck_c_gender          check (c_gender in(0, 1, 2) and c_gender = trunc(c_gender, 0)),
                constraint  ck_c_age             check (c_age between 0 and 200)
    
);


drop table c;

/*
2. 쇼핑몰에서 사용할 주문(orders) 테이블을 만들려고 한다.
다음과 같은 구조의 테이블을 생성해 보자.
- 테이블 이름: orders
- 컬럼: order_id(주문 번호, 12자리 정수)
        order_date(주문 날짜)
        order_method(주문 방법, 8바이트 문자열)
        customer_id(주문 고객 아이디, 6자리 정수)
        order_status(주문 상태, 2자리 숫자)
        sales_rep_id(판매 사원 아이디, 6자리 정수)
- 제약조건: PK는 order_id
            order_dated의 기본값은 현재 시간
            order_method는 'direct', 'online'만 입력 가능
            order_status 기본값은 0
*/

create table o (
             o_id            number(12),
             o_date          date           default sysdate,
             o_method        varchar2(8),
             c_id            number(6),
             o_status        number(2)      default 0,
             s_rep_id        number(6),
                constraint  pk_o_id         primary key (o_id),
                constraint  ck_method       check (o_method in ('direct', 'online'))

);


/*
3. 쇼핑몰에서 고객이 주문한 상품 정보를 저장하는 order_items 테이블을 만들려고 한다. 다음과 같은 구조의 테이블을 생성해 보자.
- 테이블 이름: order_items
- 컬럼: order_id(주문 번호, 12자리 정수)
        product_id(주문 상품 번호, 10자리 정수)
        quantity(주문 상품 수량, 4자리 정수)
        price(주문 상품 가격, 10자리 정수)
- 제약 조건: PK(order_id, product_id)
             quantity의 기본값은 0
*/

create table o_i (
             o_id        number(12),
             p_id        number(10),
             quant       number(4)           default(0),
             price       number(10),
                constraint pk_order_product  primary key (o_id, p_id)

);


/*

*/

insert into c (c_id, c_pw)
values ('admin0000', 'admin1234');

insert into c (c_id, c_pw)
values ('11110003', 'pw123456');

select * from o_i;


update c
set c_gender = 2
where c_gender is null
;

update c
set c_id = 11110002
where c_id = 11110003;



insert into o (o_id, c_id)
values (100001, 123456);

update o
set s_rep_id = 100
where s_rep_id is null;



-- order items 테이블에 레코드 insert

insert into o_i
values(100000, 1, 2, 1000);

insert into o_i
values(100000, 2, 3, 1500);

insert into o_i
values(100000, 1, 2, 1000);

insert into o_i
values(100001, 123, 10, 10000);



select * from o_i;


-- orders, orde_items 테이블에서
-- 주문번호, 주문날자, 상품 아이디, 상품 수량, 상품 가격 조회

select o.o_id 주문번호, o.o_date 주문날짜, i.p_id, i.quant, i.price
    from o o join o_i i
    on o.o_id = i.o_id
    
;


commit;


select * from o_i;

delete from o_i;

rollback;



truncate table o_i;


select * from o_i;
