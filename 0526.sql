    -- ���۾�(DML): ����(INSERT ~ INTO), ����(DELETE FROM), ����(UPDATE ~ SET), �˻�(SELECT ~FROM)
    -- �����(DCL): GRANT, REVOKE, COMMIT, ROLLBACK
    -- COMMIT: ���� ���¸� DB�� ����(����)
    -- ROLLBACK: COMMIT �������·� �ǵ�����.
    -- COMMIT - �۾�1 - �۾�2 - �۾�3 - COMMIT - �۾�4 - �۾�5 -COMMIT - ROLLBACK(�۾�4, �۾�5 �������·� �ǵ�����.)

    -- ������ ����(INSERT INTO ~ VALUES ~ )
    -- ���1) INSERT INTO ���̺��̸� VALUES (��1,��2,��3...��4);
    -- ���� ������� ��� ä���� �Ѵ�.
    -- ��� ä���� ������ �����̴�.
    -- ���� �ֱ� ������ NULL�� ���� �� �ִ�.
    -- ��, �Ӽ� NOT NULL�̸� ���� ������ �־�� �Ѵ�.
    -- ��¥�� ���ڴ� �ݵ�� '' ���
    -- SYSDATE�� ���� ��¥�� ���ϴ� ����Ŭ ���ɾ��̴�.
    INSERT INTO MEMBER01 
    VALUES(4, 'KIM', 'K111', '�赹��', 24, SYSDATE, 02, '����');

    --INSERT INTO MEMBER01 
    --VALUES(5, 'KIM', 'K111', '�赹��');

    INSERT INTO MEMBER01 
    VALUES(5, 'KIM', 'K111', '�赹��', 24, SYSDATE, NULL, NULL);

    INSERT INTO MEMBER01 
    VALUES(6, 'KIM', 'K111', '�赹��', 24, '2023/01/22', 02, '����');

    -- ���2) INSERT INTO ���Ϻ���(�÷���1, �÷���2,...)
    -- VALUES (�÷���1�� ��, �÷���2�� ��,...)
    -- �÷����� �� ���� �ݵ�� 1:1 ��Ī
    -- �Ӽ��� NOT NULL�� ��� �ݵ�� �־�� �ȴ�.
    INSERT INTO MEMBER01(ID)
    VALUES(7);
    
    -- �������̺� �����ϱ�
    INSERT INTO �������̺� VALUES('apple', '����ȭ', 20, 'gold', '�л�', 1000);
    INSERT INTO �������̺� VALUES('apple', '����ȭ', 20, 'gold', '�л�', 1000);
    INSERT INTO �������̺� VALUES('apple', '����ȭ', 20, 'gold', '�л�', 1000);
    INSERT INTO �������̺� VALUES('apple', '����ȭ', 20, 'gold', '�л�', 1000);
    INSERT INTO �������̺� VALUES('apple', '����ȭ', 20, 'gold', '�л�', 1000);
    INSERT INTO �������̺� VALUES('apple', '����ȭ', 20, 'gold', '�л�', 1000);
    INSERT INTO �������̺� VALUES('peach', '������',  'gold', '�л�', 1000);
    INSERT INTO �������̺� VALUES('peach', '������',null, 'gold', '�л�', 1000);
    select * from �������̺�;
    commit;
    INSERT INTO �������̺�(�������̵�, �����̸�, ���, ����, ������)
    VALUES('peach1', '������1', 'silver1', '�ǻ�1', 3001);
    ALTER TABLE �������̺� RENAME COLUMN ���� TO ����;
    
    CREATE TABLE ��ǰ���̺�(
    ��ǰ��ȣ VARCHAR2(50) NOT NULL PRIMARY KEY,
    ��ǰ�� VARCHAR2(50),
    ����� VARCHAR2(50),
    �ܰ� VARCHAR2(50),
    ������ü VARCHAR2(50)
    );
    
    INSERT INTO ��ǰ���̺�(��ǰ��ȣ, ��ǰ��, �����, �ܰ�, ������ü)
    VALUES('P01', '�׳ɸ���', 5000, 4500, '���ѽ�ǰ');
    INSERT INTO ��ǰ���̺�(��ǰ��ȣ, ��ǰ��, �����, �ܰ�, ������ü)
    VALUES('P02', '�ſ��̸�', 2500, 5500, '�α�Ǫ��');
    INSERT INTO ��ǰ���̺�(��ǰ��ȣ, ��ǰ��, �����, �ܰ�, ������ü)
    VALUES('P03', '��������', 3600, 2600, '�Ѻ�����');
    INSERT INTO ��ǰ���̺�(��ǰ��ȣ, ��ǰ��, �����, �ܰ�, ������ü)
    VALUES('P04', '�������ݸ�', 1250, 2500, '�Ѻ�����');
    INSERT INTO ��ǰ���̺�(��ǰ��ȣ, ��ǰ��, �����, �ܰ�, ������ü)
    VALUES('P05', '��ū���', 2200, 1200, '���ѽ�ǰ');
    INSERT INTO ��ǰ���̺�(��ǰ��ȣ, ��ǰ��, �����, �ܰ�, ������ü)
    VALUES('P06', '����쵿', 1000, 1550, '�α�Ǫ��');
    INSERT INTO ��ǰ���̺�(��ǰ��ȣ, ��ǰ��, �����, �ܰ�, ������ü)
    VALUES('P07', '���޺�Ŷ', 1650, 1500, '�Ѻ�����');
    
    CREATE TABLE �ֹ����̺�(
    �ֹ���ȣ VARCHAR2(50) NOT NULL PRIMARY KEY,
    �ֹ����� VARCHAR2(50),
    �ֹ���ǰ VARCHAR2(50),
    ���� NUMBER,
    ����� VARCHAR2(50),
    �ֹ����� DATE
    );
    
    INSERT INTO �ֹ����̺�(�ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ�����)
    VALUES('o01', 'apple', 'p03', 10, '����� ������', '2022-01-01');
    INSERT INTO �ֹ����̺�(�ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ�����)
    VALUES('o02', 'melon', 'p01', 5, '��õ�� ��籸', '2022-01-10');
    INSERT INTO �ֹ����̺�(�ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ�����)
    VALUES('o03', 'banana', 'p06', 45, '��⵵ ��õ��', '2022-01-11');
    INSERT INTO �ֹ����̺�(�ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ�����)
    VALUES('o04', 'carrot', 'p02', 8, '�λ�� ������', '2022-02-01');
    INSERT INTO �ֹ����̺�(�ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ�����)
    VALUES('o05', 'melon', 'p06', 36, '��⵵ ���ν�', '2022-02-20');
    INSERT INTO �ֹ����̺�(�ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ�����)
    VALUES('o06', 'banana', 'p01', 19, '��û�ϵ� ������', '2022-03-02');
    INSERT INTO �ֹ����̺�(�ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ�����)
    VALUES('o07', 'apple', 'p03', 22, '����� ��������', '2022-03-15');
    INSERT INTO �ֹ����̺�(�ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ�����)
    VALUES('o08', 'pear', 'p02', 50, '������ ��õ��', '2022-04-10');
    INSERT INTO �ֹ����̺�(�ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ�����)
    VALUES('o09', 'banana', 'p04', 15, '���󳲵� ������', '2022-04-11');
    INSERT INTO �ֹ����̺�(�ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ�����)
    VALUES('o10', 'carrot', 'p03', 20, '��⵵ �Ⱦ��', '2022-05-22');
    commit;
    
    --����, ������ �ݵ�� ���ǽ��� �־�� �Ѵ�.
    -- ���ǽ��� ���� ������ ��ü�� �����ǰų� ��ü�� �����ȴ�.
    
    -- �����ͻ���(delete from ���̺��̸� [where ���ǽ�]);
       -- ���ǽ��� ������ ���ǽ��� ���� �͸� �����ȴ�.
       -- ���ǽ��� ������ ��ü�� �����ȴ�.
       -- ���ǽ�( �÷��� �񱳿����� �Ǵ� ����������)
       delete from �������̺�; --��ü���� ��
       select *from �������̺�;  
       --������ü�� '�Ѻ�����'�� �ุ ����
       delete from ��ǰ���̺� where ������ü = '�Ѻ�����';  --�׻� �÷���(����)�� ���ʿ� �´�
       select *from ��ǰ���̺�;
       --������ü�� '�α�Ǫ��'�̸鼭 �ܰ��� 3000�� ������ �ุ ����
       delete from ��ǰ���̺� where ������ü = '�α�Ǫ��' and �ܰ� <= 3000;
       rollback;  --�����ϱ� ������ ���ư�
       
    --�����ͼ��� (update ���̺��̸� set ���泻�� [where ���ǽ�]);
      -- ���ǽ��� ������ ���ǽ��� ���� �͸� �����ȴ�.
      -- ���ǽ��� ������ ��ü�� �����ȴ�.
      
      -- ������ü�� ����Ǫ��� ����
      update ��ǰ���̺� set ������ü = '����Ǫ��';
      -- ������ü�� �Ѻ������� ���� ��, �ܰ��� 2000�̻��� �ุ ����
      update ��ǰ���̺� set ������ü = '�Ѻ�����' where �ܰ� >=2000;
      -- ������ü�� ������ǰ, �����=10000���� ���� ��, ��ǰ��ȣ�� p01 �Ǵ� p05 �ุ ����
      update ��ǰ���̺� set ������ü = '���ѽ�ǰ', ����� = 10000 where ��ǰ��ȣ = 'P01' or ��ǰ��ȣ = 'P05';
      select *from ��ǰ���̺�;
      -- ��ǰ���̺����� ��ǰ��ȣ�� P03�� ��ǰ�� ��ǰ���� ��ū���̷� ��������
      update ��ǰ���̺� set ��ǰ�� = '��ū����' where ��ǰ��ȣ = 'P03';
      -- ��ǰ���̺��� �ִ� ��� ��ǰ�� �ܰ��� 10% �λ��غ���(�÷��� �����̸� ��������� ����)
      update ��ǰ���̺� set �ܰ� = �ܰ� * 1.1;
      
      select * from �ֹ����̺�;
      --�ֹ����̺����� �ֹ����ڰ� 2022-05-22�� �ֹ������� ��������
      delete from �ֹ����̺� where �ֹ����� = '2022-05-22';
      --�ֹ����̺����� �ֹ����ڰ� 2022-03 ~ 2022-04�� �ֹ������� ��������(��¥�÷� ���� ����)
      delete from �ֹ����̺� where �ֹ�����>='2022-03-01' and �ֹ����� <= '2022-04-30';
      -- �ֹ����̺��� �ֹ����ڸ� ��� 5�Ͼ� �߰�����.
      update �ֹ����̺� set �ֹ����� = �ֹ����� +5;
      --�ֹ����̺����� '����ȭ'������ �ֹ��� ��ǰ�� �ֹ� ������ 5���� �����غ��� (select�� ���: �����ȿ� �����ֱ�)
      commit;