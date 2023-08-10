-- 함수(function) : 프로시져와 비슷하지만 반드시 return 예약어를 사용
--                  보통 일반 SQL문에서 호출해서 사용 (컬럼을 가공하여 변환)

-- 형식)  create function 이름()              create procedure 이름() as     
--        return dataType                    begin 
--        as                                      실행문(sql문)
--        변수;
--        begin                              end; 
--        실행문(sql문);
--        return 리턴되는 값 또는 가지고 있는 변수;
--        end;
--      보통 일반 SQL문에서 호출                -- exec 프로시져이름 또는 익명프로시져에서 호출

-- 판매된 도서에 대한 이익을 계산하는 함수(f_interest)
-- 가격이 20,000이상이면 10%,  20,000미만이면 5%
   create function f_interest(f_price orders.saleprice%type)
   return number
   as
   my_price number ; -- 결과를 저장할때 사용하는 변수
   begin
     if f_price >= 20000 then
        my_price := f_price * 0.1;
     else
        my_price := f_price * 0.05;
     end if;
     return my_price;
   end;

-- 삭제   
-- drop FUNCTION f_interest ;

-- 실행 : 일반 SQL문에서 호출가능
select * from orders ;
select * , f_interest(saleprice) as 순이익 from orders o;
select sum( f_interest(saleprice)) as 총_순이익 from orders o;
   
-- 날짜 변경하는 함수
create function d_format(fd orders.orderdate%type)
return varchar2 
as
f_date varchar2(50);
begin
  f_date := to_char(fd, 'yyyy"년" mm"월" dd"일"');
  return f_date;
end;

select o.*, d_format(o.orderdate) from orders o;

-- 날짜에 유통기간을 5일로 지정하여 유통기간 날짜를 보는 함수를 만들자.
create function d_format2(fd orders.orderdate%type)
return varchar2 
as
f_date varchar2(50);
begin
  f_date := to_char(fd+5, 'yyyy"년" mm"월" dd"일"');
  return f_date;
end;  
  select o.*, d_format(o.orderdate) 생성날짜, d_format2(o.orderdate) as 유통기간 from orders o; 
   
--------------------------------------------------------------------------------------------------
-- 커서(cursor) : 실행결과 테이블을 한번에 한 행씩 처리하기 위해서 
--                결과 테이블의 행을 순서대로 가리키는데 사용

-- 암시적(묵시적)커서 : 자동으로 열림과 닫힘, 데이터처리가 이루어진다.
-- 명시적 커서 : 수동으로 개발자에 의해서 열림, 닫힘, 데이터처리가 이루어진다.
-- 커서와 관련된 키워드
  -- cursor 커서이름 is 커서정의(보통은 select문)  => 커서 생성 
  -- open   커서이름             => 커서 사용 시작
  -- fetch 커서이름 into 변수     => 행 데이터를 가져옴
  -- close 커서이름              => 커서 사용 종료
  -- rowcount : 행의 수
  -- isopen : 암시적일때 항상 false
  --          명시적일때 열림을 알아보는 명령어
  -- found : 결과가 하나 이상 일때 true
  -- not found :  결과가 하나도 없는 경우 true
  
  -- 암시적 커서 
  create PROCEDURE cursor_test(c_id  book.bookid%type)
  as
  c_name book.bookname%type;
  c_price book.price%type;
  begin
    select bookname, price into c_name, c_price
    from book where bookid = c_id;

    if sql%found then
        dbms_output.put_line('책 이름 : ' || c_name);
        dbms_output.put_line('책 가격 : ' || c_price);
        dbms_output.put_line('결과 : ' || sql%rowcount);
    end if;
    exception
        when no_data_found then
            dbms_output.put_line('bookid 가 존재하지 않습니다.');
        when others then     
            dbms_output.put_line('오류발생');
  end ;
  exec cursor_test(11);
  
  -- 명시적 커서 
  create PROCEDURE cursor_test2 
  as
  -- 커서 생성
   cursor cur is select bookname from book; 
   -- 커서의 결과 기억하는 변수
   c_name book.bookname%type;
  begin
     open cur;
         loop
               fetch cur into c_name;
                exit when cur%notfound ;
               dbms_output.put_line(c_name);
          end loop;
     close cur;
  end ;
  
  exec cursor_test2;

  create PROCEDURE cursor_test3(c_id book.bookid%type)
  as
  -- 줄 전체 타입
  cur_row book%rowtype;
  -- 커서 생성
  cursor cur is select * from book where bookid = c_id;
  begin
    open cur;
        loop
            fetch cur into cur_row;
            exit when cur%notfound;
            dbms_output.put_line('책 이름 : ' || cur_row.bookname);
            dbms_output.put_line('책 가격 : ' || cur_row.price);
        end loop;
    close cur;
  end;
  
 exec  cursor_test3(3);
  
------------------------------------------------------------------------
-- 트리거 : 자동실행 기능
--         호출해서 실행하는 것이 아님
--         특정이벤트가 발생하면 자동으로 추가 이벤트가 실행됨
--         특정이벤트 : insert, update, delete
-- 형식)  create trigger  이름 before|after
--        트리거 이벤트 on 타켓 테이블 이름
--        [ for each row ]
--        [ when 조건절 ]
--        begin
--              실행;
--        end ;

--     for each row : 영향을 받는 각 행에 대해 트리거를 실행 시킬 때 사용

-- 주의사항)  insert 경우  입력되는 데이터가 :new 에 저장된다.
--           delete 경우  삭제되는 데이터가 :old에 저장된다.
--           update 경우  변경 전 :old,  변경 후 :new 에 저장된다.
--           begin ~ end ; 를 벗어나면  new, old 로 사용된다.

-- 트리거 삭제 : drop trigger 이름

create trigger t_test after
insert on customer
for each row
begin
    dbms_output.put_line(:new.name || '삽입성공');
end;

-- 실행은 호출하는 것이 아니다.
select * from customer order by custid;

insert into customer(custid, name, address, phone)
values(customer_seq.nextval, '손흥민', '영국 토트넘',  '000-1111-7777');

create trigger t_test2 after
update on customer
for each row
begin
    dbms_output.put_line('변경 전 이름 : ' || :old.name );
    dbms_output.put_line('변경 후 이름 : ' || :new.name );
end;

-- 실행은 호출하는 것이 아니다.
select * from customer order by custid;
select * from customer_del order by custid;

update customer set name = '이강인', address = '스페인 마요르카' where custid = 21 ;

-- customer에 삭제된 인원은 customer_del 에 정보를 넣어주자.

-- customer 테이블과 같은 구조의 customer_del 테이블을 만들자 (구조만 복사)
create table customer_del as select * from customer where 1 = 0 ;
-- customer_del테이블에  삭제 날짜를 기억하는 컬럼을 추가하자.
alter table customer_del add del_date date ;

create trigger t_test3 after
delete on customer
for each row
begin
    insert into customer_del(custid, name, address, phone, del_date)
    values(:old.custid, :old.name, :old.address, :old.phone, sysdate);
end;

delete from customer where custid = 2 ;
select * from customer;
select * from customer_del ;