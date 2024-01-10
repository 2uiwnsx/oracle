/*
    ▶ 집계 함수(Aggregation Fuction)
    
        ▷ COUNT(컬럼명)
        ▷ SUM(컬럼명)
        ▷ AVG(컬럼명)
        ▷ MAX(컬럼명)
        ▷ MIN(컬럼명)
*/

SELECT COUNT(*) FROM tblCountry;

-- 값이 NULL이 아닌 행의 개수가 반환된다.
SELECT COUNT(population) FROM tblCountry;

SELECT (COUNT(*) - COUNT(tel)) FROM tblInsa;
SELECT COUNT(*) FROM tblInsa WHERE tel IS NULL;
SELECT COUNT(DISTINCT buseo) FROM tblInsa;

SELECT
    COUNT(
        CASE
            WHEN gender = 'm' THEN 1
        END
    ) AS 남자,
    COUNT(
        CASE
            WHEN gender = 'f' THEN 1
        END
    ) AS 여자
FROM
    tblComedian;

SELECT
    COUNT(
        CASE
            WHEN buseo = '기획부' THEN 'O'
        END
    ) AS 기획부,
    COUNT(
        CASE
            WHEN buseo = '총무부' THEN 'O'
        END
    ) AS 총무부,
    COUNT(
        CASE
            WHEN buseo = '개발부' THEN 'O'
        END
    ) AS 개발부,
    COUNT(
        CASE
            WHEN buseo NOT IN ('기획부', '총무부', '개발부') THEN 'O'
        END
    ) AS 기타
FROM
    tblInsa;

SELECT SUM(height), SUM(weight) FROM tblComedian;

SELECT
    SUM(basicPay) AS "급여 지급액",
    SUM(sudang) AS "수당 지급액",
    (SUM(basicPay) + SUM(sudang)) AS "총 지급액 1",
    SUM(basicPay + sudang) AS "총 지급액 2"
FROM
    tblInsa;

SELECT ROUND(SUM(population) / COUNT(*)) FROM tblCountry;
SELECT ROUND(SUM(population) / COUNT(population)) FROM tblCountry;

-- 값이 NULL이 아닌 행들의 평균이 반환된다.
SELECT ROUND(AVG(population)) FROM tblCountry;

SELECT MIN(sudang), MAX(sudang) FROM tblInsa;
SELECT MIN(name), MAX(name) FROM tblInsa;
SELECT MIN(ibsaDate), MAX(ibsaDate) FROM tblInsa;

SELECT
    COUNT(*) AS "총 직원 수",
    SUM(basicPay) AS "총 급여액",
    ROUND(AVG(basicPay)) AS 평균급여,
    MIN(basicPay) AS 최저급여,
    max(basicPay) AS 최고급여
FROM
    tblInsa;

-- ORA-00937: not a single-group group function
SELECT name, COUNT(*) FROM tblInsa;

-- ORA-00934: group function is not allowed here
SELECT * FROM tblInsa WHERE basicPay >= AVG(basicPay);
