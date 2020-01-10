/*
컬렉션(collection): 같은 타입의 데이터 여러개를 저장할 때 사용
1) 연관 배열(associative array, index by table)
2) 중첩 테이블(nested table)
3) VARRAY(cariable-size array)

연관 배열: key/index와 value의 쌍으로 구성되는 컬렉션
연관 배열에서 key/index는 binary_integer(정수), pls_integer(양의 정수), varchar2(문자열) 타입 가능.

연관 배열 선언(정의)하는 방법:
type 배열이름 is table of 데이터타입 index by 인덱스타입;

*/
set serveroutput on;

declare
    -- 문자열을 원소로 갖고, 양의 정수를 인덱스로 사용하는 연관 배열을 정의
 
    type students is table of varchar2(20) 
        index by pls_integer;
 
    -- 정의한 연관 배열 타입의 변수 선언
    v_stu students;
    
begin
    -- 연관 배열에 데이터 저장: 배열이름(인덱스) := 값;
    v_stu(1) := '강다혜';
    v_stu(2) := '김수인';
    v_stu(3) := '김영광';
    
    -- 연관 배열에 저장된 원소(데이터)의 값을 읽을 때: 배열이름(인덱스)
--    dbms_output.put_line (v_stu(1));
    for i in 1..3 
    loop
        dbms_output.put_line (v_stu(i));
    end loop;
    
end;
/





declare
    -- 인덱스 타입: varchar2(20), 원소 타입: number인 연관 배열을 정의(선언)
    type arr_menu is table of number
        index by varchar2(20);
        
    v_menu arr_menu;

begin
    -- 연관 배열에 데이터를 3개 저장
    -- 연관 배열에 저장된 데이터를 출력
    v_menu('한식') := 1000;
    v_menu('양식') := 500;
    v_menu('중식') := 100;
    
    dbms_output.put_line (v_menu('한식'));
    dbms_output.put_line (v_menu('중식'));
    dbms_output.put_line (v_menu('양식'));
    
end;
/


declare
    -- 인덱스 : 양의 정수, 원소(데이터타입) : 숫자인 연관 배열(arr_numbers)을 선언(정의)
    -- 연관 배열 타입의 변수(v_scores)를 선언
    
    type arr_numbers is table of number
        index by binary_integer;
        
    v_scores arr_numbers;
    v_sum number; -- 정수들의 합계를 저장할 변수
    v_avg number; -- 정수들의 평균을 저장할 변수
    n number;
    
begin
    -- 연관 배열 v_scores에 5개의 정수(0 ~ 100)를 입력
    -- 5개 정수의 합겨를 계산해서 출력
    -- 5개 정수의 평균을 계산해서 출력
    
    v_scores(1) := 90;
    v_scores(2) := 80;
    v_scores(3) := 70;
    v_scores(4) := 60;  
    v_scores(5) := 50;
    
    n := 5;
    v_sum := 0;
    for i in 1..v_scores.count -- v_scores.count 배열 갯수 카운트
    loop
        v_sum := v_sum + v_scores(i);
    end loop;
    dbms_output.put_line ('합계 = ' || v_sum);
        
    v_avg := v_sum/v_scores.count;
    dbms_output.put_line ('평균 = ' || v_avg);

end;
/






select sum(sal), avg(sal), variance(sal), stddev(sal) from emp;
-- emp 테이블에서 급여의 총합, 평균, 분산, 표준편차를 출력하는 PL/SQL

declare
    v_sum number;
    v_avg number;
    v_var number;
    v_std number;
    
begin
    select sum(sal), avg(sal), variance(sal), stddev(sal) 
    into v_sum, v_avg, v_var, v_std
    from emp;

    dbms_output.put_line (trunc(v_sum, 2));
    dbms_output.put_line (trunc(v_avg, 2));
    dbms_output.put_line (trunc(v_var, 2));
    dbms_output.put_line (trunc(v_std, 2));
end;
/

-- 인덱스는 영의정수, 배열의 원고(데이터)는 숫자 타입인 연관 배열을 정의
-- 난수(dbms_random.value(x, y)) 함수와 trunc 함수를 사용
-- for loop를 사용해서 연관 배열에 10개의 시험 성적(0 ~ 100)을 저장
-- 10개 시험 점수의 총함, 평균, 분산, 표준편차, 최댓값, 최솟값을 계산하는 식을 구현
create table ex_scores (
    sid number primary key,
    score number not null
    );


declare
    type arr_num is table of number
        index by binary_integer;

    v_scores arr_num;
    v_s    number;
    v_a    number;
    v_v    number;
    v_d    number;
    v_max  number;
    v_min  number;
    x   number; -- 인덱스 번호
    
begin

    for i in 1..10
    loop
        v_scores(i) := trunc(dbms_random.value(0, 101), 0);
    dbms_output.put_line ('학생 ' || i || ' : ' || v_scores(i));
    end loop;
    dbms_output.put_line ('--------------------');
    
    v_s := 0;
    for i in 1..v_scores.count
    loop
        v_s := v_s + v_scores(i);
    end loop;
    dbms_output.put_line ('총계 : ' || v_s);
    dbms_output.put_line ('--------------------');
    
    v_a := v_s/v_scores.count;
    dbms_output.put_line ('평균 : ' || v_a);
    dbms_output.put_line ('--------------------');
    
    for i in 1..v_scores.count
    loop
    
    end loop;
    
end;
/




--    v_scores(1)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(2)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(3)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(4)     := trunc(dbms_random.value(0, 101), 0);  
--    v_scores(5)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(6)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(7)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(8)     := trunc(dbms_random.value(0, 101), 0);
--    v_scores(9)     := trunc(dbms_random.value(0, 101), 0);  
--    v_scores(10)    := trunc(dbms_random.value(0, 101), 0);


