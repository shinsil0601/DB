-- 조인(join) : 2개이상의 테이블을 연결하여 데이터를 검색하는 것
--              일반적으로 외래키를 이용해서 조인한다.
--              연결하려는 테이블간의 속성의 이름이 달라도 되지만 도메인(데이터타입,크기)는 같아야 한다.
--              from절에 검색에 필요한 모든 테이블을 나열
--              where절에 조인 속성 값이 같아야 함을 의미하는 조인조건을 제시
--              별칭을 이용해 SQL 작성하는 것이 좋다.

--내부조인(Inner Join)
-- select A테이블명.컬럼명, A테이블명.컬럼명, B테이블명.컬럼명, B테이블명.컬럼명
-- from A테이블명, B테이블명
-- where A테이블명.컬럼명 = B테이블명.컬럼명
--     *where절에* A테이블명.컬럼명 = B테이블명.컬럼명 이때 컬럼명은 외래키가 기본이다.
--      ** 두테이블이 모드 같은 컬럼명을 가지고 있을때 사용

-- banana 고객이 주문한 제품의 이름을 검색해보자
--  select * from 제품테이블, 주문테이블; --합쳐서 나옴
    select p.제품명 from 제품테이블 p, 주문테이블 r where p.제품번호 = r.주문제품 and 주문고객 = 'banana';
    
-- 나이가 30세 이상인 고객이 주문한 제품의 번호와 주문일자, 고객이름을 검색하자
    select c.고객이름, c.나이, o.주문제품, o.주문일자
    from 고객테이블 c, 주문테이블 o
    where c.고객아이디 = o.주문고객 and c.나이 >= 30;
    
-- 나이가 30세 이상인 고객이 주문한 제품의 번호와 주문일자, 고객이름, 제품명을 검색하자
    select c.고객이름, c.나이, o.주문제품, o.주문일자, p.제품명
    from 고객테이블 c, 주문테이블 o, 제품테이블 p
    where c.고객아이디 = o.주문고객 and o.주문제품 = p.제품번호 and c.나이 >= 30;
    
-- 고명석 고객이 주문한 제품의 제품명을 검색하자
    select p.제품명
    from 고객테이블 c, 주문테이블 o, 제품테이블 p
    where c.고객아이디 = o.주문고객 and o.주문제품 = p.제품번호 and c.고객이름='고명석';
    
-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오 (조인)
    select c.name, o.saleprice from CUSTOMER c, ORDERS o where c.custid = o.custid order by c.name;
-- 고객id로 주문한 모든 도서의 총 판매액을 구하기(group by)
    select custid, sum(saleprice) from ORDERS group by custid;
-- 고객id로 주문한 모든 도서의 총 판매액을 구하고, 고객이름으로 정렬하시오.
    select c.name, sum(o.saleprice)
    from CUSTOMER c, ORDERS o
    where c.custid = o.custid
    group by c.name order by c.name;
-- 고객의 이름과 고객이 주문한 도서의 이름, 주문날짜를 구하시오
    select c.name, b.bookname, o.orderdate
    from CUSTOMER c, ORDERS o, book b
    where c.custid = o.custid and b.bookid = o.bookid
    order by c.name asc;
-- 가격이 20,000원 이상인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
    select c.name, b.bookname, o.orderdate
    from CUSTOMER c, ORDERS o, book b
    where c.custid = o.custid and b.bookid = o.bookid and o.saleprice >= 20000
    order by c.name asc;   
    
-- Inner Join, left join, right join
--형식 select 속성
--    from 테이블1 inner | left | right join 테이블2 on 조인조건
--    [where 검색조건]
    
-- banana 고객이 주문한 제품의 이름을 검색해보자
--  select * from 제품테이블, 주문테이블; --합쳐서 나옴
    select p.제품명 from 제품테이블 p, 주문테이블 r where p.제품번호 = r.주문제품 and 주문고객 = 'banana';
    
    select p.제품명
    from 제품테이블 p inner join 주문테이블 o on p.제품번호 = o.주문제품
    where o.주문고객 = 'banana';
    
-- 나이가 30세 이상인 고객이 주문한 제품의 번호와 주문일자, 고객이름을 검색하자
    select c.고객이름, c.나이, o.주문제품, o.주문일자
    from 고객테이블 c, 주문테이블 o
    where c.고객아이디 = o.주문고객 and c.나이 >= 30;
    
    select c.고객이름, c.나이, o.주문제품, o.주문일자
    from 고객테이블 c inner join 주문테이블 o on c.고객아이디 = o.주문고객
    where c.나이 >= 30;
    
    create table AAA(
    id number PRIMARY key ,
    ename VARCHAR2(50)
);
create table BBB(
    id number PRIMARY key ,
    kname VARCHAR2(50)
);

insert into AAA values(1,'AAA');
insert into AAA values(2,'BBB');
insert into AAA values(3,'CCC');

insert into BBB values(1,'가');
insert into BBB values(2,'나');
insert into BBB values(4,'라');
insert into BBB values(5,'마');
commit;

-- left join : 왼쪽테이블에 있는거 전부
-- select 컬럼명, ... from 테이블1 left join 테이블2 on 조인조건 [where 검색조건];
    select a.id, a.ename, b.kname
    from AAA a left join BBB b on a.id = b.id;
    
-- right join : 오른쪽테이블에 있는거 전부
-- select 컬럼명, ... from 테이블1 right join 테이블2 on 조인조건 [where 검색조건];
    select a.id, a.ename, b.kname
    from AAA a right join BBB b on a.id = b.id; 

-- left조인 위에 right와 같음
    select a.id, a.ename, b.kname
    from BBB b left join AAA a on a.id = b.id; 
    
-- 고객테이블을 기준으로 고객 이름 
    select c.고객이름, o.주문제품, o.주문일자
    from 고객테이블 c left join 주문테이블 o on c.고객아이디 = o.주문고객 order by c.고객이름;
    
-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매 가격을 구하시오
    select c.name, o.saleprice
    from customer c left join orders o on c.custid = o.custid;
    
--------------------------------------------------------------------------------------
-- 서브쿼리 : 쿼리(Query = 질의)안에 쿼리를 작성하는것
-- 단일행 연산자 : 결과가 한줄 => 비교연산자
-- 다중행 연산자 : 결과가 여러줄 => in(or), not in(아닌), any(and), all, exists;

-- book 테이블에서 가장 비싼 도서의 이름을 검색하자
-- 1. 가장 비싼 금액 찾자 :35000
    select max(price) from book;
-- 2. 가격이 35000 인 도서의 이름
    select bookname from book where price = 35000;
    -- 위에 두개를 합친다.
    select bookname from book where price = (select max(price) from book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
--  1. 도서를 구매한 적이 있는 자료를 검색하자 (중복제거)
--  결과: 1,2,3,4 = 4개의 행
    select DISTINCT custid from orders;
    
    select name from customer where custid = 1;
    select name from customer where custid = 2;
    select name from customer where custid = 3;
    select name from customer where custid = 4;
    
    select name from customer where custid in (1,2,3,4);
    -- 서브쿼리(subquery)
    select name from customer where custid in (select DISTINCT custid from orders);
    -- join
    select distinct c.name 
    from customer c, orders o where c.custid = o.custid;
    
-- 이상미디어에서 출판한 도서를 구매한 고객의 이름을 검색하시오
-- 1. 이상미디어의 bookid
    select bookid from book where publisher='이상미디어';  -- 7,8
-- 2. bookid가 7,8 인 custid 찾아서 이름검색하기
    select custid from orders where bookid in (7,8);  --4,4,3
-- 3. custid가 3,4인 고객의 이름 출력     
    select name from customer where custid = 4 or custid = 3;
    select name from customer where custid in (3,4);
    -- subquery
    select name from customer 
    where custid in(select custid from orders
    where bookid in(select bookid from book where publisher='이상미디어'));
    -- join
    select distinct name
    from customer c, orders o, book b
    where c.custid = o.custid and b.bookid = o.bookid and b.publisher ='이상미디어';
    
-- _구로 시작한 책을 구입한 사람이름
--  1. _구로 시작한 책의 bookid
    select bookid from book where bookname like '_구%';
--  2. 1,2,3,7,8 결과값이 나온 사람 custid
    select custid from orders where bookid in (1,2,3,7,8);
--  3. custid(1,1,4,1,4,3)의 고객이름
    select name from customer where custid in(1,1,4,1,4,3);
-- subquery
    select name from customer 
    where custid in(select custid from orders
    where bookid in(select bookid from book where bookname like '_구%'));
-- 평균도서 가격보다 비싼 도서이름
--  1. 도서의 평균가격
    select avg(price) from book;
--  2. 14450보다 비싼 도서의 이름
    select bookname from book where price > 14450;
-- subquery
    select bookname from book
    where price > (select avg(price) from book);
-- 달콤비스킷을 생산한 제조업체가 만든 제품들의 제품명과 단가를 검색
--  1. 달콤비스킷을 생성한 제조업체
    select 제조업체 from 제품테이블 where 제품명 = '달콤비스킷';
--  2.한빛제과가 만든 제품명과 단가
    select 제품명, 단가 from 제품테이블 where 제조업체 = '한빛제과';
-- subquery
    select 제품명, 단가 from 제품테이블
    where 제조업체 = (select 제조업체 from 제품테이블 where 제품명 = '달콤비스킷');
-- 적립금이 가장 많은 고객의 고객이름과 적립금 검색
--  1.가장많은 적립금
    select max(적립금) from 고객테이블;
-- 2. 적립금5000 가진 고객이름,적립금
    select 고객이름, 적립금 from 고객테이블 where 적립금 = 5000;
-- subquery
    select 고객이름, 적립금 from 고객테이블
    where 적립금 = (select max(적립금) from 고객테이블);
    
-- in : 일치하는 것이 있으면 검색 조건이 참
-- not in : 일치하지 않으면 검색 조건이 참
-- exists : 하나라도 존재하면 검색 조건이 참
    
-- banana고객이 주문한 제품의 제품명과 제조업체를 검색
    select 제품명, 제조업체 from 제품테이블
    where 제품번호 in(select 주문제품 from 주문테이블 where 주문고객 = 'banana');
-- banana고객이 주문하지 않은 제품의 제품명과 제조업체를 검색
    select 제품명, 제조업체 from 제품테이블
    where 제품번호 not in(select 주문제품 from 주문테이블 where 주문고객 = 'banana');
-- 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체를 검색해보자
-- 대한식품이 제조한 제품의 단가 (4500,1200)
    select max(단가) from 제품테이블 where 제조업체 = '대한식품';
-- 4500 보다 비싼 제품의 제품명, 단가, 제조업체를 검색해보자
    select 제품명, 단가, 제조업체 from 제품테이블
    where 단가 > 4500;
-- subquery
    select 제품명, 단가, 제조업체 from 제품테이블
    where 단가 > (select max(단가) from 제품테이블 where 제조업체 = '대한식품');
    
-- subquery(ALL(and : 주어진 조건을 모두 만족해야 참)
--         (in (or : 주어진 조건 중 하나라도 만족하면 참)
    select 제품명, 단가, 제조업체 from 제품테이블
    where 단가 > ALL(select 단가 from 제품테이블 where 제조업체 = '대한식품');
                        -- all (4500, 1200)
-- 2022년3월15일 제품을 주문한 고객의 고객이름을 검색해보자
-- 제품테이블에서 2022년3월15일 제품을 주문한 고객; apple
    select 주문고객 from 주문테이블 where 주문일자 = '2022-3-15';
-- 고객테이블에서 apple의 고객이름 검색
    select 고객이름 from 고객테이블 where 고객아이디 = 'apple';
-- subquery
    select 고객이름 from 고객테이블 where 고객아이디 = (select 주문고객 from 주문테이블 where 주문일자 = '2022-3-15');
    
-- 2022년3월15일 제품을 주문하지 않은 고객의 고객이름을 검색해보자
    -- subquery
    select 고객이름 from 고객테이블 where 고객아이디 != (select 주문고객 from 주문테이블 where 주문일자 = '2022-3-15');