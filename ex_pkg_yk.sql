set serveroutput on;
-- ��Ű�� ��(specification) �ۼ�
-- ��Ű�� ����(body) �ۼ�

create or replace package my_stat
is
    -- ���� Ÿ���� �����ϰ�, �ε����� ���� ������ index-by table�� ����: NumberArray -- �����迭
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
     * sum: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� ���� ����
     -- sum�̶�� �Լ��� �迭�� ���
     -- �Լ��� ����ؼ� ���� �����Ѵ�
     * @param arr   NumberArray(������ Ÿ��)
     */
     function sum(arr NumberArray) return number;
    
    /**
     * avg: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� ����� ����ؼ� ����
     * @param arr   NumberArray
     * @param digit number -- ���ϰ�(���)�� �Ҽ��� ���� �ڸ���, �⺻���� 3
     */
     function avg(arr NumberArray, digit number := 3) return number;
     
     /***
     * var: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� �л��� ����ؼ� ����
     * @param var   NumberArray
     * @param digit number -- ���ϰ�(�л�)�� �Ҽ��� ���� �ڸ���, �⺻���� 3
     */
     function var(arr NumberArray, digit number := 3) return number;
     
     /****
     * std: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� ǥ�������� ����ؼ� ����
     * @param std   NumberArray
     * @param digit number -- ���ϰ�(�л�)�� �Ҽ��� ���� �ڸ���, �⺻���� 3
     */
     function std(arr NumberArray, digit number := 3) return number;
     
     /*****
     * max: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� �ִ��� ����ؼ� ����
     * @param max   NumberArray
     */
     function max(arr NumberArray) return number;
     
     /******
     * min: �Ķ���Ϳ� ���޹��� �迭�� �ִ� ��� ���ҵ��� �ּҰ� ����ؼ� ����
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