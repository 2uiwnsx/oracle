SELECT height FROM tblWomen WHERE couple = (SELECT name FROM tblMen WHERE height = 166);

SELECT * FROM tblInsa WHERE basicPay >= (SELECT AVG(basicPay) FROM tblInsa);
SELECT name FROM tblInsa WHERE buseo IN (SELECT buseo FROM tblInsa WHERE basicPay >= 2600000);

SELECT
    *
FROM
    tblInsa
WHERE
    (city = (
        SELECT city FROM tblInsa WHERE name = '홍길동'
    ))
	AND
    (buseo = (
        SELECT buseo FROM tblInsa WHERE name = '홍길동'
    ));

SELECT * FROM tblInsa WHERE (buseo, city) = (SELECT buseo, city FROM tblInsa WHERE name = '홍길동');
SELECT * FROM tblInsa WHERE (buseo, city) IN (SELECT buseo, city FROM tblInsa WHERE basicPay >= 2600000);

SELECT name, buseo, basicPay, (SELECT ROUND(AVG(basicPay)) FROM tblInsa) AS avg FROM tblInsa;
SELECT name, buseo, basicPay, (SELECT ROUND(AVG(basicPay)) FROM tblInsa WHERE buseo = i.buseo) AS avg FROM tblInsa i;

SELECT
    name AS "남자 이름",
    height AS "남자 키",
    weight AS "남자 몸무게",
    couple AS "여자 이름",
    (SELECT height FROM tblWomen WHERE name = tblMen.couple) AS "여자 키",
    (SELECT weight FROM tblWomen WHERE name = tblMen.couple) AS "여자 몸무게"
FROM
    tblMen
ORDER BY
    "여자 키";

SELECT name, gender FROM (SELECT name, SUBSTR(ssn, 8, 1) AS gender FROM tblInsa);
