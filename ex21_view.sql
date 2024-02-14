SELECT * FROM (SELECT * FROM tblInsa);

CREATE OR REPLACE VIEW vwInsa AS (
    SELECT * FROM tblInsa
);

SELECT * FROM vwInsa;

CREATE OR REPLACE VIEW vwTel AS (
    SELECT name, buseo, jikwi, tel FROM tblInsa
);

SELECT * FROM vwTel;

CREATE OR REPLACE VIEW 영업부 AS (
    SELECT num, name, SUBSTR(ssn, 8) AS ssn, city, basicPay FROM tblInsa WHERE buseo = '영업부'
);

SELECT * FROM 영업부;

CREATE OR REPLACE VIEW vwCheck AS (
    SELECT
        m.name AS 회원,
        v.name AS 비디오,
        r.rentDate AS 대여일,
        r.returnDate AS 반납일,
        (r.rentDate + v.period) AS 반납예정일,
        ROUND((SYSDATE - (r.rentDate + v.period))) AS 연체일,
        ROUND((SYSDATE - (r.rentDate + v.period)) * v.price * 0.1) AS 연체료
    FROM
        tblRent r
            INNER JOIN tblMember m
                ON m.seq = r.mSeq
            INNER JOIN tblVideo v
                ON v.seq = r.vSeq
);
	 
SELECT * FROM vwCheck;

CREATE OR REPLACE VIEW vwSeoul AS (
    SELECT * FROM tblInsa WHERE city = '서울'
);

SELECT * FROM vwSeoul;

UPDATE tblInsa SET city = '제주' WHERE num IN (1001, 1005, 1008);

-- 원본 테이블의 변경 사항이 반영된다.
SELECT * FROM vwSeoul;

CREATE OR REPLACE VIEW vwTodo AS (
    SELECT * FROM tblTodo
);

SELECT * FROM vwTodo;

INSERT INTO vwTodo VALUES ((SELECT (MAX(seq) + 1) FROM tblTodo), '할일', SYSDATE, NULL);

UPDATE vwTodo SET title = '할일 완료' WHERE seq = 21;

SELECT * FROM vwTodo;

DELETE vwTodo WHERE seq = 21;

SELECT * FROM vwTodo;
