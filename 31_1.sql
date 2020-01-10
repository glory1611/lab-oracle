set serveroutput on;

-- �ε����� ��������, �迭�� ����(������)�� ���� Ÿ���� ���� �迭�� ����
-- ����(dbms_random.value(x, y)) �Լ��� trunc �Լ��� ���
-- for loop�� ����ؼ� ���� �迭�� 10���� ���� ����(0 ~ 100)�� ����
-- 10�� ���� ������ ����, ���, �л�, ǥ������, �ִ�, �ּڰ��� ����ϴ� ���� ����

create table ex_scores (
    sid number primary key,
    score number not null
    );

--------------------------------
--------------------------------
declare
    type arr_num is table of number
        index by binary_integer;

    v_scores arr_num;
    v_cnt  constant number := 10;
    
    v_s    number;
    v_a    number;
    v_v    number;
    v_d    number;
    v_max  number;
    v_min  number;
 
    t_s    number;
    t_a    number;
    t_v    number;
    t_d    number;
    t_max  number;
    t_min  number;
    
begin

    for i in 1..v_cnt
    loop
        v_scores(i) := trunc(dbms_random.value(0, 101), 0);
    dbms_output.put_line ('�л� ' || i || ' : ' || v_scores(i));
    end loop;
    dbms_output.put_line ('--------------------');
    dbms_output.put_line ('--------------------');
    
    v_s := 0;
    for i in 1..v_scores.count
    loop
        v_s := v_s + v_scores(i);
    end loop;
    dbms_output.put_line ('�Ѱ� : ' || v_s);
    
    v_a := v_s/v_scores.count;
    dbms_output.put_line ('��� : ' || v_a);
    
    v_v := 0;
    for i in 1..v_scores.count
    loop
        v_v := v_v + (v_a - v_scores(i))**2;
    end loop;
    v_v := v_v/(v_scores.count - 1);
    dbms_output.put_line ('�л� : ' || v_v);
    
    v_d := sqrt(v_v);
    dbms_output.put_line ('ǥ������ : ' || v_d);  
    
    v_max := v_scores(1);
    for i in 1..v_scores.count
    loop
        if v_scores(i) > v_max
        then v_max := v_scores(i);
        end if;
    end loop;
    dbms_output.put_line ('�ִ� : ' || v_max);
    
    v_min := v_scores(1);
    for i in 1..v_scores.count
    loop
        if v_scores(i) < v_min
        then v_min := v_scores(i);
        end if;
    end loop;
    dbms_output.put_line ('�ּڰ� : ' || v_min);
    
dbms_output.put_line ('--------------------'); 
dbms_output.put_line ('--------------------'); 
    
--------------------------------  
--------------------------------
delete from ex_scores; -- ���̺� ������ ����
--------------------------------
--------------------------------

    for i in 1..v_scores.count
    loop
    insert into ex_scores
        values (i, v_scores(i));
    end loop;
    
    select sum(score), avg(score), variance(score), stddev(score), max(score), min(score)
        into t_s, t_a, t_v, t_d, t_max, t_min
        from ex_scores;
    dbms_output.put_line ('�Ѱ� : ' || t_s); 
    dbms_output.put_line ('��� : ' || t_a); 
    dbms_output.put_line ('�л� : ' || t_v);
    dbms_output.put_line ('ǥ������ : ' || t_d);
    dbms_output.put_line ('�ִ� : ' || t_max);
    dbms_output.put_line ('�ּڰ� : ' || t_min);
    
end;
/


delete from ex_scores; 


