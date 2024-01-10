/*
    ▶ DUAL : 가상의 테이블
    
    -----------------------------------
    
    ▶ ROUND(숫자, [소수점 이하 자릿수])
    ▶ FLOOR(숫자)
    ▶ TRUNC(숫자, [소수점 이하 자릿수])
    ▶ CEIL(숫자)
    ▶ MOD(피제수, 제수)
    ▶ ABS(숫자)
    ▶ POWER(숫자, 지수)
    ▶ SQRT(숫자)
*/

SELECT * FROM DUAL;
SELECT (1 + 1) FROM DUAL;
SELECT SYSDATE FROM DUAL;

SELECT
    ROUND(3.5678),
    ROUND(3.5678, 0),
    ROUND(3.5678, 1),
    ROUND(3.5678, 2)
FROM
    DUAL;

SELECT
    FLOOR(3.5678),
    TRUNC(3.5678),
    TRUNC(3.5678, 0),
    TRUNC(3.5678, 1),
    TRUNC(3.5678, 2)
FROM
    DUAL;

SELECT CEIL(3.14) FROM DUAL;

SELECT
    (10 / 3),
    FLOOR(10 / 3) AS 몫,
    MOD(10, 3) AS 나머지
FROM
    DUAL;

SELECT ABS(10), ABS(-10) FROM DUAL;

SELECT POWER(2, 2), POWER(2, 3), POWER(2, 4) FROM DUAL;

SELECT SQRT(4), SQRT(9), SQRT(16) FROM DUAL;
