CREATE TABLE tblDate (
    seq NUMBER PRIMARY KEY,
    regdate DATE NOT NULL,
    state VARCHAR2(30) NOT NULL
);

INSERT INTO tblDate (seq, regdate, state) VALUES (1, '2023-09-01', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (2, '2023-09-04', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (3, '2023-09-05', '지각');
INSERT INTO tblDate (seq, regdate, state) VALUES (4, '2023-09-07', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (5, '2023-09-08', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (6, '2023-09-11', '조퇴');
INSERT INTO tblDate (seq, regdate, state) VALUES (7, '2023-09-12', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (8, '2023-09-13', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (9, '2023-09-14', '지각');
INSERT INTO tblDate (seq, regdate, state) VALUES (10, '2023-09-15', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (11, '2023-09-18', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (12, '2023-09-19', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (13, '2023-09-20', '지각');
INSERT INTO tblDate (seq, regdate, state) VALUES (14, '2023-09-22', '조퇴');
INSERT INTO tblDate (seq, regdate, state) VALUES (15, '2023-09-25', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (16, '2023-09-26', '정상');
INSERT INTO tblDate (seq, regdate, state) VALUES (17, '2023-09-27', '정상');

SELECT * FROM tblDate;

DECLARE
    vDate DATE;
    vState VARCHAR2(30);
    vCnt NUMBER;
BEGIN
    vDate := TO_DATE('2023-09-01', 'YYYY-MM-DD');
    
    FOR i IN 1..30 LOOP
        SELECT COUNT(*) INTO vCnt from tblDate WHERE TO_CHAR(regdate, 'YYYY-MM-DD') = TO_CHAR(vDate, 'YYYY-MM-DD');
        
        IF vCnt > 0 THEN
            SELECT state INTO vState FROM tblDate WHERE TO_CHAR(regdate, 'YYYY-MM-DD') = TO_CHAR(vDate, 'YYYY-MM-DD');
            
            DBMS_OUTPUT.PUT_LINE(vDate || ' ' || vState);
        ELSE
            DBMS_OUTPUT.PUT_LINE(vDate || ' 휴일');
        END IF;
        
        vDate := vDate + 1;
    END LOOP;
END;
/

CREATE OR REPLACE VIEW vwDate AS (
    SELECT
        (TO_DATE('20230901', 'YYYYMMDD') + LEVEL - 1) AS regdate
    FROM
        DUAL
            CONNECT BY LEVEL <= (TO_DATE('20230930', 'YYYYMMDD') - TO_DATE('20230901', 'YYYYMMDD') + 1)
);
      
SELECT * FROM vwDate;

SELECT
    *
FROM
    vwDate v
        LEFT OUTER JOIN tblDate t
            ON t.regdate = v.regdate
ORDER BY
    v.regdate;

SELECT
    v.regdate,
    CASE
        WHEN TO_CHAR(v.regdate, 'D') = '1' THEN '일요일'
        WHEN TO_CHAR(v.regdate, 'D') = '7' THEN '토요일'
        ELSE t.state
    END AS state
FROM
    vwDate v
        LEFT OUTER JOIN tblDate t
            ON t.regdate = v.regdate
ORDER BY
    v.regdate;

CREATE TABLE tblHoliday (
    seq NUMBER PRIMARY KEY,
    regdate DATE NOT NULL,
    name VARCHAR2(30) NOT NULL
);

INSERT INTO tblHoliday VALUES (1, TO_DATE('20230928', 'YYYYMMDD'), '추석');
INSERT INTO tblHoliday VALUES (2, TO_DATE('20230929', 'YYYYMMDD'), '추석');

SELECT * FROM tblHoliday;

SELECT
    v.regdate,
    CASE
        WHEN TO_CHAR(v.regdate, 'D') = '1' THEN '일요일'
        WHEN TO_CHAR(v.regdate, 'D') = '7' THEN '토요일'
        WHEN (t.state IS NULL) AND (h.name IS NOT NULL) THEN h.name
        WHEN (t.state IS NULL) AND (h.name IS NULL) THEN '결석'
        ELSE t.state
    END AS state
FROM
    vwDate v
        LEFT OUTER JOIN tblDate t
            ON t.regdate = v.regdate
        LEFT OUTER JOIN tblHoliday h
            ON h.regdate = v.regdate
ORDER BY
    v.regdate;
