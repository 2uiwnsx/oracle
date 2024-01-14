/*
    ▶ TO_CHAR(숫자, [숫자 형식 모델])
    ▶ TO_CHAR(날짜, [날짜 형식 모델])
    ▶ TO_NUMBER(문자열)
    ▶ TO_DATE(문자열, [날짜 형식 모델])
    
    -------------------------------------
    
    ▶ 숫자 형식 모델
    
        ▷ 9 : 숫자 → 빈 자리 : 공백
        ▷ 0 : 숫자 → 빈 자리 : 0
        ▷ $ : 통화 기호
        ▷ L : 로컬 통화 기호
        ▷ . : 소수점
        ▷ , : 천 단위 구분 기호
        
    -------------------------------------
    
    ▶ 날짜 형식 모델

        ▷ YYYY : 네 자리 연도
        ▷ YY : 두 자리 연도
        ▷ MONTH : 월의 전체 이름
        ▷ MON : 월의 축약된 이름
        ▷ MM : 월
        ▷ DDD : 연중 몇 번째 날
        ▷ DD : 일
        ▷ DAY : 요일의 전체 이름
        ▷ DY : 요일의 축약된 이름
        ▷ D : 요일 ➜ 일요일 : 1, 토요일 : 7
        ▷ HH : 시(12시간제)
        ▷ HH24 : 시(24시간제)
        ▷ MI : 분
        ▷ SS : 초
        ▷ AM 또는 PM : 오전 또는 오후
*/

SELECT weight, TO_CHAR(weight), SUBSTR(weight, 1, 2), (weight || 'kg'), LENGTH(weight) FROM tblComedian;

SELECT
    weight,
    ('@' || TO_CHAR(weight) || '@'),
    ('@' || TO_CHAR(weight, '99999') || '@'),
    ('@' || TO_CHAR(-weight, '99999') || '@'),
    ('@' || TO_CHAR(weight, '00000') || '@'),
    ('@' || TO_CHAR(-weight, '00000') || '@')
FROM
    tblComedian;

SELECT TO_CHAR(100, '$999'), TO_CHAR(100, 'L999') FROM DUAL;
SELECT TO_CHAR(1234567.89, '9,999,999.99'), LTRIM(TO_CHAR(123.56, '9,999,999.99')) FROM DUAL;

SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MONTH') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DDD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'D') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MI') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'AM') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'PM') FROM DUAL;

SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD'),
    TO_CHAR(SYSDATE, 'HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'DAY AM HH:MI:SS')
FROM
    DUAL;

SELECT
    COUNT(DECODE(TO_CHAR(ibsaDate, 'D'), '1', 1)) AS 일요일,
    COUNT(DECODE(TO_CHAR(ibsaDate, 'D'), '2', 1)) AS 월요일,
    COUNT(DECODE(TO_CHAR(ibsaDate, 'D'), '3', 1)) AS 화요일,
    COUNT(DECODE(TO_CHAR(ibsaDate, 'D'), '4', 1)) AS 수요일,
    COUNT(DECODE(TO_CHAR(ibsaDate, 'D'), '5', 1)) AS 목요일,
    COUNT(DECODE(TO_CHAR(ibsaDate, 'D'), '6', 1)) AS 금요일,
    COUNT(DECODE(TO_CHAR(ibsaDate, 'D'), '7', 1)) AS 토요일
FROM
    tblInsa;
    
SELECT
    name,
    TO_CHAR(ibsaDate, 'YYYY-MM-DD') AS ibsaDate,
    TO_CHAR(ibsaDate, 'DAY') AS day,
    CASE
        WHEN TO_CHAR(ibsaDate, 'D') IN ('1', '7') THEN '휴일 입사'
        ELSE '평일 입사'
    END
FROM
    tblInsa;

SELECT '123' * 2, TO_NUMBER('123') * 2 FROM DUAL;

SELECT
    '2023-08-29',
    TO_DATE('2023-08-29'),
    TO_DATE('2023-08-29', 'YYYY-MM-DD'),
    TO_DATE('20230829'),
    TO_DATE('2023/08/29'),
    TO_DATE('2023-08-29 15:28:39', 'YYYY-MM-DD HH24:MI:SS')
FROM
    DUAL;

SELECT * FROM tblInsa WHERE (ibsaDate >= '2000-01-01') AND (ibsaDate <= '2000-12-31');
SELECT * FROM tblInsa WHERE TO_CHAR(ibsaDate, 'YYYY') = '2000';
SELECT * FROM tblInsa WHERE (ibsaDate >= TO_DATE('2000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS')) AND (ibsaDate <= TO_DATE('2000-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'));
