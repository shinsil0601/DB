CREATE TABLE MEMBER01(
    IDX NUMBER NOT NULL PRIMARY KEY,
    M_ID VARCHAR2(50),  /*()값을 꼭 넣어줌*/
    M_PW VARCHAR2(50),
    M_NAME VARCHAR2(50),
    M_AGE NUMBER(3),
    M_REG DATE
    );  /*세미콜론 옆에서 CTRL+ENTER*/
    
CREATE TABLE MEMBER02(
    IDX NUMBER NOT NULL,
    M_ID VARCHAR2(50),  /*()값을 꼭 넣어줌*/
    M_PW VARCHAR2(50),
    M_NAME VARCHAR2(50),
    M_AGE NUMBER(3),
    M_REG DATE,
    PRIMARY KEY(IDX)
    );  /*세미콜론 옆에서 CTRL+ENTER*/
    
CREATE TABLE MEMBER03(
    IDX NUMBER NOT NULL PRIMARY KEY,
    M_ID VARCHAR2(50) NOT NULL PRIMARY KEY,  /*()값을 꼭 넣어줌*/
    M_PW VARCHAR2(50),
    M_NAME VARCHAR2(50),
    M_AGE NUMBER(3),
    M_REG DATE
    );  /*세미콜론 옆에서 CTRL+ENTER*/
    
CREATE TABLE MEMBER04(
    IDX NUMBER NOT NULL,
    M_ID VARCHAR2(50) NOT NULL,  /*()값을 꼭 넣어줌*/
    M_PW VARCHAR2(50),
    M_NAME VARCHAR2(50),
    M_AGE NUMBER(3),
    M_REG DATE,
    PRIMARY KEY(IDX, M_ID)
    );  /*세미콜론 옆에서 CTRL+ENTER*/
    
    --MEMBER02, MEMBER04 테이블 삭제
    DROP TABLE MEMBER02;
    DROP TABLE MEMBER04;
    
    --테이블 복사
    --MEMBER01 테이블의 구조와 데이터(내용)을 복사해서 C_MOM01 테이블을 만들자
    CREATE TABLE C_MEM01 AS SELECT * FROM MEMBER01;
    --MEMBER01 테이블의 구조만 복사해서 C_MOM02 테이블을 만들자
    CREATE TABLE C_MEM02 AS SELECT * FROM MEMBER01 WHERE 1=2;
    INSERT INTO MEMBER01 VALUES(1, 'HONG', 'H111', '홍길동', 24, SYSDATE);
    COMMIT;
    SELECT * FROM MEMBER01;
    
    --고객테이블 (고객아이디(PK)), 고객이름, 나이, 등급, 직업, 적립금
    -- 나중에 PK넣기
    CREATE TABLE 고객테이블(
    고객아이디 VARCHAR2(50),
    고객이름 VARCHAR2(50),
    나이 NUMBER,
    등급 VARCHAR2(50),
    직엽 VARCHAR2(50),
    적립금 NUMBER
    );
    
    --BOOK 테이블 만들기
    -- 도서번호(bookid,pk), 도서이름(bookname,90), 출판사(publisher,50), 가격(price,7)
    CREATE TABLE BOOK테이블(
    bookid VARCHAR2(50) NOT NULL PRIMARY KEY,
    bookname VARCHAR2(90),
    publisher VARCHAR2(50),
    price VARCHAR2(7)
    );
    
    --제약조건
    -- NOT NULL : 널을 허용하지 않음
    -- DEFAULT : 기본값을 지정하는 키워드
        -- 적립금 NUMBER DEFAULT 0 => 값을 입력할때 입력하지 않으면 0으로 채워진다.
    -- CHECK : 테이블에 정확하고 유효한 데이터를 유지하기 위해 특정 속성에 대한 제약조건을 지정
        --AGE NUMBER CHECK >= 19 -> AGE가 19이상인 숫자만 받는다
        -- 재고량 NUMBER CHECK (재고량 >= 0 AND 재고량 >= 1000) -> 재고량이 0~1000까지 숫자만 받는다
        
    --테이블 구조 변경(ALTER)
    --컬럼추가(ADD) : ALTER TABLE 테이블이름 ADD 컬럼명 자료형(크기) [제약조건]
        
    --MEMBER01 테이블에 주소를 넣자 (M_ADDR VARCHAR2(100) DEFAULT ‘서울’;
    ALTER TABLE MEMBER01 ADD M_ADDR VARCHAR2(100);
    COMMIT;
    ALTER TABLE MEMBER01 ADD M_ADDR2 VARCHAR2(100) DEFAULT '서울';
    COMMIT;
        
    --컬럼삭제 (DROP COLUMN 컬럼명): ALTER TABLE 테이블이름 DROP COLUMN 컬럼명;
    ALTER TABLE MEMBER01 DROP COLUMN M_ADDR;
    COMMIT;
    --데이터가 있어도 삭제된다
    --만약에 삭제할 속성의 참조하는 다른 속성이 있으면 삭제 안됨
    ALTER TABLE MEMBER01 DROP COLUMN M_ADDR2;
    COMMIT;
    
    -- 컬럼변경(MODIFY) : ALTER TABLE 테이블이름 MODIFY 컬럼명 자료형(크기) [제약조건]
      -- 데이터가 없는 경우 : 컬럼의 자료형과 크기를 마음대로 변경할 수 있다.
        --M_ADDR는 데이터가 없으므로 같은 자료형의 크기를 마음대로 변경.
        ALTER TABLE MEMBER01 MODIFY M_ADDR VARCHAR2(50);
        COMMIT;
    --M_ADDR는 데이터가 없으므로 다른 자료형으로 변경 가능
       ALTER TABLE MEMBER01 MODIFY M_ADDR NUMBER(7);
        
    --데이터가 있는경우 같은 자료형의 크기 변경은 가능(단, 기존에 있는 데이터의 크기보다 커야 된다)
        ALTER TABLE MEMBER01 MODIFY M_ADDR2 VARCHAR2(50);
    
    --데이터가 있는데 다른 자료형으로 변경할때(비추천)
        --문자를 숫자로 변경할 때 안된다
        ALTER TABLE MEMBER01 MODIFY M_ADDR2 NUMBER;
        --숫자를 문자로 변경할때 안된다.
        ALTER TABLE MEMBER01 MODIFY M_AGE VARCHAR2(6);
    

      
       