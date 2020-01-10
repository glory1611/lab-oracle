set serveroutput on;
-- 패키지 명세(specification) 작성
-- 패키지 본문(body) 작성

create or replace package my_stat
is
    -- 숫자 타입을 저장하고, 인덱스는 양의 정수인 index-by table을 선언: NumberArray -- 연관배열
    type NumberArray is table of number
        index by pls_integer
    ; -- type end
        
    arr NumberArray;
    v_sum number := 0;
    v_avg number := 0;
    v_var number := 0;
    v_std number := 0;
    v_max number := 0;
    v_min number := 0;
    
    /*
     * sum: 파라미터에 전달받은 배열에 있는 모든 원소들의 합을 리턴
     -- sum이라는 함수에 배열을 줘라
     -- 함수는 계산해서 값을 리턴한다
     * @param arr   NumberArray(데이터 타입)
     */
     function sum(arr NumberArray) return number;
    
    /**
     * avg: 파라미터에 전달받은 배열에 있는 모든 원소들의 평균을 계산해서 리턴
     * @param arr   NumberArray
     * @param digit number -- 리턴값(평균)의 소숫점 이하 자릿수, 기본값은 3
     */
     function avg(arr NumberArray, digit number := 3) return number;
     
     /***
     * var: 파라미터에 전달받은 배열에 있는 모든 원소들의 분산을 계산해서 리턴
     * @param var   NumberArray
     * @param digit number -- 리턴값(분산)의 소숫점 이하 자릿수, 기본값은 3
     */
     function var(arr NumberArray, digit number := 3) return number;
     
     /****
     * std: 파라미터에 전달받은 배열에 있는 모든 원소들의 표준편차를 계산해서 리턴
     * @param std   NumberArray
     * @param digit number -- 리턴값(분산)의 소숫점 이하 자릿수, 기본값은 3
     */
     function std(arr NumberArray, digit number := 3) return number;
     
     /*****
     * max: 파라미터에 전달받은 배열에 있는 모든 원소들의 최댓값을 계산해서 리턴
     * @param max   NumberArray
     */
     function max(arr NumberArray) return number;
     
     /******
     * min: 파라미터에 전달받은 배열에 있는 모든 원소들의 최소값 계산해서 리턴
     * @param min   NumberArray
     */
    function min(arr NumberArray) return number;
end;
/


create or replace package body my_stat
is
    -- sum
    function sum(arr NumberArray) return number
    is
        v_sum number := 0;
    begin
        for i in 1..arr.count
        loop
            v_sum := v_sum + arr(i);
        end loop;
        
    return v_sum;
    end; -- end sum
    ---------------
    -- avg
    function avg(arr NumberArray, digit number := 3) return number
    is
    begin    
        v_avg := round(my_stat.sum(arr)/arr.count, digit);
        
    return v_avg;
    end; -- end avg
    ---------------
    -- var
    function var(arr NumberArray, digit number := 3) return number
    is
    begin
        for i in 1..arr.count
        loop
            v_var := v_var + (my_stat.avg(arr) - arr(i))**2;
        end loop;
    v_var := round(v_var / (arr.count -1), digit);
        
    return v_var;
    end; -- end var
    ---------------
    -- std
    function std(arr NumberArray, digit number := 3) return number
    is
    begin
        v_std := round(sqrt(my_stat.var(arr)), digit);
       
    return v_std;
    end; -- end std
    ---------------
    -- max
    function max(arr NumberArray) return number
    is
        v_max number := arr(1);
    begin
        for i in 1..arr.count
        loop
            if arr(i) > v_max
            then v_max := arr(i);
            end if;
        end loop;
    
    return v_max;
    end; -- end max
    ---------------
    -- min
    function min(arr NumberArray) return number
    is
        v_min number := arr(1);
    begin
        for i in 1..arr.count
        loop
            if arr(i) < v_min
            then v_min := arr(i);
            end if;
        end loop;
    
    return v_min;
    end; -- end min

end;
/