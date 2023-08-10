CREATE TABLE book(
    bookid number not null primary key,
    bookname VARCHAR2(50),
    publisher VARCHAR2(50),
    price NUMBER
);

create table orders(
    orderid number not null PRIMARY KEY,
    custid NUMBER NOT NULL,
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE
);

create TABLE customer(
    custid NUMBER not null PRIMARY KEY,
    name VARCHAR2(50),
    address VARCHAR2(50),
    phone VARCHAR2(50)
);

commit;

insert into customer
VALUES(1,'������','���� ��ü��Ÿ', '000-5000-0001');
insert into customer
VALUES(2,'�迬��','���ѹα� ����', '000-6000-0001');
insert into customer
VALUES(3,'��̶�','���ѹα� ������', '000-7000-0001');
insert into customer
VALUES(4,'�߽ż�','�̱� Ŭ������', '000-8000-0001');
insert into customer
VALUES(5,'�ڼ���','���ѹα� ����');
insert into customer
VALUES(5,'�ڼ���','���ѹα� ����',null);

insert into book
VALUES(1,'�౸�� ����', '�½�����', 7000);
insert into book
VALUES(2,'�౸�ƴ� ����', '������', 13000);
insert into book
VALUES(3,'�౸�� ����', '���ѹ̵��', 22000);
insert into book
VALUES(4,'���� ���̺�', '���ѹ̵��', 35000);
insert into book
VALUES(5,'�ǰ� ����', '�½�����', 8000);
insert into book
VALUES(6,'���� �ܰ躰���', '�½�����', 6000);
insert into book
VALUES(7,'�߱��� �߾�', '�̻�̵��', 20000);
insert into book
VALUES(8,'�߱��� ��Ź��', '�̻�̵��', 13000);
insert into book
VALUES(9,'�ø��� �̾߱�', '�Ｚ��', 7500);
insert into book
VALUES(10,'Olympic Champions', 'Pearson', 13000);

insert into orders
VALUES(1, 1, 1, 6000, '2014-07-01');
insert into orders
VALUES(2, 1, 3, 21000, '2014-07-03');
insert into orders
VALUES(3, 2, 5, 8000, '2014-07-03');
insert into orders
VALUES(4, 3, 6, 6000, '2014-07-04');
insert into orders
VALUES(5, 4, 7, 20000, '2014-07-05');
insert into orders
VALUES(6, 1, 2, 12000, '2014-07-07');
insert into orders
VALUES(7, 4, 8, 13000, '2014-07-07');
insert into orders
VALUES(8, 3, 10, 12000, '2014-07-08');
insert into orders
VALUES(9, 2, 10, 7000, '2014-07-09');
insert into orders
VALUES(10, 3, 8, 13000, '2014-07-10');