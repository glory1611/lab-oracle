set serveroutput on;

-- 인덱스는 영의정수, 배열의 원고(데이터)는 숫자 타입인 연관 배열을 정의
-- 난수(dbms_random.value(x, y)) 함수와 trunc 함수를 사용
-- for loop를 사용해서 연관 배열에 10개의 시험 성적(0 ~ 100)을 저장
-- 10개 시험 점수의 총함, 평균, 분산, 표준편차, 최댓값, 최솟값을 계산하는 식을 구현

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
    dbms_output.put_line ('학생 ' || i || ' : ' || v_scores(i));
    end loop;
    dbms_output.put_line ('--------------------');
    dbms_output.put_line ('--------------------');
    
    v_s := 0;
    for i in 1..v_scores.count
    loop
        v_s := v_s + v_scores(i);
    end loop;
    dbms_output.put_line ('총계 : ' || v_s);
    
    v_a := v_s/v_scores.count;
    dbms_output.put_line ('평균 : ' || v_a);
    
    v_v := 0;
    for i in 1..v_scores.count
    loop
        v_v := v_v + (v_a - v_scores(i))**2;
    end loop;
    v_v := v_v/(v_scores.count - 1);
    dbms_output.put_line ('분산 : ' || v_v);
    
    v_d := sqrt(v_v);
    dbms_output.put_line ('표준편차 : ' || v_d);  
    
    v_max := v_scores(1);
    for i in 1..v_scores.count
    loop
        if v_scores(i) > v_max
        then v_max := v_scores(i);
        end if;
    end loop;
    dbms_output.put_line ('최댓값 : ' || v_max);
    
    v_min := v_scores(1);
    for i in 1..v_scores.count
    loop
        if v_scores(i) < v_min
        then v_min := v_scores(i);
        end if;
    end loop;
    dbms_output.put_line ('최솟값 : ' || v_min);
    
dbms_output.put_line ('--------------------'); 
dbms_output.put_line ('--------------------'); 
    
--------------------------------  
--------------------------------
delete from ex_scores; -- 테이블 데이터 삭제
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
    dbms_output.put_line ('총계 : ' || t_s); 
    dbms_output.put_line ('평균 : ' || t_a); 
    dbms_output.put_line ('분산 : ' || t_v);
    dbms_output.put_line ('표준편차 : ' || t_d);
    dbms_output.put_line ('최댓값 : ' || t_max);
    dbms_output.put_line ('최솟값 : ' || t_min);
    
end;
/


delete from ex_scores; 


