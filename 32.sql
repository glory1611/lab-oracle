/*
�÷���(collection): �����迭, ��ø���̺�, VARRAY

1) �����迭(associative array, index-by table) 
    - type ... is table of ... index by ...;
    - �ε����� ����, ���� ����, ���ڿ��� ����� �� ����.
    - ������ �� �ִ� ������ ������ ������ ����.
    - �����ڸ� ������� ����.
    
2) ��ø���̺�
    - type .. is table of ...;
    - �ε����� ���� ������ ����. -> �ε��� Ÿ��(index by)�� ������� ����.
    - ������ �� �ִ� ������ ������ ������ ����.
    - �����ڸ� ����ؾ� ��.
    
3) VARRAY(variable-size array)
    - type ... is varray(limit) of ...;
    - �������� ���� ������ ����. -> �ε��� Ÿ��(index by)�� ������� ����.
    - VARRAY�� ����� �� ������ �� �ִ� ���� ������ ������.
    - ������ �� �ִ� ������ ������ ������ ����.
    - �����ڸ� ����ؾ� ��.
    
    
*/

set serveroutput on;

declare
    -- ��ø ���̺� ����
    type numberarray is table of number;
    
    -- ��ø ���̺��� ���� ����
    v_numbers numberarray;

begin

--    v_numbers(1) := 100;
--    ��ø ���̺��� �ݵ�� �����ڸ� ȣ���ؼ� �ʱ��(initialize)�� �ؾ� ��.
    -- �����ڴ� Ÿ�ß��� �̸��� ����.
    -- �������� ���纯���� ��ø ���̺�/VARRAY�� ������ ������ ������.

    v_numbers := numberarray(100, 200, 300);
    
    -- ��ø ���̺� ����� ������ ���
    for i in 1..v_numbers.count
    loop
        dbms_output.put_line (i || ' : ' || v_numbers(i));
    end loop;
    
    -- ��ø ���̺� ���� �߰�
    -- extend(����)�� ȣ���ؼ� �迭�� ������ �� �ִ� ������ ������ ����� ��
    -- ���� �����ؾ� ��.
    v_numbers.extend(2);
    v_numbers(4) := 400;
    v_numbers(5) := 500;
end;
/


declare
    -- VARRAY Ÿ�� ����
    type numberarray is varray(5) of number;
    
    -- VARRAY Ÿ���� ������ ����
    v_numbers numberarray;

begin
    -- v_numbers(1) := 11;
    -- ������ ȣ�� ���� varray�� ����� ���� ����.
    
    v_numbers := numberarray(11, 22, 33);

        dbms_output.put_line ('count: ' || v_numbers.count);
        dbms_output.put_line ('limit: ' || v_numbers.limit);

--    for i in 1..v_numbers.count
--    loop
--        dbms_output.put_line (i || ' : ' || v_numbers(i));
--    end loop;
    
    -- VARRAY�� ���Ҹ� �߰��ϰ� ������
    -- extend(����)�� ȣ���ؼ� �迭�� ������ �� �ִ� ������ ������ ����� ��
    -- ���� �����ؾ� ��.
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

-- ���ڿ� 5���� ������ �� �ִ� varray�� StringArray��� �̸����� ����
-- StringArray Ÿ���� ����(v_names)�� ����
-- v_names�� ���Ұ� ���� varray�� �ʱ�ȭ(������ ȣ��)
-- v_names �����ϴ� ������ ������ 5���� Ȯ��(extend)
-- v_names�� 5���� ���ڿ����� ���� �� ���


declare
    type StringArray is varray(5) of varchar2(20);

    v_names StringArray;

begin
    v_names := StringArray(); -- ������ ����(count) 0���� �ʱ�ȭ
    
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


