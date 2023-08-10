CREATE TABLE members(
  m_idx number not null PRIMARY KEY ,
  m_id varchar2(50),
  m_pw VARCHAR2(50),
  m_name VARCHAR2(50),
  m_age  number,
  m_reg date 
); 
insert into members values(1, 'hong', 'h111', '홍길동', 24, sysdate);
insert into members values(2, 'park', 'p111', '박길동', 14, sysdate);
insert into members values(3, 'goh', 'g111', '고길동', 21, sysdate);
insert into members values(4, 'kim', 'k111', '김길동', 29, sysdate);
insert into members values(5, 'lee', 'l111', '이길동', 29, sysdate);
commit;
select * from members;

create SEQUENCE members_seq
INCREMENT by 1
start with 6
maxvalue 999999999
nocycle;