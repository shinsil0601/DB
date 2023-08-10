-- PL/SQL : 오라클에서 지원하는 프로그래밍 언어의 특성을 수용한 SQL의 확장
--          SQL의 쿼리문 + 제어문(if, loop, for)를 사용
--          절차적 프로그램이 가능하게 하는 오라클 SQL 전용언어
-- 참조: http://www.tutorialspoint.com/plsql/index.htm

-- 1. 프로시져: return 예약어를 사용하지 않는 함수와 같음
--            작업순서가 정해진 독립된 프로그램의 수행 단위
--            결과를 가지고 되돌아가려면 out 예약어를 사용해야한다.
--   기본구조: [선언절], 실행절, [예외절]
--    1.선언절: DECLARE
--              변수선언;
--    2.실행절: BEGIN
--             SQL 문장들...;
--    3.예외절: EXCEPTION  =>(거의 안쓴다)
--         끝: ~ END;

-- Hello, World! 출력하기
-- (자바)String msg = "hello, world!" -> (sql)msg varchar2(50) := 'hello, world!'
-- System.out.println(내용)   -> dbms_output.put_line(내용);
--         단, dbms_output.put_line(); 사용하기 위해서는 set serveroutput on; 먼저 해줘야함

-- 1) 익명 프로시져: 일회용, 저장되지 않는다.
    set serveroutput on;
    DECLARE
        msg VARCHAR2(50) := 'hello, world!';
    BEGIN
    dbms_output.put_line(msg);
    END;
    
-- 익명 프로시져를 활용한 제어문 연습
-- 1) 형식  if  조건식 then
--            조건이 참이면 실행할 문장;
--         end if;

-- 변수 i가 10이상 이면 데이터 값을 출력하자 (범위잡고 실행해야 출력됨)
    DECLARE
      i number := 24;
    BEGIN
      if (i >= 10) then
        dbms_output.put_line('i는'|| i ||'이다.');
      end if;
    END;
    
-- 2)형식 if 조건식 then
--        조건이 참이면 실행할 문장;
--       else
--        조건이 거짓이면 실행할 문장;
--       end if;

--  변수 i가 홀수인지 짝수인지 판별하는 익명 프로시져
    DECLARE
        i number :=48;
    BEGIN
        if(mod(i,2)=0) then
          dbms_output.put_line('i는'|| i ||'짝수이다.');
        else
          dbms_output.put_line('i는'|| i ||'홀수이다.');
        end if;
    END;
--   
    DECLARE
        i number := 48;
        res varchar2(50);
    BEGIN
        if(mod(i,2)=0) then
          res := '짝수';
        else
          res := '홀수';
        end if;
          dbms_output.put_line('i는'|| i ||'은' || res ||'이다');
    END;
    
-- 3)형식 if 조건식 then
--         실행문;
--       elsif 조건식 then
--         실행문;
--       elsif 조건식 then
--         실행문;
--       [else 실행문; ] =>생략가능
--       end if;
    
    DECLARE
        i int := 80;
        hak varchar2(50);
    BEGIN
        if (i>=90) THEN
        hak := 'A학점';
    ELSIF (i>=80) THEN
        hak := 'B학점';
    ELSIF (i>=70) THEN
        hak := 'C학점';
    ELSE hak := 'F학점';
    END IF;
    dbms_output.put_line('성적은'|| hak ||'입니다');
    END;
    
-- 반복문: for문, while문, loop문
--  1) for문
--      for 변수 in 초기값 .. 최종값 loop
--          반복실행할 문장(SQL문)
--      end loop;

-- 1-10까지 출력하는 프로시져
    DECLARE
        i number;
    BEGIN
        for i in 1 .. 10 loop
            dbms_output.put_line('i는'|| i);
        end loop;
    END;
--    
    DECLARE
     BEGIN
        for cnt in 11 .. 20 loop
            dbms_output.put_line('cnt는'|| cnt);
        end loop;
    END;
-- 1-10까지 짝수만 출력
    DECLARE
    BEGIN
    for cnt in 1 .. 10 loop
         if(mod(cnt,2)=0) then
         dbms_output.put_line('1-10까지 짝수는'|| cnt);
         end if;
        end loop;
    END;
-- 1-10까지 짝수의 합 출력
    DECLARE
      i number :=0;  --초기값지정 꼭 해주자!!
    BEGIN
    for cnt in 1 .. 10 loop
         if(mod(cnt,2)=0) then
          i := i+cnt;
         end if;
        end loop;
        dbms_output.put_line('짝수의 합은 '|| i);
    END;    
    
-- 2) while문
--      DECLARE
--        변수(초기식)
--      BEGIN
--        WHILE 조건식 LOOP
--          실행할 문장;
--          증감식;
--        END LOOP;
--      END;
    
-- 1-10까지 출력
    DECLARE
       i NUMBER := 1;
    BEGIN
       WHILE i < 11 LOOP
        dbms_output.put_line('i는'|| i);
         i := i+1;
        END LOOP;
    END;
-- 1-10까지 짝수만 출력
    DECLARE
       i NUMBER := 1;
    BEGIN
       WHILE i < 11 LOOP
        if(mod(i,2)=0) then
        dbms_output.put_line('짝수는'|| i);
         end if;
         i := i+1;
        END LOOP;
    END;
-- 1-10까지 짝수의 합 출력
    DECLARE
       i NUMBER := 1;
       cnt NUMBER := 0;
    BEGIN
       WHILE i < 11 LOOP
        if(mod(i,2)=0) then
        cnt := cnt+i;
         end if;
         i := i+1;
        END LOOP;
        dbms_output.put_line('짝수의 합은 '|| cnt);
    END;
    
-- 3) loop
--      DECLARE                                 DECLARE
--        변수(초기식)                               변수(초기식)
--      BEGIN                                   BEGIN
--        LOOP                                  LOOP
--          실행할 문장;                             실행할 문장;
--          if(빠져나갈 조건식) then
--             exit;                               exit when 조건식;(빠져나갈 조건식)
--          end if;                                증감식;
--          증감식;                               END LOOP;
--        END LOOP;                            END;
--      END; 
    
-- 1-10까지 출력    
      DECLARE
        i number := 1;
      BEGIN
        LOOP
          dbms_output.put_line('i = '|| i);
          if(i>=10) then
             exit;
          end if;
          i := i+1;
        END LOOP;
      END;    
-- 1-10까지 출력    
      DECLARE
        i number := 1;
      BEGIN
        LOOP
          dbms_output.put_line('i = '|| i);
             exit when (i>=10);
          i := i+1;
        END LOOP;
      END;   
-----------------------------------------------------------------------
--  저장 프로시져  ★시험출제 [or replace]-> 기존껄 지우고 새로 다시 만듬
--  형식) create [or replace] procedure 이름 as
--        begin
--          내용
--        end;

select * from 이상미디어_고객이름;
-- customer 테이블에서 custid가 2인 자료의 이름을 '둘리'로 변경하자
-- 1. 프로시져 생성
    create PROCEDURE ch_name as
    begin
      update customer set name = '둘리' where custid = 2;
    end;
   create PROCEDURE ch_name2 as
    begin
      update customer set name = '둘리' where custid = 2;
    end; 
    select * from customer order by custid;
-- 2. 프로시져 실행 :  EXEC 프로시져이름;
    exec ch_name;
-- 3. 실행 결과 확인
    select * from customer order by custid;
    
-- 외부에서 custid와 이름을 받아서 customer 테이블을 수정하는 프로시져를 만들자
-- 외부에서 정보를 받는다 => 매개변수, 인자 => in(생략가능)
-- 외부로 정보가 나간다 => return        => out
-- 만약에 특정테이블의 데이터 타입을 모를때 : 테이블.컬럼%type
-- create PROCEDURE ch_name3(p_name in customer.name%TYPE, p_custid in customer.custid%TYPE) as 
create PROCEDURE ch_name3(p_name customer.name%TYPE, p_custid customer.custid%TYPE) as 
begin
    update customer set name = p_name where custid = p_custid;
end;

-- 실행
exec ch_name3('임꺽정',1);
exec ch_name3('마이콜',4);
 
-- customer 테이블에 6번 손흥민 대한민국 경기도 000-1414-1414의 정보를 삽입하는 프로시져 생성
 create PROCEDURE ins_customer as
 begin
    insert into customer(custid, name, address, phone)
    values(6,'손흥민','대한민국 경기도','000-8989-8989');
end;
 
-- 실행
exec ins_customer;
select * from customer order by custid; 
 
-- customer 테이블에 번호,이름,주소,전화번호를 입력받는 프로시져 생성(외부로부터 받자)
create PROCEDURE ins_customer2(p_custid customer.custid%TYPE, p_name customer.name%TYPE,
p_addr customer.address%TYPE, p_phone customer.phone%TYPE) as
begin
    insert into customer(custid, name, address, phone)
    values(p_custid, p_name, p_addr, p_phone);
end;
 
exec ins_customer2(7,'이강인',null,null); 
    
-- customer 테이블에서 번호를 받아서 삭제하는 프로시져 생성
create PROCEDURE ins_customer3(p_custid customer.custid%TYPE) as
begin
    delete from customer where custid = p_custid;
end;
exec ins_customer3(3);    
select * from customer order by custid;     
    
-- ** begin ~ end; 블록안에서 사용되는 select문
-- select 컬럼
--   into 저장변수(결과값 저장)
-- from 테이블이름
-- where 조건
-- 특징: where 조건식을 사용하여 결과가 하나만 나오게 하자
--      나온 결과는 into 다음에 있는 저장변수에 저장하자
DECLARE
    v_name customer.name%type;
    v_phone customer.phone%type;
BEGIN
    select name, phone into v_name, v_phone
    from customer
    where custid = 2;
    dbms_output.put_line('customer name : ' || v_name);
    dbms_output.put_line('customer phone : ' || v_phone);
END;
set serveroutput on;    
DECLARE
    v_customer customer%rowtype;
BEGIN
    select * into v_customer
    from customer
    where custid = 2;
    dbms_output.put_line('customer name : ' || v_customer.name);
    dbms_output.put_line('customer phone : ' || v_customer.phone);
    dbms_output.put_line('customer address : ' || v_customer.address);
    dbms_output.put_line('customer custid : ' || v_customer.custid);
END;    
    
-- customer 테이블에 데이터를 입력해서 같은 정보가 있으면 업데이터를, 없으면 삽입을 하자    
--  (기본키는 시퀀스를 가지고 있어야 한다.)
-- 
create or replace procedure chk_customer(p_name customer.name%type,
    p_address customer.address%type, p_phone customer.phone%type
    )as
    cnt number := 0;
begin
    select count(*)
    into cnt
    from customer
    where name = p_name and phone = p_phone;
    if (cnt = 0) then
    --삽입
    insert into customer(custid, name, address, phone)
    values(customer_seq.nextval, p_name, p_address, p_phone);
    else
    --업데이트
    update customer set name =p_name, address =p_address, phone =p_phone where name=p_name and phone=p_phone;
    end if;
end;
select * from customer;
exec chk_customer('둘리','제주도','000-6000-0001');    
exec chk_customer('둘리','울릉도','000-1004-0001');    
    
-- out을 이용해서 프로시져 결과를 내보내기
--  book 테이블에서 저장되어 있는 도서의 평균 가격을 반환하는 프로시져
select avg(price) from book;

create procedure avg_price(avg_val out number) as
begin
    select avg(price)
    into avg_val
    from book
    where price is not null;
end;
-- exec로 실행 안됨
-- exec avg_price();
-- 익명 프로시져로 실행시킨다.
declare
  a_val number;
begin
-- 미리 만들어진 프로시져 호출
    avg_price(a_val);
    dbms_output.put_line('책 평균금액: ' || trunc(a_val));
end;
    
-- bookid를 입력받아서 책이름, 가격을 출력하는 프로시져(방법1)
create procedure book_test01(p_id in book.bookid%type, 
v_name out book.bookname%type, v_price out book.price%type)as
BEGIN
   select bookname, price 
   into v_name, v_price
   from book 
   where bookid = p_id;
END ;

-- exec book_test01(3,);
-- 익명 프로시져 : 1회용
declare
k_book book.bookname%type;
k_price book.price%type;
begin
   -- 프로시져를 호출
    book_test01(3, k_book, k_price);
    dbms_output.put_line('책 이름 : ' || k_book);
    dbms_output.put_line('책 가격 : ' || k_price);
end;
--  bookid를 입력받아서 책이름, 가격을 출력하는 프로시져 (방법2)
create procedure book_test2(v_id book.bookid%type)as
v_name book.bookname%type;
v_price book.price%type;
begin
   select bookname, price 
   into v_name, v_price
   from book 
   where bookid = v_id;
   
    dbms_output.put_line('책 이름 : ' || v_name);
    dbms_output.put_line('책 가격 : ' || v_price);
    
     exception
        WHEN no_data_found then
           dbms_output.put_line('bookid 가 존재하지 않습니다.');
        WHEN others then
          dbms_output.put_line('오류발생');      
end;
-- 실행
exec book_test2(17);