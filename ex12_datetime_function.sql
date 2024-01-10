/*
    ▶ SYSDATE : 현재 날짜와 시간을 반환하는 함수
    
    --------------------------------------------
    
    ▶ MONTHS_BETWEEN(날짜, 날짜)
    ▶ ADD_MONTHS(날짜, 월수)
    ▶ LAST_DAY(날짜)
*/

SELECT SYSDATE FROM DUAL;

SELECT
    name,
    ibsaDate,
    ROUND(SYSDATE - ibsaDate) AS 근무일수,
    ROUND((SYSDATE - ibsaDate) * 24) AS 근무시수,
    ROUND((SYSDATE - ibsaDate) * 24 * 60) AS 근무분수,
    ROUND((SYSDATE - ibsaDate) * 24 * 60 * 60) AS 근무초수
FROM
    tblInsa;

SELECT SYSDATE, (SYSDATE + 100), (SYSDATE + (3 / 24)), (SYSDATE + (30 / 60 / 24)) FROM DUAL;

SELECT
    name,
    ROUND(SYSDATE - ibsaDate) AS 근무일수,
    ROUND(MONTHS_BETWEEN(SYSDATE, ibsaDate)) AS 근무월수,
    ROUND(MONTHS_BETWEEN(SYSDATE, ibsaDate) / 12) AS 근무년수
FROM
    tblInsa;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3), ADD_MONTHS(SYSDATE, -2), ADD_MONTHS(SYSDATE, (5 * 12)) FROM DUAL;

SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;
