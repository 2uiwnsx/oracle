/*
    ▶ 연산자(Operator)
    
        ▷ 산술 연산자 : +, -, *, /
        ▷ 비교 연산자 : >, >=, <, <=, =, <>
        ▷ 논리 연산자 : AND, OR, NOT
        ▷ 대입 연산자 : =
        ▷ 문자열 연산자 : ||
        ▷ SQL 연산자 : IN, BETWEEN, LIKE, IS 등
        
    ----------------------------------------------------------
    
    ▶ AS : 테이블 및 컬럼에 대한 별칭(Alias)을 정의하는 키워드
*/

SELECT population, area, (population + area), (population - area), (population * area), (population / area) FROM tblCountry;

SELECT name, couple, (name || couple) FROM tblMen;
SELECT height, weight FROM tblMen WHERE height > weight;

SELECT name, age, (age - 1) AS 나이, LENGTH(name) AS "이름의 길이", couple AS 여자친구, name "select" FROM tblMen;

SELECT m.name, m.age, m.height, m.weight, m.couple FROM tblMen m;
SELECT tblMen.name, tblMen.age, tblMen.height, tblMen.weight, tblMen.couple FROM tblMen;
