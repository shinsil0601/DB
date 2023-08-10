create table guestbook(
    idx int primary KEY AUTO_INCREMENT,
    name varchar(50),
    subject varchar(50),
    content varchar(4000),
    email varchar(50),
    pwd varchar(50), 
    regdate datetime
  );

INSERT INTO guestbook (NAME, SUBJECT, content, email, pwd, regdate)
VALUES ('홍길동', '첫번째연습', '첫번째연습 내용~~~', 'hong@nave.com', '1111', CURDATE());guestbook
  select * from guestbook;

  commit;