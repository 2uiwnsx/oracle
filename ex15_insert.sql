DROP SEQUENCE memoSeq;

DROP TABLE tblMemo;

CREATE TABLE tblMemo (
	seq NUMBER(3) PRIMARY KEY,
	name VARCHAR2(30) DEFAULT '익명',
	memo VARCHAR2(1000),
	regdate DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE memoSeq;

INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (memoSeq.NEXTVAL, '홍길동', '메모', SYSDATE);
INSERT INTO tblMemo (seq, memo, regdate, name) VALUES (memoSeq.NEXTVAL, '메모', SYSDATE, '아무개');
INSERT INTO tblMemo (seq, name, regdate) VALUES (memoSeq.NEXTVAL, '테스트', SYSDATE);
INSERT INTO tblMemo (seq, memo, regdate) VALUES (memoSeq.NEXTVAL, '메모', SYSDATE);

SELECT * FROM tblMemo;

CREATE TABLE tblMemoCopy1 (
	seq NUMBER(3) PRIMARY KEY,
	name VARCHAR2(30) DEFAULT '익명',
	memo VARCHAR2(1000),
	regdate DATE DEFAULT SYSDATE NOT NULL
);

INSERT INTO tblMemoCopy1 (SELECT * FROM tblMemo);

SELECT * FROM tblMemoCopy1;

-- 제약 조건은 복사되지 않는다.
CREATE TABLE tblMemoCopy2 AS (
    SELECT * FROM tblMemo
);

INSERT INTO tblMemoCopy2 (seq, memo, regdate) VALUES (1, '메모', SYSDATE);

SELECT * FROM tblMemoCopy2;
