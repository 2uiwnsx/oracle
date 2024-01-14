SELECT gender, COUNT(*) FROM tblComedian GROUP BY gender;
SELECT gender, MIN(height), MAX(height), MIN(weight), MAX(weight), AVG(height), AVG(weight) FROM tblComedian GROUP BY gender;

SELECT
    buseo,
    COUNT(*) AS "총 직원 수",
    SUM(basicPay) AS "총 급여액",
    ROUND(AVG(basicPay)) AS 평균급여,
    MIN(basicPay) AS 최저급여,
    MAX(basicPay) AS 최고급여 
FROM
    tblInsa
GROUP BY
    buseo;

SELECT
    buseo AS 부서명,
    COUNT(*) AS "총 직원 수",
    COUNT(DECODE(jikwi, '부장', 1)) AS 부장,
    COUNT(DECODE(jikwi, '과장', 1)) AS 과장,
    COUNT(DECODE(jikwi, '대리', 1)) AS 대리,
    COUNT(DECODE(jikwi, '사원', 1)) AS 사원
FROM
    tblInsa
GROUP BY
    buseo
ORDER BY
    buseo;

SELECT (((FLOOR(basicPay / 1000000) + 1) * 100) || '만원 이하') AS money, COUNT(*) FROM tblInsa GROUP BY FLOOR(basicPay / 1000000);

SELECT
    SUBSTR(address, 1, INSTR(address, ' ') - 1) AS "시/도",
    COUNT(*) AS 인구
FROM
	tblAddressBook
GROUP BY
    SUBSTR(address, 1, INSTR(address, ' ') - 1)
ORDER BY
    인구 DESC;

SELECT
    CASE
        WHEN completeDate IS NOT NULL THEN 1
        ELSE 2
    END,
    COUNT(*)
FROM
    tblTodo
GROUP BY
    CASE
        WHEN completeDate IS NOT NULL THEN 1
        ELSE 2
    END;

SELECT buseo, jikwi, COUNT(*) FROM tblInsa GROUP BY buseo, jikwi ORDER BY buseo;

SELECT buseo, COUNT(*), SUM(basicPay), ROUND(AVG(basicPay)), MIN(basicPay), MAX(basicPay) FROM tblInsa GROUP BY ROLLUP(buseo);
SELECT buseo, jikwi, COUNT(*), SUM(basicPay), ROUND(AVG(basicPay)), MIN(basicPay), MAX(basicPay) FROM tblInsa GROUP BY ROLLUP(buseo, jikwi);

SELECT buseo, COUNT(*), SUM(basicPay), ROUND(AVG(basicPay)), MIN(basicPay), MAX(basicPay) FROM tblInsa GROUP BY CUBE(buseo);
SELECT buseo, jikwi, COUNT(*), SUM(basicPay), ROUND(AVG(basicPay)), MIN(basicPay), MAX(basicPay) FROM tblInsa GROUP BY CUBE(buseo, jikwi);

SELECT buseo, COUNT(*) FROM tblInsa GROUP BY buseo HAVING COUNT(*) >= 10;
SELECT buseo, COUNT(*) FROM tblInsa WHERE jikwi IN ('과장', '부장') GROUP BY buseo HAVING COUNT(*) >= 3;
