SELECT name, buseo, ROWNUM FROM tblInsa;
SELECT name, buseo, ROWNUM FROM tblInsa WHERE ROWNUM = 1;
SELECT name, buseo, ROWNUM FROM tblInsa WHERE ROWNUM <= 5;

SELECT name, buseo, basicPay, ROWNUM FROM tblInsa ORDER BY basicPay DESC;
SELECT name, buseo, basicPay, ROWNUM FROM (SELECT name, buseo, basicPay FROM tblInsa ORDER BY basicPay DESC) WHERE ROWNUM <= 5;

SELECT
    name,
    buseo,
    basicPay,
    ROWNUM
FROM (
    SELECT
        name,
        buseo,
        basicPay,
        ROWNUM AS rnum
    FROM (
        SELECT name, buseo, basicPay FROM tblInsa ORDER BY basicPay DESC
    )
)
WHERE
	rnum BETWEEN 6 AND 10;

SELECT * FROM tblAddressBook ORDER BY name;
SELECT a.*, ROWNUM FROM (SELECT * FROM tblAddressBook ORDER BY name) a;

SELECT
    *
FROM (
    SELECT a.*, ROWNUM AS rnum FROM (SELECT * FROM tblAddressBook ORDER BY name) a
)
WHERE
	rnum BETWEEN 1 AND 20;

CREATE OR REPLACE VIEW vwAddressBook AS (
    SELECT a.*, ROWNUM AS rnum FROM (SELECT * FROM tblAddressBook ORDER BY name) a
);
	 
SELECT * FROM vwAddressBook WHERE rnum BETWEEN 1 AND 20;
