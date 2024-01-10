/*
    ▶ 제약 조건(Constraint)
    
        ▷ NOT NULL
        ▷ PRIMARY KEY
        ▷ FOREIGN KEY
        ▷ UNIQUE
        ▷ CHECK
        ▷ DEFAULT
*/

CREATE TABLE tblMemo (
	seq NUMBER(3),
	name VARCHAR2(30),
	memo VARCHAR2(1000),
	regdate DATE
);

INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (1, '홍길동', '메모', SYSDATE);
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (NULL, '아무개', '메모', SYSDATE);
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (2, NULL, '메모', SYSDATE);
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (3, '테스트', NULL, SYSDATE);
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (4, '하하하', '메모', NULL);

SELECT * FROM tblMemo;

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
	seq NUMBER(3) NOT NULL,
	name VARCHAR2(30),
	memo VARCHAR2(1000) NOT NULL,
	regdate DATE NOT NULL
);

INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (1, '홍길동', '메모', SYSDATE);

-- ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."SEQ")
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (NULL, '아무개', '메모', SYSDATE);

-- ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."MEMO")
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (3, '테스트', NULL, SYSDATE);

-- ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."REGDATE")
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (4, '하하하', '메모', NULL);

SELECT * FROM tblMemo;

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
	seq NUMBER(3) PRIMARY KEY,
	name VARCHAR2(30),
	memo VARCHAR2(1000) NOT NULL,
	regdate DATE NOT NULL
);

INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (1, '홍길동', '메모', SYSDATE);

-- ORA-00001: unique constraint (HR.SYS_C007093) violated
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (1, '테스트', '메모', SYSDATE);

-- ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."SEQ")
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (NULL, '아무개', '메모', SYSDATE);

SELECT * FROM tblMemo;

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
	seq NUMBER(3) PRIMARY KEY,
	name VARCHAR2(30) UNIQUE,
	memo VARCHAR2(1000) NOT NULL,
	regdate DATE NOT NULL
);

INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (1, '홍길동', '메모', SYSDATE);

-- ORA-00001: unique constraint (HR.SYS_C007100) violated
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (2, '홍길동', '메모', SYSDATE);

INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (3, NULL, '메모', SYSDATE);

SELECT * FROM tblMemo;

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
	seq NUMBER(3) PRIMARY KEY,
	name VARCHAR2(30) UNIQUE,
	memo VARCHAR2(1000) NOT NULL,
	regdate DATE NOT NULL,
	priority NUMBER(1) CHECK (priority BETWEEN 1 AND 3),
	category VARCHAR2(30) CHECK (category IN ('공부', '운동', '청소'))
);

INSERT INTO tblMemo (seq, name, memo, regdate, priority, category) VALUES (1, '홍길동', '메모', SYSDATE, 1, '공부');

-- ORA-02290: check constraint (HR.SYS_C007101) violated
INSERT INTO tblMemo (seq, name, memo, regdate, priority, category) VALUES (2, '아무개', '메모', SYSDATE, 5, '공부');

-- ORA-02290: check constraint (HR.SYS_C007102) violated
INSERT INTO tblMemo (seq, name, memo, regdate, priority, category) VALUES (3, '테스트', '메모', SYSDATE, 2, '수면');

SELECT * FROM tblMemo;

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
	seq NUMBER(3) PRIMARY KEY,
	name VARCHAR2(30) DEFAULT '익명',
	memo VARCHAR2(1000) NOT NULL,
	regdate DATE DEFAULT SYSDATE
);

INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (1, '홍길동', '메모', SYSDATE);
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (2, NULL, '메모', NULL);
INSERT INTO tblMemo (seq, memo) VALUES (3, '메모');
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (4, DEFAULT, '메모', DEFAULT);

SELECT * FROM tblMemo;

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
	seq NUMBER(3),
	name VARCHAR2(30),
	memo VARCHAR2(1000) NOT NULL,
	regdate DATE DEFAULT SYSDATE NOT NULL,
	CONSTRAINT PK_tblMemo_seq PRIMARY KEY (seq),
	CONSTRAINT UQ_tblMemo_name UNIQUE (name),
	CONSTRAINT CK_tblMemo_memo CHECK (LENGTH(memo) >= 10)
);
