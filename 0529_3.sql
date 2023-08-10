-- select�� �̿��� sql �ۼ�
-- 1.��� ������ �̸��� ������ �˻��Ͻÿ�.
    select bookname,price from BOOK ;
-- 2.��� ������ ���ݰ� �̸��� �˻��Ͻÿ�.
    select price,bookname from book ;
-- 3.��� ������ ������ȣ,  �����̸�, ���ǻ�, ������ �˻��Ͻÿ�.
    select bookid,bookname,publisher,price from book ;
-- 4.���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.
    select publisher from book ;
-- 5.���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.(�ߺ�����)
    select DISTINCT publisher from book ;
-- 6.������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.
    select bookname from book where price between 10000 and 20000;
-- 7.���ǻ簡 ���½������� Ȥ�� �����ѹ̵��� ������ �˻��Ͻÿ�.
    select bookname from book where publisher in ('�½�����','���ѹ̵��');
-- 8.'�౸�� ���硯�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.
    select publisher from book where bookname = '�౸�� ����';
-- 9.�����̸��� ���౸���� ���Ե� ���ǻ縦 �˻��Ͻÿ�.
    select publisher from book where bookname like '%�౸%';
-- 10.�����̸��� ���� �� ��° ��ġ�� ��������� ���ڿ��� ���� ������ �˻��Ͻÿ�
    select bookname from book where bookname like '_��%';
-- 11.�౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
    select bookname from book where bookname like '%�౸%' and price >= 20000;
-- 12.������ �̸������� �˻��Ͻÿ�.
    select * from book order by bookname;
-- 13.������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�.
    select * from book order by price , bookname;
-- 14.������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ �˻��Ѵ�.
    select * from book order by price desc, publisher;
-- 15. ������ȣ�� 1�� ������ �̸�
    select bookname from book where bookid = '1';
-- 16. ������ 20000�� �̻��� ������ �̸�
    select bookname from book where price <= 20000;
-- 17. ��� ���� �̸�, �ּ�
    select name, address from customer;
-- 18. 2014�� 7�� 4��~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
    select orderid from orders where orderdate >= '2014-07-04' and orderdate <= '2014-07-07';
-- 19. 2014�� 7�� 4��~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
    select orderid from orders where not orderdate >= '2014-07-04' and orderdate <= '2014-07-07';
-- 20. ���� '��'���� ���� �̸��� �ּ�
    select name, address from customer where name like '��%';
-- 21. ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
    select name, address from customer where name like '��%' and name like '%��';