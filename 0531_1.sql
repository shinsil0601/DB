/* SELECT문 형식
SELECT [ALL | DISTINCT] 속성이름(들)
FROM        테이블이름
[WHERE      검색조건(들)]
[GROUP BY     속성이름]
[HAVING     검색조건(들)]
[ORDER BY    속성이름[ASC|DESC]]*/
-- 특정 컬럼이 아닌 모든 컬럼을 지정할때는 *(별)를 사용

-- 집계함수 : 특별한 경우를 제외하고는 일반 컬럼과 같이 사용 불가
--           특정 속성값을 통계적으로 계산한 결과를 검색하기 위한 함수
-- 주의사항: NULL 속성값은 제외하고 계산한다.
--         WHERE절에는 사용할 수 없고, SELECT절이나 HAVING절에서만 사용 가능
-- 종류 : SUM(컬럼명) : 해당 컬럼의 합계 구하기
--       AVG(컬럼명) : 해당 컬럼의 평균 구하기
--       MAX(컬럼명): 해당 컬럼의 최대값 구하기
--       MIN(컬럼명): 해당 컬럼의 최소값 구하기
--       COUNT(기본컬럼명 또는 *): 해당 컬럼의 갯수 구하기
    SELECT * FROM 제품테이블;
-- 제품테이블에서 모든 제품의 단가 평균, 단가 합계, 전체 갯수을 검색해보자
    SELECT AVG(단가), SUM(단가), COUNT(*) FROM 제품테이블;
    
-- 한빛제과에서 제조한 제품의 재고량 평균, 합계, 갯수를 제품 테이블에서 검색해보자(조건)
    SELECT AVG(재고량), SUM(재고량), COUNT(*) FROM 제품테이블 WHERE 제조업체 = '한빛제과';
    
-- 고객테이블에 고객이 몇명 등록되어 있는지 검색해보자
    SELECT COUNT(*) FROM 고객테이블;
    
-- 제품테이블에서 제조업체의 수를 검색해보자(중복제거)
    SELECT COUNT(DISTINCT 제조업체) FROM 제품테이블;  --** 중요 가장 많이 틀림

    SELECT * FROM ORDERS;
-- ORDERS 테이블에서 고객이 주문한 도서의 총 판매액, 평균을 구하시오.
    SELECT SUM(saleprice) AS 총판매액, AVG(saleprice) 평균 FROM ORDERS;
-- ORDERS 테이블에서 중 2번 김연아 고객이 주문한 도서의 총 판매액, 평균을 구하시오.
    SELECT SUM(saleprice) AS 총판매액 FROM ORDERS WHERE CUSTID = 2;
-- -------------------------------------------------------------------

-- GROUP BY 컬럼명 [HAVING 조건];
-- 특정 속성값이 같은 튜플을 모아 그룹을 만듦
-- GROUP BY 사용시 SELECT 절은 집계함수나, GROUP BY에서 사용한 컬럼명만 사용 가능
-- 집계함수는 WHERE절에서 사용 못하고 HAVING 절에서만 사용 가능
-- HAVING절은 GROUP BY의 결과를 가지고 조건을 실행할 때 사용
-- WHERE절은 GROUP BY 전에 조건을 가지고 실행할때 사용
    SELECT * FROM 주문테이블;
-- 주문테이블에서 주문제품별 수량의 합계를 검색하자
    SELECT 주문제품, SUM(수량) FROM 주문테이블 GROUP BY 주문제품;
    
    SELECT * FROM 제품테이블;
-- 제품테이블에서 제조업체별로 제품의 개수와 가장비싼 단가를 검색하자.
    SELECT 제조업체, COUNT(*) AS "제품의 수", MAX(단가) AS 최고가 FROM 제품테이블 GROUP BY 제조업체;

-- 제품테이블에서 제조업체별로 제품의 개수와 가장 비싼 단가를 검색하자(단, 제품수가 3개 이상)
    SELECT 제조업체, COUNT(*) AS "제품의 수", MAX(단가) AS 최고가 FROM 제품테이블 GROUP BY 제조업체 HAVING COUNT(*) >= 3;

    SELECT * FROM 고객테이블;
-- 고객테이블에서 적립금 평균이 1000원 이상인 등급에 대해 등급별 고객수와 적립금 평균을 검색해보자
    SELECT 등급, COUNT(*) AS 고객수, AVG(적립금) AS 평균 FROM 고객테이블 GROUP BY 등급 HAVING AVG(적립금) >= 1000;

    SELECT * FROM ORDERS;
-- ORDERS 테이블에서 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오 (오름차순 정렬
    SELECT CUSTID, COUNT(*), SUM(saleprice) FROM ORDERS GROUP BY CUSTID ORDER BY CUSTID ASC;
-- 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오
    SELECT CUSTID, COUNT(*) FROM ORDERS WHERE saleprice >= 8000 GROUP BY CUSTID ORDER BY CUSTID ASC;
-- 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오
-- 단 두권 이상 구매한 고객만 구한다
    SELECT CUSTID, COUNT(*) FROM ORDERS WHERE saleprice >= 8000 GROUP BY CUSTID HAVING COUNT(*) >= 2 ORDER BY CUSTID ASC;
-- ORDERS 테이블에서 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
    SELECT SUM(saleprice) FROM ORDERS WHERE CUSTID = 1;
-- 박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
    SELECT COUNT(*) FROM ORDERS WHERE CUSTID = 1;
-- BOOK 테이블에서 도서의 총 개수
    SELECT COUNT(*) FROM BOOK;
-- BOOK 테이블에서 출판사의 총 개수(중복제거)
    SELECT COUNT(DISTINCT publisher) FROM BOOK;


