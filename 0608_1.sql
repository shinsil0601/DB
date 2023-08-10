-- PL/SQL : ����Ŭ���� �����ϴ� ���α׷��� ����� Ư���� ������ SQL�� Ȯ��
--          SQL�� ������ + ���(if, loop, for)�� ���
--          ������ ���α׷��� �����ϰ� �ϴ� ����Ŭ SQL ������
-- ����: http://www.tutorialspoint.com/plsql/index.htm

-- 1. ���ν���: return ���� ������� �ʴ� �Լ��� ����
--            �۾������� ������ ������ ���α׷��� ���� ����
--            ����� ������ �ǵ��ư����� out ���� ����ؾ��Ѵ�.
--   �⺻����: [������], ������, [������]
--    1.������: DECLARE
--              ��������;
--    2.������: BEGIN
--             SQL �����...;
--    3.������: EXCEPTION  =>(���� �Ⱦ���)
--         ��: ~ END;

-- Hello, World! ����ϱ�
-- (�ڹ�)String msg = "hello, world!" -> (sql)msg varchar2(50) := 'hello, world!'
-- System.out.println(����)   -> dbms_output.put_line(����);
--         ��, dbms_output.put_line(); ����ϱ� ���ؼ��� set serveroutput on; ���� �������

-- 1) �͸� ���ν���: ��ȸ��, ������� �ʴ´�.
    set serveroutput on;
    DECLARE
        msg VARCHAR2(50) := 'hello, world!';
    BEGIN
    dbms_output.put_line(msg);
    END;
    
-- �͸� ���ν����� Ȱ���� ��� ����
-- 1) ����  if  ���ǽ� then
--            ������ ���̸� ������ ����;
--         end if;

-- ���� i�� 10�̻� �̸� ������ ���� ������� (������� �����ؾ� ��µ�)
    DECLARE
      i number := 24;
    BEGIN
      if (i >= 10) then
        dbms_output.put_line('i��'|| i ||'�̴�.');
      end if;
    END;
    
-- 2)���� if ���ǽ� then
--        ������ ���̸� ������ ����;
--       else
--        ������ �����̸� ������ ����;
--       end if;

--  ���� i�� Ȧ������ ¦������ �Ǻ��ϴ� �͸� ���ν���
    DECLARE
        i number :=48;
    BEGIN
        if(mod(i,2)=0) then
          dbms_output.put_line('i��'|| i ||'¦���̴�.');
        else
          dbms_output.put_line('i��'|| i ||'Ȧ���̴�.');
        end if;
    END;
--   
    DECLARE
        i number := 48;
        res varchar2(50);
    BEGIN
        if(mod(i,2)=0) then
          res := '¦��';
        else
          res := 'Ȧ��';
        end if;
          dbms_output.put_line('i��'|| i ||'��' || res ||'�̴�');
    END;
    
-- 3)���� if ���ǽ� then
--         ���๮;
--       elsif ���ǽ� then
--         ���๮;
--       elsif ���ǽ� then
--         ���๮;
--       [else ���๮; ] =>��������
--       end if;
    
    DECLARE
        i int := 80;
        hak varchar2(50);
    BEGIN
        if (i>=90) THEN
        hak := 'A����';
    ELSIF (i>=80) THEN
        hak := 'B����';
    ELSIF (i>=70) THEN
        hak := 'C����';
    ELSE hak := 'F����';
    END IF;
    dbms_output.put_line('������'|| hak ||'�Դϴ�');
    END;
    
-- �ݺ���: for��, while��, loop��
--  1) for��
--      for ���� in �ʱⰪ .. ������ loop
--          �ݺ������� ����(SQL��)
--      end loop;

-- 1-10���� ����ϴ� ���ν���
    DECLARE
        i number;
    BEGIN
        for i in 1 .. 10 loop
            dbms_output.put_line('i��'|| i);
        end loop;
    END;
--    
    DECLARE
     BEGIN
        for cnt in 11 .. 20 loop
            dbms_output.put_line('cnt��'|| cnt);
        end loop;
    END;
-- 1-10���� ¦���� ���
    DECLARE
    BEGIN
    for cnt in 1 .. 10 loop
         if(mod(cnt,2)=0) then
         dbms_output.put_line('1-10���� ¦����'|| cnt);
         end if;
        end loop;
    END;
-- 1-10���� ¦���� �� ���
    DECLARE
      i number :=0;  --�ʱⰪ���� �� ������!!
    BEGIN
    for cnt in 1 .. 10 loop
         if(mod(cnt,2)=0) then
          i := i+cnt;
         end if;
        end loop;
        dbms_output.put_line('¦���� ���� '|| i);
    END;    
    
-- 2) while��
--      DECLARE
--        ����(�ʱ��)
--      BEGIN
--        WHILE ���ǽ� LOOP
--          ������ ����;
--          ������;
--        END LOOP;
--      END;
    
-- 1-10���� ���
    DECLARE
       i NUMBER := 1;
    BEGIN
       WHILE i < 11 LOOP
        dbms_output.put_line('i��'|| i);
         i := i+1;
        END LOOP;
    END;
-- 1-10���� ¦���� ���
    DECLARE
       i NUMBER := 1;
    BEGIN
       WHILE i < 11 LOOP
        if(mod(i,2)=0) then
        dbms_output.put_line('¦����'|| i);
         end if;
         i := i+1;
        END LOOP;
    END;
-- 1-10���� ¦���� �� ���
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
        dbms_output.put_line('¦���� ���� '|| cnt);
    END;
    
-- 3) loop
--      DECLARE                                 DECLARE
--        ����(�ʱ��)                               ����(�ʱ��)
--      BEGIN                                   BEGIN
--        LOOP                                  LOOP
--          ������ ����;                             ������ ����;
--          if(�������� ���ǽ�) then
--             exit;                               exit when ���ǽ�;(�������� ���ǽ�)
--          end if;                                ������;
--          ������;                               END LOOP;
--        END LOOP;                            END;
--      END; 
    
-- 1-10���� ���    
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
-- 1-10���� ���    
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
--  ���� ���ν���  �ڽ������� [or replace]-> ������ ����� ���� �ٽ� ����
--  ����) create [or replace] procedure �̸� as
--        begin
--          ����
--        end;

select * from �̻�̵��_���̸�;
-- customer ���̺��� custid�� 2�� �ڷ��� �̸��� '�Ѹ�'�� ��������
-- 1. ���ν��� ����
    create PROCEDURE ch_name as
    begin
      update customer set name = '�Ѹ�' where custid = 2;
    end;
   create PROCEDURE ch_name2 as
    begin
      update customer set name = '�Ѹ�' where custid = 2;
    end; 
    select * from customer order by custid;
-- 2. ���ν��� ���� :  EXEC ���ν����̸�;
    exec ch_name;
-- 3. ���� ��� Ȯ��
    select * from customer order by custid;
    
-- �ܺο��� custid�� �̸��� �޾Ƽ� customer ���̺��� �����ϴ� ���ν����� ������
-- �ܺο��� ������ �޴´� => �Ű�����, ���� => in(��������)
-- �ܺη� ������ ������ => return        => out
-- ���࿡ Ư�����̺��� ������ Ÿ���� �𸦶� : ���̺�.�÷�%type
-- create PROCEDURE ch_name3(p_name in customer.name%TYPE, p_custid in customer.custid%TYPE) as 
create PROCEDURE ch_name3(p_name customer.name%TYPE, p_custid customer.custid%TYPE) as 
begin
    update customer set name = p_name where custid = p_custid;
end;

-- ����
exec ch_name3('�Ӳ���',1);
exec ch_name3('������',4);
 
-- customer ���̺� 6�� ����� ���ѹα� ��⵵ 000-1414-1414�� ������ �����ϴ� ���ν��� ����
 create PROCEDURE ins_customer as
 begin
    insert into customer(custid, name, address, phone)
    values(6,'�����','���ѹα� ��⵵','000-8989-8989');
end;
 
-- ����
exec ins_customer;
select * from customer order by custid; 
 
-- customer ���̺� ��ȣ,�̸�,�ּ�,��ȭ��ȣ�� �Է¹޴� ���ν��� ����(�ܺηκ��� ����)
create PROCEDURE ins_customer2(p_custid customer.custid%TYPE, p_name customer.name%TYPE,
p_addr customer.address%TYPE, p_phone customer.phone%TYPE) as
begin
    insert into customer(custid, name, address, phone)
    values(p_custid, p_name, p_addr, p_phone);
end;
 
exec ins_customer2(7,'�̰���',null,null); 
    
-- customer ���̺��� ��ȣ�� �޾Ƽ� �����ϴ� ���ν��� ����
create PROCEDURE ins_customer3(p_custid customer.custid%TYPE) as
begin
    delete from customer where custid = p_custid;
end;
exec ins_customer3(3);    
select * from customer order by custid;     
    
-- ** begin ~ end; ��Ͼȿ��� ���Ǵ� select��
-- select �÷�
--   into ���庯��(����� ����)
-- from ���̺��̸�
-- where ����
-- Ư¡: where ���ǽ��� ����Ͽ� ����� �ϳ��� ������ ����
--      ���� ����� into ������ �ִ� ���庯���� ��������
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
    
-- customer ���̺� �����͸� �Է��ؼ� ���� ������ ������ �������͸�, ������ ������ ����    
--  (�⺻Ű�� �������� ������ �־�� �Ѵ�.)
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
    --����
    insert into customer(custid, name, address, phone)
    values(customer_seq.nextval, p_name, p_address, p_phone);
    else
    --������Ʈ
    update customer set name =p_name, address =p_address, phone =p_phone where name=p_name and phone=p_phone;
    end if;
end;
select * from customer;
exec chk_customer('�Ѹ�','���ֵ�','000-6000-0001');    
exec chk_customer('�Ѹ�','�︪��','000-1004-0001');    
    
-- out�� �̿��ؼ� ���ν��� ����� ��������
--  book ���̺��� ����Ǿ� �ִ� ������ ��� ������ ��ȯ�ϴ� ���ν���
select avg(price) from book;

create procedure avg_price(avg_val out number) as
begin
    select avg(price)
    into avg_val
    from book
    where price is not null;
end;
-- exec�� ���� �ȵ�
-- exec avg_price();
-- �͸� ���ν����� �����Ų��.
declare
  a_val number;
begin
-- �̸� ������� ���ν��� ȣ��
    avg_price(a_val);
    dbms_output.put_line('å ��ձݾ�: ' || trunc(a_val));
end;
    
-- bookid�� �Է¹޾Ƽ� å�̸�, ������ ����ϴ� ���ν���(���1)
create procedure book_test01(p_id in book.bookid%type, 
v_name out book.bookname%type, v_price out book.price%type)as
BEGIN
   select bookname, price 
   into v_name, v_price
   from book 
   where bookid = p_id;
END ;

-- exec book_test01(3,);
-- �͸� ���ν��� : 1ȸ��
declare
k_book book.bookname%type;
k_price book.price%type;
begin
   -- ���ν����� ȣ��
    book_test01(3, k_book, k_price);
    dbms_output.put_line('å �̸� : ' || k_book);
    dbms_output.put_line('å ���� : ' || k_price);
end;
--  bookid�� �Է¹޾Ƽ� å�̸�, ������ ����ϴ� ���ν��� (���2)
create procedure book_test2(v_id book.bookid%type)as
v_name book.bookname%type;
v_price book.price%type;
begin
   select bookname, price 
   into v_name, v_price
   from book 
   where bookid = v_id;
   
    dbms_output.put_line('å �̸� : ' || v_name);
    dbms_output.put_line('å ���� : ' || v_price);
    
     exception
        WHEN no_data_found then
           dbms_output.put_line('bookid �� �������� �ʽ��ϴ�.');
        WHEN others then
          dbms_output.put_line('�����߻�');      
end;
-- ����
exec book_test2(17);