-- 자료형
-- 숫자 :
--    INT(정수members), INTEGER(정수), BIGINT(큰정수), 
--    실수: DECIMAL(m,d), NUMERIC

-- 문자 : 
--    char(n): 고정길이, varchar(n): 가변길이

-- 날짜 시간
-- date : 'YYYY-MM-DD'
-- time : 'HH:MM:SS'
-- datetime : 'YYYY-MM-DD HH:MM:SS'
-- timestamp : 'YYYY-MM-DD HH:MM:SS'

-- 보통 숫자의 자동증가 : AUTO_INCREMENT
--				
-- CREATE TABLE members(
--  m_idx int PRIMARY KEY AUTO_INCREMENT,
--  m_id varchar(50),
--  m_pw VARCHAR(50),
--  m_name VARCHAR(50),
--  m_age  int,
--  m_reg date members
-- );
 
-- insert into members(m_id, m_pw, m_name, m_age, m_reg)
-- values('hong', 'h111', '홍길동', 24, SYSDATE());
-- insert into members(m_id, m_pw, m_name, m_age, m_reg)
-- values('park', 'p111', '박길동', 14, sysdate());
-- insert into members(m_id, m_pw, m_name, m_age, m_reg)
-- values('goh', 'g111', '고길동', 21, sysdate());
-- insert into members(m_id, m_pw, m_name, m_age, m_reg)
-- values('kim', 'k111', '김길동', 29, sysdate());
-- insert into members(m_id, m_pw, m_name, m_age, m_reg)
-- values('lee', 'l111', '이길동', 29, SYSDATE());

COMMIT;
SELECT * FROM members;