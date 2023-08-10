    -- 조작어(DML): 삽입(INSERT ~ INTO), 삭제(DELETE FROM), 수정(UPDATE ~ SET), 검색(SELECT ~FROM)
    -- 제어어(DCL): GRANT, REVOKE, COMMIT, ROLLBACK
    -- COMMIT: 현재 상태를 DB에 적용(저장)
    -- ROLLBACK: COMMIT 이전상태로 되돌린다.
    -- COMMIT - 작업1 - 작업2 - 작업3 - COMMIT - 작업4 - 작업5 -COMMIT - ROLLBACK(작업4, 작업5 이전상태로 되돌린다.)

    -- 데이터 삽입(INSERT INTO ~ VALUES ~ )
    -- 방법1) INSERT INTO 테이블이름 VALUES (값1,값2,값3...값4);
    -- 값은 순서대로 모두 채워야 한다.
    -- 모두 채우지 않으면 오류이다.
    -- 값을 넣기 싫으면 NULL을 넣을 수 있다.
    -- 단, 속성 NOT NULL이면 값이 무조건 있어야 한다.
    -- 날짜와 문자는 반드시 '' 사용
    -- SYSDATE는 오늘 날짜를 뜻하는 오라클 명령어이다.
    INSERT INTO MEMBER01 
    VALUES(4, 'KIM', 'K111', '김돌리', 24, SYSDATE, 02, '서울');

    --INSERT INTO MEMBER01 
    --VALUES(5, 'KIM', 'K111', '김돌리');

    INSERT INTO MEMBER01 
    VALUES(5, 'KIM', 'K111', '김돌리', 24, SYSDATE, NULL, NULL);

    INSERT INTO MEMBER01 
    VALUES(6, 'KIM', 'K111', '김돌리', 24, '2023/01/22', 02, '서울');

    -- 방법2) INSERT INTO 테일블명(컬럼명1, 컬럼명2,...)
    -- VALUES (컬럼명1의 값, 컬럼명2의 값,...)
    -- 컬럼명과 들어갈 값은 반드시 1:1 매칭
    -- 속성이 NOT NULL인 경우 반드시 넣어야 된다.
    INSERT INTO MEMBER01(ID)
    VALUES(7);
    
    -- 고객테이블 삽입하기
    INSERT INTO 고객테이블 VALUES('apple', '정소화', 20, 'gold', '학생', 1000);
    INSERT INTO 고객테이블 VALUES('apple', '정소화', 20, 'gold', '학생', 1000);
    INSERT INTO 고객테이블 VALUES('apple', '정소화', 20, 'gold', '학생', 1000);
    INSERT INTO 고객테이블 VALUES('apple', '정소화', 20, 'gold', '학생', 1000);
    INSERT INTO 고객테이블 VALUES('apple', '정소화', 20, 'gold', '학생', 1000);
    INSERT INTO 고객테이블 VALUES('apple', '정소화', 20, 'gold', '학생', 1000);
    INSERT INTO 고객테이블 VALUES('peach', '오형준',  'gold', '학생', 1000);
    INSERT INTO 고객테이블 VALUES('peach', '오형준',null, 'gold', '학생', 1000);
    select * from 고객테이블;
    commit;
    INSERT INTO 고객테이블(고객아이디, 고객이름, 등급, 직업, 적립금)
    VALUES('peach1', '오형준1', 'silver1', '의사1', 3001);
    ALTER TABLE 고객테이블 RENAME COLUMN 직엽 TO 직업;
    
    CREATE TABLE 제품테이블(
    제품번호 VARCHAR2(50) NOT NULL PRIMARY KEY,
    제품명 VARCHAR2(50),
    재고량 VARCHAR2(50),
    단가 VARCHAR2(50),
    제조업체 VARCHAR2(50)
    );
    
    INSERT INTO 제품테이블(제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES('P01', '그냥만두', 5000, 4500, '대한식품');
    INSERT INTO 제품테이블(제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES('P02', '매운쫄면', 2500, 5500, '민국푸드');
    INSERT INTO 제품테이블(제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES('P03', '쿵떡파이', 3600, 2600, '한빛제과');
    INSERT INTO 제품테이블(제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES('P04', '맛난초콜릿', 1250, 2500, '한빛제과');
    INSERT INTO 제품테이블(제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES('P05', '얼큰라면', 2200, 1200, '대한식품');
    INSERT INTO 제품테이블(제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES('P06', '통통우동', 1000, 1550, '민국푸드');
    INSERT INTO 제품테이블(제품번호, 제품명, 재고량, 단가, 제조업체)
    VALUES('P07', '달콤비스킷', 1650, 1500, '한빛제과');
    
    CREATE TABLE 주문테이블(
    주문번호 VARCHAR2(50) NOT NULL PRIMARY KEY,
    주문고객 VARCHAR2(50),
    주문제품 VARCHAR2(50),
    수량 NUMBER,
    배송지 VARCHAR2(50),
    주문일자 DATE
    );
    
    INSERT INTO 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES('o01', 'apple', 'p03', 10, '서울시 마포구', '2022-01-01');
    INSERT INTO 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES('o02', 'melon', 'p01', 5, '인천시 계양구', '2022-01-10');
    INSERT INTO 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES('o03', 'banana', 'p06', 45, '경기도 부천시', '2022-01-11');
    INSERT INTO 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES('o04', 'carrot', 'p02', 8, '부산시 금정구', '2022-02-01');
    INSERT INTO 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES('o05', 'melon', 'p06', 36, '경기도 용인시', '2022-02-20');
    INSERT INTO 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES('o06', 'banana', 'p01', 19, '충청북도 보은군', '2022-03-02');
    INSERT INTO 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES('o07', 'apple', 'p03', 22, '서울시 영등포구', '2022-03-15');
    INSERT INTO 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES('o08', 'pear', 'p02', 50, '강원도 춘천시', '2022-04-10');
    INSERT INTO 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES('o09', 'banana', 'p04', 15, '전라남도 목포시', '2022-04-11');
    INSERT INTO 주문테이블(주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자)
    VALUES('o10', 'carrot', 'p03', 20, '경기도 안양시', '2022-05-22');
    commit;
    
    --수정, 삭제는 반드시 조건식을 넣어야 한다.
    -- 조건식을 넣지 않으면 전체가 삭제되거나 전체가 수정된다.
    
    -- 데이터삭제(delete from 테이블이름 [where 조건식]);
       -- 조건식이 있으면 조건식이 참인 것만 삭제된다.
       -- 조건식이 없으면 전체가 삭제된다.
       -- 조건식( 컬럼명 비교연산자 또는 논리연산자)
       delete from 고객테이블; --전체삭제 됨
       select *from 고객테이블;  
       --제조업체가 '한빛제과'인 행만 삭제
       delete from 제품테이블 where 제조업체 = '한빛제과';  --항상 컬럼명(제목)은 왼쪽에 온다
       select *from 제품테이블;
       --제조업체가 '민국푸드'이면서 단가가 3000원 이하인 행만 삭제
       delete from 제품테이블 where 제조업체 = '민국푸드' and 단가 <= 3000;
       rollback;  --삭제하기 전으로 돌아감
       
    --데이터수정 (update 테이블이름 set 변경내용 [where 조건식]);
      -- 조건식이 있으면 조건식이 참인 것만 수정된다.
      -- 조건식이 없으면 전체가 수정된다.
      
      -- 제조업체를 대한푸드로 수정
      update 제품테이블 set 제조업체 = '대한푸드';
      -- 제조업체를 한빛제과로 수정 단, 단가가 2000이상인 행만 수정
      update 제품테이블 set 제조업체 = '한빛제과' where 단가 >=2000;
      -- 제조업체를 대한제품, 재고량=10000으로 수정 단, 제품번호가 p01 또는 p05 행만 수정
      update 제품테이블 set 제조업체 = '대한식품', 재고량 = 10000 where 제품번호 = 'P01' or 제품번호 = 'P05';
      select *from 제품테이블;
      -- 제품테이블에서 제품번호가 P03인 제품의 제품명을 통큰파이로 수정하자
      update 제품테이블 set 제품명 = '통큰파이' where 제품번호 = 'P03';
      -- 제품테이블에 있는 모든 제품의 단가를 10% 인상해보자(컬럼이 숫자이면 산술연산이 가능)
      update 제품테이블 set 단가 = 단가 * 1.1;
      
      select * from 주문테이블;
      --주문테이블에서 주문일자가 2022-05-22인 주문내역을 삭제하자
      delete from 주문테이블 where 주문일자 = '2022-05-22';
      --주문테이블에서 주문일자가 2022-03 ~ 2022-04인 주문내역을 삭제하자(날짜컬럼 연산 가능)
      delete from 주문테이블 where 주문일자>='2022-03-01' and 주문일자 <= '2022-04-30';
      -- 주문테이블의 주문일자를 모두 5일씩 추가하자.
      update 주문테이블 set 주문일자 = 주문일자 +5;
      --주문테이블에서 '정소화'고객이 주문한 제품의 주문 수량을 5개로 수정해보자 (select문 사용: 쿼리안에 쿼리넣기)
      commit;