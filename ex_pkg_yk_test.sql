set serveroutput on;
-- ex_pkg_yk.sql에서 작성한 패키지의 함수들을 테스트

declare
    arr my_stat.NumberArray;

begin
    for i in 1..10
    loop
        arr(i) := trunc(dbms_random.value(0, 101), 0);
        dbms_output.put_line ('arr ' || i || ' : ' || arr(i));
    end loop;
    dbms_output.put_line ('----------------           ----');
    dbms_output.put_line ('총계 : '     || my_stat.sum(arr));
    dbms_output.put_line ('평균 : '     || my_stat.avg(arr));
    dbms_output.put_line ('분산 : '     || my_stat.var(arr));
    dbms_output.put_line ('표준편차 : ' || my_stat.std(arr));
    dbms_output.put_line ('최댓값 : '   || my_stat.max(arr));
    dbms_output.put_line ('최솟값 : '   || my_stat.min(arr));
end;
/
