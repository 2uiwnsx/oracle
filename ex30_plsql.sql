/*
    ▶ 프로시저(Procedure) : 단일 함수처럼 실행되는 쿼리의 집합
    
        ▷ 익명 프로시저
        ▷ 실명 프로시저
        
    ----------------------------------------------------------
    
    ▶ 익명 프로시저 구조

        ▷ [DECLARE] : 선언부
        
            ◆ 변수명 자료형 [제약 조건];
            ◆ CURSOR 커서명 IS SELECT 문;
            
        ▷ BEGIN ~ END : 실행부(구현부)
        
            ◆ OPEN 커서명;
            ◆ 실행 코드;
            ◆ CLOSE 커서명;
            
        ▷ [EXCEPTION] : 예외처리부
          
            ◆ WHEN 예외명 THEN 예외 처리 코드;
            ◆ WHEN OTHERS THEN 예외 처리 코드;
        
    ----------------------------------------------------------
    
    ▶ 서버 출력 활성화 방법
    
        ▷ SET SERVEROUTPUT ON; 또는 SET SERVEROUT ON;
        
    ▶ 서버 출력 비활성화 방법
    
        ▷ SET SERVEROUTPUT OFF;
*/

SET SERVEROUTPUT ON;
SET SERVEROUT ON;

SET SERVEROUTPUT OFF;

DECLARE
    num NUMBER;
    name VARCHAR2(30);
    today DATE;
BEGIN
    num := 10;
    
    DBMS_OUTPUT.PUT_LINE(num);
    
    name := '홍길동';
    
    DBMS_OUTPUT.PUT_LINE(name);
    
    today := SYSDATE;
    
    DBMS_OUTPUT.PUT_LINE(today);
END;
/

DECLARE
    num1 NUMBER;
    num2 NUMBER;
    num3 NUMBER := 30;
    num4 NUMBER DEFAULT 40;
    num5 NUMBER NOT NULL := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE(num1);
    
    num2 := 20;
    
    DBMS_OUTPUT.PUT_LINE(num2);
    DBMS_OUTPUT.PUT_LINE(num3);
    DBMS_OUTPUT.PUT_LINE(num4);
    
    num4 := 400;
    
    DBMS_OUTPUT.PUT_LINE(num4);
    DBMS_OUTPUT.PUT_LINE(num5);
END;
/

DECLARE
    vBuseo VARCHAR2(15);
BEGIN
    SELECT buseo INTO vBuseo FROM tblInsa WHERE name = '홍길동';
    
    DBMS_OUTPUT.PUT_LINE(vBuseo);
END;
/

CREATE TABLE tblName (
    name VARCHAR2(15)
);

INSERT INTO tblName (name) VALUES ((SELECT name FROM tblInsa WHERE (buseo = '개발부') AND (jikwi = '부장')));

SELECT * FROM tblName;

DECLARE
    vName VARCHAR2(15);
BEGIN
    SELECT name INTO vName FROM tblInsa WHERE (buseo = '개발부') AND (jikwi = '부장');
    
    INSERT INTO tblName (name) VALUES (vName);
END;
/

SELECT * FROM tblName;

DECLARE
    vName VARCHAR2(15);
    vBuseo VARCHAR2(15);
    vJikwi VARCHAR2(15);
    vBasicPay NUMBER;
BEGIN
    SELECT name, buseo, jikwi, basicPay INTO vName, vBuseo, vJikwi, vBasicPay FROM tblInsa WHERE num = 1001;
    
    DBMS_OUTPUT.PUT_LINE(vName);
    DBMS_OUTPUT.PUT_LINE(vBuseo);
    DBMS_OUTPUT.PUT_LINE(vJikwi);
    DBMS_OUTPUT.PUT_LINE(vBasicPay);
END;
/

DECLARE
    vBuseo tblInsa.buseo%TYPE;
BEGIN
    SELECT buseo INTO vBuseo FROM tblInsa WHERE name = '홍길동';
    
    DBMS_OUTPUT.PUT_LINE(vBuseo);
END;
/

DECLARE
    vName tblInsa.name%TYPE;
    vBuseo tblInsa.buseo%TYPE;
    vJikwi tblInsa.jikwi%TYPE;
    vBasicPay tblInsa.basicPay%TYPE;
BEGIN
    SELECT name, buseo, jikwi, basicPay INTO vName, vBuseo, vJikwi, vBasicPay FROM tblInsa WHERE num = 1001;
    
    DBMS_OUTPUT.PUT_LINE(vName);
    DBMS_OUTPUT.PUT_LINE(vBuseo);
    DBMS_OUTPUT.PUT_LINE(vJikwi);
    DBMS_OUTPUT.PUT_LINE(vBasicPay);
END;
/

CREATE TABLE tblBonus (
    seq NUMBER PRIMARY KEY,
    num NUMBER(5) NOT NULL REFERENCES tblInsa(num),
    bonus NUMBER NOT NULL
);

DECLARE
    vNum tblInsa.num%TYPE;
    vBasicPay tblInsa.basicPay%TYPE;
BEGIN
    SELECT num, basicPay INTO vNum, vBasicPay FROM tblInsa WHERE (city = '서울') AND (jikwi = '부장') AND (buseo = '영업부');
    
    INSERT INTO tblBonus (seq, num, bonus) VALUES ((select (NVL(MAX(seq), 0) + 1) FROM tblBonus), vNum, (vBasicPay * 1.5));
END;
/

SELECT
    *
FROM
    tblBonus b
        INNER JOIN tblInsa i
            ON i.num = b.num;

DECLARE
    vName tblMen.name%TYPE;
    vAge tblMen.age%TYPE;
    vHeight tblMen.height%TYPE;
    vWeight tblMen.weight%TYPE;
    vCouple tblMen.couple%TYPE;
BEGIN
    SELECT name, age, height, weight, couple INTO vName, vAge, vHeight, vWeight, vCouple FROM tblMen WHERE name = '무명씨';
    
    INSERT INTO tblWomen (name, age, height, weight, couple) VALUES (vName, vAge, vHeight, vWeight, vCouple);
    
    DELETE FROM tblMen WHERE name = vName;
END;
/

SELECT * FROM tblWomen;

SELECT * FROM tblMen;

DECLARE
    vRow tblWomen%ROWTYPE;
BEGIN
    SELECT * INTO vRow FROM tblWomen WHERE name = '무명씨';
    
    DBMS_OUTPUT.PUT_LINE(vRow.name);
    DBMS_OUTPUT.PUT_LINE(vRow.age);
    DBMS_OUTPUT.PUT_LINE(vRow.height);
    DBMS_OUTPUT.PUT_LINE(vRow.weight);
    DBMS_OUTPUT.PUT_LINE(vRow.couple);
    
    INSERT INTO tblMen (name, age, height, weight, couple) VALUES (vRow.name, vRow.age, vRow.height, vRow.weight, vRow.couple);
    
    DELETE FROM tblWomen WHERE name = vRow.name;
END;
/

SELECT * FROM tblMen;

SELECT * FROM tblWomen;

DECLARE
    vNum NUMBER := 0;
BEGIN
    IF vNum > 0 THEN
        DBMS_OUTPUT.PUT_LINE('양수');
    ELSIF vNum < 0 THEN
        DBMS_OUTPUT.PUT_LINE('음수');
    ELSE
        DBMS_OUTPUT.PUT_LINE('0');
    END IF;
END;
/

DECLARE
    vGender CHAR(1);
BEGIN
    SELECT SUBSTR(ssn, 8, 1) INTO vGender FROM tblInsa WHERE num = 1035;

    IF vGender = '1' THEN
        DBMS_OUTPUT.PUT_LINE('남직원');
    ELSE
        DBMS_OUTPUT.PUT_LINE('여직원');
    END IF;
END;
/

DECLARE
    vNum tblInsa.num%TYPE;
    vJikwi tblInsa.jikwi%TYPE;
    vBasicPay tblInsa.basicPay%TYPE;
    vBonus NUMBER;
BEGIN
    SELECT num, jikwi, basicPay INTO vNum, vJikwi, vBasicPay FROM tblInsa WHERE num = 1040;
    
    IF vJikwi IN ('부장', '과장') THEN
        vBonus := vBasicPay * 1.5;
    ELSIF vJikwi IN ('대리', '사원') THEN
        vBonus := vBasicPay * 2;
    END IF;
    
    INSERT INTO tblBonus (seq, num, bonus) VALUES ((SELECT (NVL(MAX(seq), 0) + 1) FROM tblBonus), vNum, vBonus);
END;
/

SELECT
    *
FROM
    tblBonus b
        INNER JOIN tblInsa i
            ON i.num = b.num;

DECLARE
    vContinent tblCountry.continent%TYPE;
    vResult VARCHAR2(30);
BEGIN
    SELECT continent INTO vContinent FROM tblCountry WHERE name = '영국';
    
    IF vContinent = 'AS' THEN
        vResult := '아시아';
    ELSIF vContinent = 'EU' THEN
        vResult := '유럽';
    ELSIF vContinent = 'AF' THEN
        vResult := '기타';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(vResult);
    
    CASE
        WHEN vContinent = 'AS' THEN
            vResult := '아시아';
        WHEN vContinent = 'EU' THEN
            vResult := '유럽';
        WHEN vContinent = 'AF' THEN
            vResult := '아프리카';
        ELSE
            vResult := '기타';
    END CASE;
    
    DBMS_OUTPUT.PUT_LINE(vResult);
    
    CASE vContinent
        WHEN 'AS' THEN
            vResult := '아시아';
        WHEN 'EU' THEN
            vResult := '유럽';
        WHEN 'AF' THEN
            vResult := '아프리카';
        ELSE
            vResult := '기타';
    END CASE;

    DBMS_OUTPUT.PUT_LINE(vResult);
END;
/

BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('100');
    END LOOP;
END;
/

DECLARE
    vNum NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(vNum);
        
        vNum := vNum + 1;
        
        EXIT WHEN vNum > 10;
    END LOOP;
END;
/

CREATE TABLE tblLoop (
    seq NUMBER PRIMARY KEY,
    data VARCHAR2(100) NOT NULL
);

CREATE SEQUENCE loopSeq;

DECLARE
    vNum NUMBER := 1;
BEGIN
    LOOP
        INSERT INTO tblLoop VALUES (loopSeq.NEXTVAL, ('항목' || vNum));
        
        vNum := vNum + 1;
        
        EXIT WHEN vNum > 1000;
    END LOOP;
END;
/

SELECT * FROM tblLoop;

BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

BEGIN
    FOR i IN REVERSE 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

CREATE TABLE tblGugudan (
    dan NUMBER,
    num NUMBER,
    result NUMBER NOT NULL,
    CONSTRAINT PK_tblGugudan_dan_num PRIMARY KEY (dan, num)
);

DROP TABLE tblGugudan;

CREATE TABLE tblGugudan (
    dan NUMBER,
    num NUMBER,
    result NUMBER NOT NULL
);

ALTER TABLE tblGugudan ADD CONSTRAINT PK_tblGugudan_dan_num PRIMARY KEY (dan, num);

BEGIN
    FOR dan IN 2..9 LOOP
        FOR num IN 1.. 9 LOOP
            INSERT INTO tblGugudan (dan, num, result) VALUES (dan, num, (dan * num));
        END LOOP;
    END LOOP;
END;
/

SELECT * FROM tblGugudan;

DECLARE
    vNum NUMBER := 1;
BEGIN
    WHILE vNum <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE(vNum);
        
        vNum := vNum + 1;
    END LOOP;
END;
/

DECLARE
    CURSOR vCursor IS
        SELECT name FROM tblInsa;
    vName tblInsa.name%TYPE;
BEGIN
    OPEN vCursor;
    
    FOR i IN 1..60 LOOP
        FETCH vCursor INTO vName;
        
        DBMS_OUTPUT.PUT_LINE(vName);
    END LOOP;

    LOOP
        FETCH vCursor INTO vName;
        
        EXIT WHEN vCursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(vName);
    END LOOP;
        
    CLOSE vCursor;
END;
/

DECLARE
    CURSOR vCursor IS
        SELECT name, jikwi, basicPay FROM tblInsa WHERE buseo = '기획부';
    vName tblInsa.name%TYPE;
    vJikwi tblInsa.jikwi%TYPE;
    vBasicPay tblInsa.basicPay%TYPE;
BEGIN
    OPEN vCursor;
    
    LOOP
        FETCH vCursor INTO vname, vjikwi, vBasicPay;
        
        EXIT WHEN vCursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(vName || ', ' || vJikwi || ', ' || vBasicPay);
    END LOOP;
        
    CLOSE vCursor;
END;
/

DECLARE
    CURSOR vCursor IS
        SELECT num, jikwi, basicPay FROM tblInsa;
    vNum tblInsa.num%TYPE;
    vJikwi tblInsa.jikwi%TYPE;
    vBasicPay tblInsa.basicPay%TYPE;
    vBonus NUMBER;
BEGIN
    OPEN vCursor;
    
    LOOP
        FETCH vCursor INTO vNum, vJikwi, vBasicPay;
        
        EXIT WHEN vCursor%NOTFOUND;
        
        IF vJikwi IN ('부장', '과장') THEN
            vBonus := vBasicPay * 1.5;
        ELSIF vJikwi IN ('대리', '사원') THEN
            vBonus := vBasicPay * 2;
        END IF;
        
        INSERT INTO tblBonus (seq, num, bonus) VALUES ((SELECT (NVL(MAX(seq), 0) + 1) FROM tblBonus), vNum, vBonus);
    END LOOP;
        
    CLOSE vCursor;
END;
/

SELECT
    *
FROM
    tblBonus b
        INNER JOIN tblInsa i
            ON i.num = b.num;

DECLARE
    CURSOR vCursor IS
        SELECT * FROM tblInsa;
BEGIN
    FOR vRow IN vCursor LOOP
        DBMS_OUTPUT.PUT_LINE(vRow.name);
    END LOOP;
END;
/

DECLARE
    vName VARCHAR2(5);
BEGIN
    DBMS_OUTPUT.PUT_LINE('하나');
    
    SELECT name INTO vName FROM tblInsa WHERE num = 1001;
    
    DBMS_OUTPUT.PUT_LINE('둘');
    DBMS_OUTPUT.PUT_LINE(vName);    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리');
END;
/

CREATE TABLE tblLog (
    seq NUMBER PRIMARY KEY,
    code VARCHAR2(7) NOT NULL CHECK (code IN ('A001', 'B001', 'B002', 'C001')),
    message VARCHAR2(1000) NOT NULL,
    regdate DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE logSeq;

DECLARE
    vCnt NUMBER;
    vName tblInsa.name%TYPE;
BEGIN
    SELECT COUNT(*) INTO vCnt FROM tblCountry WHERE name = '태국';
    
    DBMS_OUTPUT.PUT_LINE(100 / vCnt);
    
    SELECT name INTO vName FROM tblInsa WHERE num = 1000;
    
    DBMS_OUTPUT.PUT_LINE(vName);
EXCEPTION
    WHEN zero_divide THEN
        DBMS_OUTPUT.PUT_LINE('zero_divide');
        
        INSERT INTO tblLog VALUES (logSeq.NEXTVAL, 'B001', '값이 존재하지 않습니다.', DEFAULT);
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('no_data_found');
        
        INSERT INTO tblLog VALUES (logSeq.NEXTVAL, 'A001', '존재하지 않는 직원입니다.', DEFAULT);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('others');

        INSERT INTO tblLog VALUES (logSeq.NEXTVAL, 'C001', '기타 예외가 발생했습니다.', DEFAULT);
END;
/

SELECT * FROM tblLog;
