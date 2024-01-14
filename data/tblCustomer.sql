CREATE TABLE tblCustomer (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    tel VARCHAR2(15) NOT NULL,
    address VARCHAR2(100) NOT NULL
);

INSERT INTO tblCustomer (seq, name, tel, address) VALUES (1, '홍길동', '010-1234-5678', '서울시');
INSERT INTO tblCustomer (seq, name, tel, address) VALUES (2, '아무개', '010-3333-4444', '인천시');
INSERT INTO tblCustomer (seq, name, tel, address) VALUES (3, '하하하', '010-5555-6666', '부산시');

COMMIT;
