-- �Ϲ� ���� �����
CREATE USER C##shinsil IDENTIFIED BY 1111;

-- ������ ���� �ο� : GRANT
GRANT CONNECT, RESOURCE TO C##shinsil;

-- ���̺� �����̽� ���� �ο�
ALTER USER C##shinsil DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

select * from tab;
desc help;