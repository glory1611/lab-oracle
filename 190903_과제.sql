/*
1. ���θ����� ������ ������ ������ customers ���̺��� ������� �Ѵ�.
������ ���� ������ ���̺��� ������ ����.
- ���̺� �̸�: customers
- �÷�: customer_id(�� ���̵�, 8 ~ 20 bytes�� ���ڿ�)
        customer_pw(�� ��й�ȣ, 8 ~ 20 bytes�� ���ڿ�)
        customer_email(�� �̸���, 100 bytes���� ������ ���ڿ�)
        customer_gender(�� ����, 1�ڸ� ����)
        customer_age(�� ����, 3�ڸ� ����)
- ���� ����: PK�� customer_id
             customer_pw�� not null
             customer_gender�� 0, 1, 2 �� �ϳ��� ����
             customer_age�� 0 ~ 200���� ����, �⺻���� 0
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
2. ���θ����� ����� �ֹ�(orders) ���̺��� ������� �Ѵ�.
������ ���� ������ ���̺��� ������ ����.
- ���̺� �̸�: orders
- �÷�: order_id(�ֹ� ��ȣ, 12�ڸ� ����)
        order_date(�ֹ� ��¥)
        order_method(�ֹ� ���, 8����Ʈ ���ڿ�)
        customer_id(�ֹ� �� ���̵�, 6�ڸ� ����)
        order_status(�ֹ� ����, 2�ڸ� ����)
        sales_rep_id(�Ǹ� ��� ���̵�, 6�ڸ� ����)
- ��������: PK�� order_id
            order_dated�� �⺻���� ���� �ð�
            order_method�� 'direct', 'online'�� �Է� ����
            order_status �⺻���� 0
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
3. ���θ����� ���� �ֹ��� ��ǰ ������ �����ϴ� order_items ���̺��� ������� �Ѵ�. ������ ���� ������ ���̺��� ������ ����.
- ���̺� �̸�: order_items
- �÷�: order_id(�ֹ� ��ȣ, 12�ڸ� ����)
        product_id(�ֹ� ��ǰ ��ȣ, 10�ڸ� ����)
        quantity(�ֹ� ��ǰ ����, 4�ڸ� ����)
        price(�ֹ� ��ǰ ����, 10�ڸ� ����)
- ���� ����: PK(order_id, product_id)
             quantity�� �⺻���� 0
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



-- order items ���̺� ���ڵ� insert

insert into o_i
values(100000, 1, 2, 1000);

insert into o_i
values(100000, 2, 3, 1500);

insert into o_i
values(100000, 1, 2, 1000);

insert into o_i
values(100001, 123, 10, 10000);



select * from o_i;


-- orders, orde_items ���̺���
-- �ֹ���ȣ, �ֹ�����, ��ǰ ���̵�, ��ǰ ����, ��ǰ ���� ��ȸ

select o.o_id �ֹ���ȣ, o.o_date �ֹ���¥, i.p_id, i.quant, i.price
    from o o join o_i i
    on o.o_id = i.o_id
    
;


commit;


select * from o_i;

delete from o_i;

rollback;



truncate table o_i;


select * from o_i;
