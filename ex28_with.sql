/*
    ▶ NVL(컬럼명, 대체할 값)
    ▶ NVL2(컬럼명, 대체할 값, 대체할 값)
*/

SELECT * FROM (SELECT name, buseo, jikwi FROM tblInsa WHERE city = '서울');
 
WITH seoul AS (
    SELECT * FROM (SELECT name, buseo, jikwi FROM tblInsa WHERE city = '서울')
)
SELECT * FROM seoul;

SELECT
    *
FROM (
    SELECT name, age, couple FROM tblMen WHERE weight < 90
) m
    INNER JOIN (
        SELECT name, age, couple FROM tblWomen WHERE weight > 60
    ) w
        ON w.name = m.couple;

WITH m AS (
    SELECT name, age, couple FROM tblMen WHERE weight < 90
),
w AS (
    SELECT name, age, couple FROM tblWomen WHERE weight > 60
)
SELECT
    *
FROM
    m
        INNER JOIN w
            ON w.name = m.couple;

SELECT
    name,
    CASE
       WHEN population IS NOT NULL THEN population
       WHEN population IS NULL THEN 0
    END
FROM
    tblCountry;

SELECT name, NVL(population, 0) FROM tblCountry;

CREATE TABLE tblItem (
	seq NUMBER PRIMARY KEY,
	name VARCHAR2(100) NOT NULL,
	color VARCHAR2(50) NOT NULL
);

INSERT INTO tblItem (seq, name, color) VALUES ((SELECT (NVL(MAX(seq), 0) + 1) FROM tblItem), '마우스', 'white');

SELECT * FROM tblItem;

SELECT name, NVL2(population, population, 0) FROM tblCountry;
SELECT name, NVL2(population, '인구 O', '인구 X') FROM tblCountry;
