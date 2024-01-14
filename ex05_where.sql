/*
    ▶ 와일드카드 문자
    
        ▷ _ : 하나의 문자
        ▷ % : 0개 이상의 문자
*/

SELECT * FROM tblCountry WHERE name = '대한민국';
SELECT * FROM tblCountry WHERE capital = '카이로';
SELECT * FROM tblCountry WHERE population >= 4405;
SELECT * FROM tblCountry WHERE (area >= 20) AND (population <= 10000);
SELECT * FROM tblCountry WHERE (continent = 'AS') OR (continent = 'EU');

SELECT * FROM tblComedian WHERE (height < 170) AND (weight >= 60);
SELECT * FROM tblComedian WHERE (gender = 'f') AND (weight <= 70);

SELECT * FROM tblInsa WHERE name > '이순신';
SELECT * FROM tblInsa WHERE (basicPay + sudang) >= 2000000;
SELECT * FROM tblInsa WHERE (buseo = '개발부') AND (basicPay >= 1500000);

-- 모든 행이 조회된다.
SELECT * FROM tblInsa WHERE 1 = 1;

SELECT * FROM tblInsa WHERE buseo IN ('개발부', '총무부');

SELECT * FROM employees WHERE first_name BETWEEN 'J' AND 'L';

SELECT * FROM tblInsa WHERE basicPay BETWEEN 1000000 AND 1200000;
SELECT * FROM tblInsa WHERE ibsaDate BETWEEN '2000-01-01' AND '2000-12-31';

SELECT * FROM tblInsa WHERE name LIKE '김__';
SELECT * FROM tblInsa WHERE name LIKE '김%';

SELECT * FROM tblInsa WHERE tel IS NULL;
SELECT * FROM tblInsa WHERE tel IS NOT NULL;

SELECT * FROM tblTodo WHERE completeDate IS NULL;
SELECT * FROM tblTodo WHERE completeDate IS NOT NULL;
