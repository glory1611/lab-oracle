/*
컬렉션(collection): 연관배열, 중첩테이블, VARRAY

1) 연관배열(associative array, index-by table) 
    - type ... is table of ... index by ...;
    - 인덱스는 정수, 양의 정수, 문자열을 사용할 수 있음.
    - 저장할 수 있는 값들의 갯수가 제한이 없음.
    - 생성자를 사용하지 않음.
    
2) 중첩테이블
    - type .. is table of ...;
    - 인덱스는 양의 정수만 가능. -> 인덱스 타입(index by)을 명시하지 않음.
    - 저장할 수 있는 값들의 갯수가 제한이 없음.
    - 생성자를 사용해야 함.
    
3) VARRAY(variable-size array)
    - type ... is varray(limit) of ...;
    - 인젝스는 양의 정수만 가능. -> 인덱스 타입(index by)을 명시하지 않음.
    - VARRAY가 선언될 때 저장할 수 있는 갑의 갯수를 지정함.
    - 저장할 수 있는 값들의 갯수가 제한이 있음.
    - 생성자를 사용해야 함.
    
    
*/

set serveroutput on;

declare
    -- 중첩 테이블 선언
    type numberarray is table of number;
    
    -- 중첩 테이블의 변수 선언
    v_numbers numberarray;

begin

--    v_numbers(1) := 100;
--    중첩 테이블은 반드시 생성자를 호출해서 초기와(initialize)를 해야 함.
    -- 생성자는 타ㅓ읩의 이름과 같다.
    -- 생성자의 매재변수로 중첩 테이블/VARRAY에 저장할 값들을 전달함.

    v_numbers := numberarray(100, 200, 300);
    
    -- 중첩 테이블에 저장된 값들을 출력
    for i in 1..v_numbers.count
    loop
        dbms_output.put_line (i || ' : ' || v_numbers(i));
    end loop;
    
    -- 중첩 테이블에 값을 추가
    -- extend(갯수)를 호출해서 배열이 저장할 수 있는 원소의 갯수를 놀려준 후
    -- 값을 투가해야 함.
    v_numbers.extend(2);
    v_numbers(4) := 400;
    v_numbers(5) := 500;
end;
/


declare
    -- VARRAY 타입 선언
    type numberarray is varray(5) of number;
    
    -- VARRAY 타입의 변수를 선언
    v_numbers numberarray;

begin
    -- v_numbers(1) := 11;
    -- 생성자 호출 전에 varray를 사용할 수는 없다.
    
    v_numbers := numberarray(11, 22, 33);

        dbms_output.put_line ('count: ' || v_numbers.count);
        dbms_output.put_line ('limit: ' || v_numbers.limit);

--    for i in 1..v_numbers.count
--    loop
--        dbms_output.put_line (i || ' : ' || v_numbers(i));
--    end loop;
    
    -- VARRAY에 원소를 추가하고 싶으면
    -- extend(갯수)를 호출해서 배열이 저장할 수 있는 원소의 갯수를 놀려준 후
    -- 값을 투가해야 함.
    v_numbers.extend(2);
    v_numbers(4) := 44;
    v_numbers(5) := 55;
    
    for i in 1..v_numbers.count
    loop
        dbms_output.put_line (i || ' : ' || v_numbers(i));
    end loop;
    
end;
/






--

set serveroutput on;

-- 문자열 5개를 저장할 수 있는 varray를 StringArray라는 이름응로 선언
-- StringArray 타입의 변수(v_names)를 선언
-- v_names를 원소가 없는 varray로 초기화(생성자 호출)
-- v_names 저장하는 원소의 갯수를 5개를 확장(extend)
-- v_names에 5개의 문자열들을 저장 및 출력


declare
    type StringArray is varray(5) of varchar2(20);

    v_names StringArray;

begin
    v_names := StringArray(); -- 원소의 갯수(count) 0개로 초기화
    
    v_names.extend(5);
    
    v_names(1) := 'aaa';
    v_names(2) := 'bbb';
    v_names(3) := 'ccc';
    v_names(4) := 'ddd';
    v_names(5) := 'eee';
    
    for i in 1..v_names.count
    loop
        dbms_output.put_line (i || ' : ' || v_names(i));
    end loop;
end;
/


