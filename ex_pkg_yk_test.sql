set serveroutput on;
-- ex_pkg_yk.sql���� �ۼ��� ��Ű���� �Լ����� �׽�Ʈ

declare
    arr my_stat.NumberArray;

begin
    for i in 1..10
    loop
        arr(i) := trunc(dbms_random.value(0, 101), 0);
        dbms_output.put_line ('arr ' || i || ' : ' || arr(i));
    end loop;
    dbms_output.put_line ('----------------           ----');
    dbms_output.put_line ('�Ѱ� : '     || my_stat.sum(arr));
    dbms_output.put_line ('��� : '     || my_stat.avg(arr));
    dbms_output.put_line ('�л� : '     || my_stat.var(arr));
    dbms_output.put_line ('ǥ������ : ' || my_stat.std(arr));
    dbms_output.put_line ('�ִ� : '   || my_stat.max(arr));
    dbms_output.put_line ('�ּڰ� : '   || my_stat.min(arr));
end;
/
