SELECT * FROM tblInsa ORDER BY name;
SELECT * FROM tblInsa ORDER BY basicPay;
SELECT * FROM tblInsa ORDER BY ibsaDate;

SELECT * FROM tblInsa ORDER BY buseo, jikwi DESC;
SELECT * FROM tblInsa ORDER BY (basicPay + sudang) DESC;

SELECT name, buseo, jikwi FROM tblInsa ORDER BY 1;
SELECT name, buseo, jikwi FROM tblInsa ORDER BY 2;
SELECT name, buseo, jikwi FROM tblInsa ORDER BY 3;

SELECT
    name,
    jikwi,
    CASE
        WHEN jikwi = '부장' THEN 4
        WHEN jikwi = '과장' THEN 3
        WHEN jikwi = '대리' THEN 2
        WHEN jikwi = '사원' THEN 1
    END AS jikwiSeq
FROM
    tblInsa
ORDER BY
    jikwiSeq DESC;

SELECT
    name,
    jikwi
FROM
    tblInsa
ORDER BY
    CASE
		WHEN jikwi = '부장' THEN 4
		WHEN jikwi = '과장' THEN 3
		WHEN jikwi = '대리' THEN 2
		WHEN jikwi = '사원' THEN 1
	END DESC;

SELECT
    name,
    ssn
FROM
    tblInsa
ORDER BY
	CASE
		WHEN ssn LIKE '%-1%' THEN 1
		WHEN ssn LIKE '%-2%' THEN 2
	END;
	
SELECT
    *
FROM
    tblInsa
WHERE
	CASE
		WHEN ssn LIKE '%-1%' THEN 1
		WHEN ssn LIKE '%-2%' THEN 2
	END = 1;
