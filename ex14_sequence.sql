/*
    ▶ 시퀀스 생성 방법
    
        ▷ CREATE SEQUENCE 시퀀스명;
        
    ▶ 시퀀스 삭제 방법
    
        ▷ DROP SEQUENCE 시퀀스명;
        
    -----------------------------------------------------------------
    
    ▶  CREATE SEQUENCE 옵션
    
        ▷ INCREMENT BY 숫자 : 증가값
        ▷ START WITH 숫자 : 시작값
        ▷ MAXVALUE 숫자 : 최댓값
        ▷ MINVALUE 숫자 : 최솟값
        ▷ CYCLE : 순환 여부
        ▷ CACHE 숫자 : 메모리에 미리 저장해 둘 값의 개수 ➜ 기본값 : 20
*/

CREATE SEQUENCE testSeq;

-- 시퀀스의 다음 값이 반환된다.
SELECT testSeq.NEXTVAL FROM DUAL;
SELECT ('A' || testSeq.NEXTVAL) FROM DUAL;

-- 시퀀스의 현재 값이 반환된다.
SELECT testSeq.CURRVAL FROM DUAL;

CREATE TABLE tblMemo (
	seq NUMBER(3) PRIMARY KEY,
	name VARCHAR2(30) DEFAULT '익명',
	memo VARCHAR2(1000) NOT NULL,
	regdate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE memoSeq;

INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (memoSeq.NEXTVAL, '홍길동', '메모', SYSDATE);
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (memoSeq.NEXTVAL, '아무개', '메모', SYSDATE);
INSERT INTO tblMemo (seq, name, memo, regdate) VALUES (memoSeq.NEXTVAL, '테스트', '메모', SYSDATE);

SELECT * FROM tblMemo;

DROP SEQUENCE testSeq;

CREATE SEQUENCE testSeq
    -- INCREMENT BY -1;
    -- START WITH 10;
    -- MAXVALUE 10
    -- MINVALUE -10;
    -- CYCLE
    CACHE 10;

SELECT testSeq.NEXTVAL FROM DUAL;

SELECT testSeq.CURRVAL FROM DUAL;
