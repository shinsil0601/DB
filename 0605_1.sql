           -- 만들어진 테이블에 primary key 추가
alter table 고객테이블 ADD primary key(고객아이디);

-- 만들어진 테이블을 가지고 외래키를 만들자.
-- alter table 테이블이름 add constraint fk명 FOREIGN key (컬럼명)
-- REFERENCES pk가 위한 테이블명(컬럼명);

    alter table 주문테이블 add CONSTRAINT fk_주문고객 FOREIGN KEY (주문고객)
     REFERENCES 고객테이블(고객아이디);
     
    alter table 주문테이블 add CONSTRAINT fk_주문제품 FOREIGN KEY (주문제품)
     REFERENCES 제품테이블(제품번호);
     
-- FK를 적용하면 마음대로 삽입/ 삭제할 수 없다.
-- 무결성 제약조건에 위배됨 - 부모키가 없습니다.
    insert into 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    values('o11', 'banana', 'p07', 15, '제주도', '2022-06-01');
    commit;
   -- insert into 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    -- values('o12', 'banana2', 'p07', 15, '제주도', '2022-06-01'); --주문고객 무결성제약조건 위배됨
    -- insert into 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    -- values('o12', 'banana2', 'p10', 15, '제주도', '2022-06-01'); --주문제품 무결성제약조건 위배됨
    select * from 주문테이블;
    
--ORA-02292: 무결성 제약조건(C##SHINSIL.FK_주문고객)이 위배되었습니다- 자식 레코드가 발견되었습니다
delete from 고객테이블 where 고객아이디 = 'apple';
delete from 제품테이블 where 제품번호 = 'p03';
-- 삭제가능: 주문테이블에서 참조하지 않았으므로 삭제 가능
delete from 제품테이블 where 제품번호 = 'p05';

--  rownum : 오라클 내부에서 생성하는 가상 컬럼, SQL 조회 결과의 순번을 나타냄
    select rownum, k.* from(select * from 고객테이블) k where rownum between 1 and 3;
     
     
    CREATE TABLE CLIENTINFO (
    NAME VARCHAR2(20),
    AGE NUMBER -- 나이는 0 보다 크고 150 보다는 작다 
        CONSTRAINT CHECK_AGE CHECK(AGE > 0 AND AGE < 150),
    GENDER VARCHAR2(3) -- 성별은 알파벳 M 또는 W로 입력 받는다.
        CONSTRAINT CHECK_GENDER CHECK(GENDER IN('M', 'W')),
    INFONO NUMBER -- 정보번호는 INFO 테이블의 기본키다.
        CONSTRAINT PK_INFONO PRIMARY KEY
);

INSERT INTO CLIENTINFO VALUES('홍길동', 30, 'M', 1);
INSERT INTO CLIENTINFO VALUES('홍숙이', 20, 'W', 2);
INSERT INTO CLIENTINFO VALUES('김강', 25, 'M', 3);
INSERT INTO CLIENTINFO VALUES('박홍길', 40, 'M', 4);
INSERT INTO CLIENTINFO VALUES('원빈', 44, 'M', 5);
INSERT INTO CLIENTINFO VALUES('이나영', 42, 'W', 6);

-- 왜래키 만들 테이블
create table CLIENTJOIN(
    ID VARCHAR2(40) NOT NULL PRIMARY KEY,
    PW VARCHAR2(40),
    INFONO NUMBER,
    CONSTRAINT FK_INFONO FOREIGN KEY(INFONO)REFERENCES CLIENTINFO (INFONO)
);

-- 외래키 만들 테이블 
INSERT INTO CLIENTJOIN VALUES( '최강길동88', '12345', 1);
INSERT INTO CLIENTJOIN VALUES( '숙숙숙KK', '12345', 2);
INSERT INTO CLIENTJOIN VALUES( 'RLARKD', '12345', 3);
INSERT INTO CLIENTJOIN VALUES( 'PARK123', '12345', 4);
INSERT INTO CLIENTJOIN VALUES( '잘생긴빈이', '12345', 5);
INSERT INTO CLIENTJOIN VALUES( '어여쁜영이', '12345', 6);
COMMIT;

----------------------------------------------------------------------------
-- 날짜 시간함수
--1. sysdate : 오라클에서 지원하는 시스템상의 오늘 날짜 반환하는 함수, 연산가능
-- select sysdate -1 as 날짜, '어제' as 기준 from dual;
-- select sysdate as 날짜, '오늘' as 기준 from dual;
-- select sysdate +1 as 날짜, '내일' as 기준 from dual;
--한줄에 다쓰기
select sysdate -1 as 어제, sysdate as 오늘, sysdate +1 as 내일 from dual;

-- 2. to_date(문자열): 문자열 데이터를 날짜형 데이터로 변경
select sysdate from dual;
--select sysdate - '2023-06-01' from dual;-- 오류남
select trunc(sysdate - to_date('2023-06-01')) from dual;

-- 3. to_char('날짜', '날짜형'): 날짜형 데이터를 문자형 데이터로 변경
select to_char(to_date('2023-06-05', 'yyyy-mm-dd'),'yyyy-mm-dd') from dual;

-- 4. ADD_MONTHS(date, 숫자): 날짜형의 날짜에서 지정한 달만큼 더함(1: 다음달, -1: 지난달)
select sysdate, add_months(sysdate,4), add_months(sysdate,-4) from dual;

-- 5. last_day(date): 해당 달의 마지막 날짜 
select last_day(sysdate), last_day(add_months(sysdate,4)), last_day(add_months(sysdate,3)) from dual;

-- 6. 해당요일에 가장 가까운 날짜(미래): next-day(날짜,'요일')
select sysdate, next_day(sysdate, '토요일'), next_day(sysdate, '수요일') from dual;

-- 7. 기간 구하기: month_between(끝날짜, 시작날짜) : 월단위
select months_between(sysdate, '2023/01/01') from dual;
select trunc(months_between(sysdate, '2023/01/01')) from dual;





