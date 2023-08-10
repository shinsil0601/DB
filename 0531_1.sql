/* SELECT�� ����
SELECT [ALL | DISTINCT] �Ӽ��̸�(��)
FROM        ���̺��̸�
[WHERE      �˻�����(��)]
[GROUP BY     �Ӽ��̸�]
[HAVING     �˻�����(��)]
[ORDER BY    �Ӽ��̸�[ASC|DESC]]*/
-- Ư�� �÷��� �ƴ� ��� �÷��� �����Ҷ��� *(��)�� ���

-- �����Լ� : Ư���� ��츦 �����ϰ�� �Ϲ� �÷��� ���� ��� �Ұ�
--           Ư�� �Ӽ����� ��������� ����� ����� �˻��ϱ� ���� �Լ�
-- ���ǻ���: NULL �Ӽ����� �����ϰ� ����Ѵ�.
--         WHERE������ ����� �� ����, SELECT���̳� HAVING�������� ��� ����
-- ���� : SUM(�÷���) : �ش� �÷��� �հ� ���ϱ�
--       AVG(�÷���) : �ش� �÷��� ��� ���ϱ�
--       MAX(�÷���): �ش� �÷��� �ִ밪 ���ϱ�
--       MIN(�÷���): �ش� �÷��� �ּҰ� ���ϱ�
--       COUNT(�⺻�÷��� �Ǵ� *): �ش� �÷��� ���� ���ϱ�
    SELECT * FROM ��ǰ���̺�;
-- ��ǰ���̺��� ��� ��ǰ�� �ܰ� ���, �ܰ� �հ�, ��ü ������ �˻��غ���
    SELECT AVG(�ܰ�), SUM(�ܰ�), COUNT(*) FROM ��ǰ���̺�;
    
-- �Ѻ��������� ������ ��ǰ�� ��� ���, �հ�, ������ ��ǰ ���̺��� �˻��غ���(����)
    SELECT AVG(���), SUM(���), COUNT(*) FROM ��ǰ���̺� WHERE ������ü = '�Ѻ�����';
    
-- �����̺� ���� ��� ��ϵǾ� �ִ��� �˻��غ���
    SELECT COUNT(*) FROM �����̺�;
    
-- ��ǰ���̺��� ������ü�� ���� �˻��غ���(�ߺ�����)
    SELECT COUNT(DISTINCT ������ü) FROM ��ǰ���̺�;  --** �߿� ���� ���� Ʋ��

    SELECT * FROM ORDERS;
-- ORDERS ���̺��� ���� �ֹ��� ������ �� �Ǹž�, ����� ���Ͻÿ�.
    SELECT SUM(saleprice) AS ���Ǹž�, AVG(saleprice) ��� FROM ORDERS;
-- ORDERS ���̺��� �� 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž�, ����� ���Ͻÿ�.
    SELECT SUM(saleprice) AS ���Ǹž� FROM ORDERS WHERE CUSTID = 2;
-- -------------------------------------------------------------------

-- GROUP BY �÷��� [HAVING ����];
-- Ư�� �Ӽ����� ���� Ʃ���� ��� �׷��� ����
-- GROUP BY ���� SELECT ���� �����Լ���, GROUP BY���� ����� �÷��� ��� ����
-- �����Լ��� WHERE������ ��� ���ϰ� HAVING �������� ��� ����
-- HAVING���� GROUP BY�� ����� ������ ������ ������ �� ���
-- WHERE���� GROUP BY ���� ������ ������ �����Ҷ� ���
    SELECT * FROM �ֹ����̺�;
-- �ֹ����̺��� �ֹ���ǰ�� ������ �հ踦 �˻�����
    SELECT �ֹ���ǰ, SUM(����) FROM �ֹ����̺� GROUP BY �ֹ���ǰ;
    
    SELECT * FROM ��ǰ���̺�;
-- ��ǰ���̺��� ������ü���� ��ǰ�� ������ ������ �ܰ��� �˻�����.
    SELECT ������ü, COUNT(*) AS "��ǰ�� ��", MAX(�ܰ�) AS �ְ� FROM ��ǰ���̺� GROUP BY ������ü;

-- ��ǰ���̺��� ������ü���� ��ǰ�� ������ ���� ��� �ܰ��� �˻�����(��, ��ǰ���� 3�� �̻�)
    SELECT ������ü, COUNT(*) AS "��ǰ�� ��", MAX(�ܰ�) AS �ְ� FROM ��ǰ���̺� GROUP BY ������ü HAVING COUNT(*) >= 3;

    SELECT * FROM �����̺�;
-- �����̺��� ������ ����� 1000�� �̻��� ��޿� ���� ��޺� ������ ������ ����� �˻��غ���
    SELECT ���, COUNT(*) AS ����, AVG(������) AS ��� FROM �����̺� GROUP BY ��� HAVING AVG(������) >= 1000;

    SELECT * FROM ORDERS;
-- ORDERS ���̺��� ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ� (�������� ����
    SELECT CUSTID, COUNT(*), SUM(saleprice) FROM ORDERS GROUP BY CUSTID ORDER BY CUSTID ASC;
-- ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�
    SELECT CUSTID, COUNT(*) FROM ORDERS WHERE saleprice >= 8000 GROUP BY CUSTID ORDER BY CUSTID ASC;
-- ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�
-- �� �α� �̻� ������ ���� ���Ѵ�
    SELECT CUSTID, COUNT(*) FROM ORDERS WHERE saleprice >= 8000 GROUP BY CUSTID HAVING COUNT(*) >= 2 ORDER BY CUSTID ASC;
-- ORDERS ���̺��� �������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
    SELECT SUM(saleprice) FROM ORDERS WHERE CUSTID = 1;
-- �������� ������ ������ ��(�������� ����ȣ�� 1������ ���� �ۼ�)
    SELECT COUNT(*) FROM ORDERS WHERE CUSTID = 1;
-- BOOK ���̺��� ������ �� ����
    SELECT COUNT(*) FROM BOOK;
-- BOOK ���̺��� ���ǻ��� �� ����(�ߺ�����)
    SELECT COUNT(DISTINCT publisher) FROM BOOK;


