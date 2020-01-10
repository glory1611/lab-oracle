/*  case ~ when ����

(1)
    case    �񱳴��
        when    ��1
            then    �񱳴�� = ��1 ������ �� ������ ����;
        when    ��2
            then    �񱳴�� = ��2 ������ �� ������ ����;
        ...
        else �񱳴���� ���� ��� ���� ��ġ���� ������ ������ ����;
    end case;

(2)
    case    
        when    ���ǽ�1
            then    ���ǽ�1 ������ �� ������ ����;
        when    ���ǽ�2
            then    ���ǽ�2 ������ �� ������ ����;
        ...
        else ���� ��� ������ �����϶� ������ ����;
    end case;
    
    
*/
set serveroutput on;

-- (1)
declare
    v_s     number := 88;

begin
    case    trunc(v_s, -1)
        when   100    then    dbms_output.put_line ('A');
        when    90    then    dbms_output.put_line ('A');
        when    80    then    dbms_output.put_line ('B');    
        when    70    then    dbms_output.put_line ('C');    
        else    dbms_output.put_line ('D');    
    end case;

end;
/

-- (2)
declare
    v_s     number := 88;
    
begin
    case
        when    v_s >= 90   then    dbms_output.put_line ('A');
        when    v_s >= 80   then    dbms_output.put_line ('B');
        when    v_s >= 70   then    dbms_output.put_line ('C');
        when    v_s >= 60   then    dbms_output.put_line ('D');
    else    dbms_output.put_line ('F');
    end case;
end;
/



    