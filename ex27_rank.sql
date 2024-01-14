/*
    ▶ 순위 함수
    
        ▷ RANK() OVER (ORDER BY 컬럼명 [ASC|DESC])
        ▷ DENSE_RANK() OVER (ORDER BY 컬럼명 [ASC|DESC])
        ▷ ROW_NUMBER() OVER (ORDER BY 컬럼명 [ASC|DESC])
*/

SELECT name, buseo, basicPay, ROWNUM FROM (SELECT name, buseo, basicPay FROM tblInsa ORDER BY basicPay DESC);

SELECT
    name,
    buseo,
    basicPay,
    (RANK() OVER(ORDER BY basicPay DESC)) AS rnum
FROM
    tblInsa;

SELECT
    name,
    buseo,
    basicPay,
    (DENSE_RANK() OVER (ORDER BY basicPay DESC)) AS rnum
FROM
    tblInsa;

SELECT
    name,
    buseo,
    basicPay,
    (ROW_NUMBER() OVER (ORDER BY basicPay DESC)) AS rnum
FROM
    tblInsa;

SELECT
    name,
    buseo,
    basicPay,
    (RANK() OVER (PARTITION BY buseo ORDER BY basicPay DESC)) AS rnum
FROM
    tblInsa;

SELECT
    *
FROM (
    SELECT
        name,
        buseo,
        basicPay,
        (RANK() OVER (PARTITION BY buseo ORDER BY basicPay DESC)) AS rnum
    FROM
        tblInsa
)
WHERE
	rnum = 5;
