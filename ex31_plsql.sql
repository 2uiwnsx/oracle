/*
    ▶ 실명 프로시저 구조
    
        ▷ CREATE [OR REPLACE] PROCEDURE 프로시저명
        
        ▷ IS(또는 AS) : 선언부
        
            ◆ 변수명 자료형 [제약 조건];
            ◆ CURSOR 커서명 IS SELECT 문;
            
        ▷ BEGIN ~ END: 실행부(구현부)
        
            ◆ OPEN 커서명;
            ◆ 실행 코드;
            ◆ CLOSE 커서명;
            
        ▷ [EXCEPTION] : 예외처리부
          
            ◆ WHEN 예외명 THEN 예외 처리 코드;
            ◆ WHEN OTHERS THEN 예외 처리 코드;
*/

CREATE OR REPLACE PROCEDURE procTest
IS
	vNum NUMBER;
BEGIN
	vNum := 100;
    
	DBMS_OUTPUT.PUT_LINE(vNum);
END procTest;
/

BEGIN
	procTest;
END;
/

CREATE OR REPLACE PROCEDURE procTest(
	pNum NUMBER
)
IS
	vResult NUMBER;
BEGIN
	vResult := pNum * 2;
    
	DBMS_OUTPUT.PUT_LINE(vResult);
END procTest;
/

BEGIN
	procTest(100);
	procTest(200);
	procTest(300);
END;
/

CALL procTest(400);
EXEC procTest(500);
EXECUTE procTest(600);

CREATE OR REPLACE PROCEDURE procTest(
    height NUMBER,
    width NUMBER
)
IS
    vResult NUMBER;
BEGIN
    vResult := height * width;
    
    DBMS_OUTPUT.PUT_LINE(vResult);
END procTest;
/

BEGIN
    procTest(10, 20);
END;
/

CREATE OR REPLACE PROCEDURE procTest(
    name VARCHAR2
)
IS
BEGIN
     DBMS_OUTPUT.PUT_LINE(name || '님, 안녕하세요.');
END procTest;
/

BEGIN
    procTest('홍길동');
END;
/

CREATE OR REPLACE PROCEDURE procTest(
    height NUMBER,
    width NUMBER DEFAULT 10
)
IS
    vResult NUMBER;
BEGIN
    vResult := height * width;
    
    DBMS_OUTPUT.PUT_LINE(vResult);
END procTest;
/

BEGIN
    procTest(20);
END;
/

CREATE OR REPLACE PROCEDURE procTest(
    pNum1 IN NUMBER,
    pNum2 IN NUMBER,
    pResult1 OUT NUMBER,
    pResult2 OUT NUMBER,
    pResult3 OUT NUMBER
)
IS
BEGIN
    pResult1 := pNum1 + pNum2;
    pResult2 := pNum1 - pNum2;
    pResult3 := pNum1 * pNum2;
END procTest;
/

DECLARE
    vNum1 NUMBER;
    vNum2 NUMBER;
    vNum3 NUMBER;
BEGIN
    procTest(10, 20, vNum1, vNum2, vNum3);
    
    DBMS_OUTPUT.PUT_LINE(vNum1);
    DBMS_OUTPUT.PUT_LINE(vNum2);
    DBMS_OUTPUT.PUT_LINE(vNum3);
END;
/

CREATE OR REPLACE PROCEDURE procTest1(
    pBuseo IN VARCHAR2,
    pNum OUT NUMBER
)
IS
BEGIN
    SELECT num INTO pNum FROM tblInsa WHERE (buseo = pBuseo) AND (basicPay = (SELECT MAX(basicPay) FROM tblInsa WHERE buseo = pBuseo));
END procTest1;
/

CREATE OR REPLACE PROCEDURE procTest2(
    pNum IN NUMBER,
    pCnt1 OUT NUMBER,
    pCnt2 OUT NUMBER,
    pCnt3 OUT NUMBER
)
IS
BEGIN
    SELECT count(*) INTO pCnt1 FROM tblInsa WHERE city = (SELECT city FROM tblInsa WHERE num = pNum);
    SELECT count(*) INTO pCnt2 FROM tblInsa WHERE jikwi = (SELECT jikwi FROM tblInsa WHERE num = pNum);
    SELECT count(*) INTO pCnt3 FROM tblInsa WHERE basicPay > (SELECT basicPay FROM tblInsa WHERE num = pNum);
END procTest2;
/

DECLARE
    vNum NUMBER;
    vCnt1 NUMBER;
    vCnt2 NUMBER;
    vCnt3 NUMBER;
BEGIN
    procTest1('개발부', vNum);
    
    procTest2(vNum, vCnt1, vCnt2, vCnt3);
    
    DBMS_OUTPUT.PUT_LINE(vCnt1);
    DBMS_OUTPUT.PUT_LINE(vCnt2);
    DBMS_OUTPUT.PUT_LINE(vCnt3);
END;
/

DELETE FROM tblProject;

DELETE FROM tblStaff;

INSERT INTO tblStaff (seq, name, salary, address) VALUES (1, '홍길동', 300, '서울시');
INSERT INTO tblStaff (seq, name, salary, address) VALUES (2, '아무개', 250, '인천시');
INSERT INTO tblStaff (seq, name, salary, address) VALUES (3, '하하하', 250, '부산시');

SELECT * FROM tblStaff;

INSERT INTO tblProject (seq, project, staffSeq) VALUES (1, '홍콩 수출', 1);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (2, 'TV 광고', 2);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (3, '매출 분석', 3);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (4, '노조 협상', 1);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (5, '대리점 분양', 2);

SELECT * FROM tblProject;

COMMIT;

CREATE OR REPLACE PROCEDURE procDeleteStaff(
    pSeq NUMBER,
    pStaff NUMBER,
    pResult OUT NUMBER
)
IS
    vCnt NUMBER;
BEGIN
    SELECT COUNT(*) INTO vCnt FROM tblProject WHERE staffSeq = pSeq;

    IF vCnt > 0 THEN
        UPDATE tblProject SET staffSeq = pStaff WHERE staffSeq = pSeq;
    ELSE
        NULL;
    END IF;
    
    DELETE FROM tblStaff WHERE seq = pSeq;
    
    pResult := 1;
EXCEPTION
    WHEN OTHERS THEN
        pResult := 0;
END procDeleteStaff;
/

DECLARE
    vResult NUMBER;
BEGIN
    procDeleteStaff(1, 3, vResult);
    
    IF vResult = 1 THEN
        DBMS_OUTPUT.PUT_LINE('퇴사 성공');
    ELSE
        DBMS_OUTPUT.PUT_LINE('퇴사 실패');
    END IF;
END;
/

SELECT * FROM tblProject;

SELECT * FROM tblStaff;

INSERT INTO tblStaff VALUES (4, '호호호', 200, '서울시');

SELECT * FROM tblStaff;

CREATE OR REPLACE PROCEDURE procDeleteStaff(
    pSeq NUMBER,
    pResult OUT NUMBER
)
IS
    vCnt NUMBER;
    vStaff Number;
BEGIN
    SELECT COUNT(*) INTO vCnt FROM tblProject WHERE staffSeq = pSeq;
    
    IF vCnt > 0 THEN
        SELECT
            seq INTO vStaff
        FROM (
            SELECT
                s.seq
            FROM
                tblStaff s
                    LEFT OUTER JOIN tblProject p
                        ON p.staffSeq = s.seq
            GROUP BY
                s.seq
            HAVING
                COUNT(p.staffSeq) = (
                    SELECT
                        MIN(COUNT(p.staffSeq))
                    FROM
                        tblStaff s
                            LEFT OUTER JOIN tblProject p
                                ON p.staffSeq = s.seq
                    GROUP BY
                        s.seq
                )
        )
        WHERE
            ROWNUM = 1;
        
        UPDATE tblProject SET staffSeq = vStaff WHERE staffSeq = pSeq;
    ELSE
        NULL;
    END IF;
    
    DELETE FROM tblStaff WHERE seq = pSeq;
    
    pResult := 1;
EXCEPTION
    WHEN OTHERS THEN
        pResult := 0;
END procDeleteStaff;
/

CREATE OR REPLACE PROCEDURE procSum(
	num1 IN NUMBER,
	num2 IN NUMBER,
	pResult OUT NUMBER
)
IS
BEGIN
	pResult := num1 + num2;
END procSum;
/

CREATE OR REPLACE FUNCTION fnSum(
    num1 IN NUMBER,
    num2 IN NUMBER
) RETURN NUMBER
IS
BEGIN
    RETURN (num1 + num2);
END fnSum;
/

DECLARE
	vResult NUMBER;
BEGIN
	procSum(10, 20, vResult);
    
	DBMS_OUTPUT.PUT_LINE(vResult);
    
    vResult := fnSum(10, 20);
    
    DBMS_OUTPUT.PUT_LINE(vResult);
END;
/

SELECT name, basicPay, sudang, fnSum(basicPay, sudang) from tblInsa;

CREATE OR REPLACE FUNCTION fnGender(
    pSsn VARCHAR2
) RETURN VARCHAR2
IS
BEGIN
    RETURN
        CASE
            WHEN SUBSTR(pSsn, 8, 1) = '1' THEN '남자'
            WHEN SUBSTR(pSsn, 8, 1) = '2' THEN '여자'
        END;
END fnGender;
/

SELECT
    name,
    buseo,
    jikwi,
    CASE
        WHEN SUBSTR(ssn, 8, 1) = '1' THEN '남자'
        WHEN SUBSTR(ssn, 8, 1) = '2' THEN '여자'
    END AS g1,
    fnGender(ssn) AS g2
FROM
    tblInsa;

CREATE OR REPLACE TRIGGER trgInsa
    BEFORE DELETE ON tblInsa
BEGIN
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'HH24:MI:SS') || ' 트리거가 실행되었습니다.');
    
    IF TO_CHAR(SYSDATE, 'DY') = '월' THEN
        RAISE_APPLICATION_ERROR(-20001, '월요일에는 퇴사가 불가합니다.');
    END IF;
END trgInsa;
/

DELETE FROM tblBonus;

DELETE FROM tblInsa WHERE num = 1010;

SELECT * FROM tblInsa;

ROLLBACK;

COMMIT;

CREATE TABLE tblDiaryLog (
    seq NUMBER PRIMARY KEY,
    message VARCHAR2(1000) NOT NULL,
    regdate DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE diaryLogSeq;

CREATE OR REPLACE TRIGGER trgDiary
    AFTER INSERT OR UPDATE OR DELETE ON tblDiary
DECLARE
    vMessage VARCHAR2(1000);
BEGIN
    IF INSERTING THEN
        vMessage := '데이터가 추가되었습니다.';
    ELSIF UPDATING THEN
        vMessage := '데이터가 수정되었습니다.';
    ELSIF DELETING THEN
        vMessage := '데이터가 삭제되었습니다.';
    END IF;
    
    INSERT INTO tblDiaryLog VALUES (diaryLogSeq.NEXTVAL, vMessage, DEFAULT);
END trgDairy;
/

INSERT INTO tblDiary values (11, '프로시저를 공부했다.', '흐림', SYSDATE);

SELECT * FROM tblDiary;

SELECT * FROM tblDiaryLog;

UPDATE tblDiary SET subject = '프로시저를 복습했다.' where seq = 11;

SELECT * FROM tblDiary;

SELECT * FROM tblDiaryLog;

DELETE FROM tblDiary WHERE seq = 11;

SELECT * FROM tblDiary;

SELECT * FROM tblDiaryLog;

CREATE OR REPLACE TRIGGER trgMen
    AFTER DELETE ON tblMen
    FOR EACH ROW
BEGIN
     DBMS_OUTPUT.PUT_LINE(:OLD.name || ' 데이터가 삭제되었습니다.');
END trgMen;
/

DELETE FROM tblMen WHERE name = '홍길동';

SELECT * FROM tblMen;

DELETE FROM tblMen WHERE age < 25;

SELECT * FROM tblMen;

ROLLBACK;

SELECT * FROM tblMen;

CREATE OR REPLACE TRIGGER trgMen
    AFTER UPDATE ON tblMen
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(:OLD.name || ' 데이터를 수정했습니다.');
    DBMS_OUTPUT.PUT_LINE('수정 전 나이: ' || :OLD.age);
    DBMS_OUTPUT.PUT_LINE('수정 후 나이: ' || :NEW.age);
END trgMen;
/

SELECT * FROM tblMen;

UPDATE tblMen SET age = (age + 1) WHERE name = '홍길동';

SELECT * FROM tblMen;

UPDATE tblMen SET age = (age + 1);

SELECT * FROM tblMen;

CREATE OR REPLACE TRIGGER trgDeleteStaff
    BEFORE DELETE ON tblStaff
    FOR EACH ROW
BEGIN
    UPDATE tblProject SET staffSeq = 4 WHERE staffSeq = :OLD.seq;
END trgDeleteStaff;
/

DELETE FROM tblStaff WHERE seq = 2;

SELECT * FROM tblStaff;

SELECT * FROM tblProject;

CREATE TABLE tblUser (
    id VARCHAR2(30) PRIMARY KEY,
    point NUMBER DEFAULT 1000 NOT NULL
);

CREATE TABLE tblBoard (
    seq NUMBER PRIMARY KEY,
    subject VARCHAR2(1000) NOT NULL,
    id VARCHAR2(30) NOT NULL REFERENCES tblUser(id)
);

CREATE SEQUENCE boardSeq;

INSERT INTO tblUser VALUES ('hong', DEFAULT);

SELECT * FROM tblUser;

INSERT INTO tblBoard VALUES (boardSeq.NEXTVAL, '게시글', 'hong');

SELECT * FROM tblBoard;

UPDATE tblUser SET point = (point + 100) WHERE id = 'hong';

SELECT * FROM tblUser;

DELETE FROM tblBoard where seq = 1;

SELECT * FROM tblBoard;

UPDATE tblUser SET point = (point - 50) WHERE id = 'hong';

SELECT * FROM tblUser;

CREATE OR REPLACE PROCEDURE procAddBoard(
    pSubject VARCHAR2,
    pId VARCHAR2
)
IS
BEGIN
    INSERT INTO tblBoard VALUES (boardSeq.NEXTVAL, pSubject, pId);
    
    UPDATE tblUser SET point = (point + 100) WHERE id = pId;
END procAddBoard;
/

CREATE OR REPLACE PROCEDURE procDeleteBoard(
    pSeq NUMBER
)
IS
    vId VARCHAR2(30);
BEGIN
    SELECT id INTO vId FROM tblBoard WHERE seq = pSeq;
    
    DELETE FROM tblBoard WHERE seq = pSeq;
    
    UPDATE tblUser SET point = (point - 50) WHERE id = vId;
END procDeleteBoard;
/

BEGIN
    procAddBoard('게시글', 'hong');
    
    procDeleteBoard(2);
END;
/

SELECT * FROM tblBoard;

SELECT * FROM tblUser;

CREATE OR REPLACE TRIGGER trgBoard
    AFTER INSERT OR DELETE ON tblBoard
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE tblUser SET point = (point + 100) WHERE id = :NEW.id;
    ELSIF DELETING THEN
        UPDATE tblUser SET point = (point - 50) WHERE id = :OLD.id;
    END IF;
END trgBoard;
/

INSERT INTO tblBoard VALUES (boardSeq.NEXTVAL, '게시글', 'hong');

SELECT * FROM tblBoard;

SELECT * FROM tblUser;

DELETE FROM tblBoard WHERE seq = 3;

SELECT * FROM tblBoard;

SELECT * FROM tblUser;

CREATE OR REPLACE PROCEDURE procBuseo(
    pBuseo VARCHAR2
)
IS
    CURSOR vCursor IS
        SELECT * FROM tblInsa WHERE buseo = pBuseo;
    vRow tblInsa%ROWTYPE;
BEGIN
    OPEN vCursor;
    
    LOOP
        FETCH vCursor INTO vRow;
        
        EXIT WHEN vCursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(vRow.name || ', ' || vRow.buseo);
    END LOOP;
    
    CLOSE vCursor;
END procBuseo;
/

BEGIN
    procBuseo('영업부');
END;
/

CREATE OR REPLACE PROCEDURE procBuseo(
    pBuseo VARCHAR2,
    pCursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN pCursor FOR
        SELECT * FROM tblInsa WHERE buseo = pBuseo;
END procBuseo;
/

DECLARE
    vCursor SYS_REFCURSOR;
    vRow tblInsa%ROWTYPE;
BEGIN
    procBuseo('영업부', vCursor);
    
    LOOP
        FETCH vCursor INTO vRow;
        
        EXIT WHEN vCursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(vRow.name);
    END LOOP;
END;
/

CREATE SEQUENCE todoSeq
    START WITH 25;

CREATE OR REPLACE PROCEDURE procAddTodo(
    pTitle VARCHAR2,
    pResult OUT NUMBER
)
IS
BEGIN
    INSERT INTO tblTodo (seq, title, addDate, completeDate) VALUES (todoSeq.NEXTVAL, pTitle, SYSDATE, NULL);
    
    pResult := 1;
EXCEPTION
    WHEN OTHERS THEN
        pResult := 0;
END procAddTodo;
/

DECLARE
    vResult NUMBER;
BEGIN
    procAddTodo('할일', vResult);
    
    DBMS_OUTPUT.PUT_LINE(vResult);
END;
/

SELECT * FROM tblTodo;

CREATE OR REPLACE PROCEDURE procCompleteTodo(
    pSeq IN NUMBER,
    pResult OUT NUMBER
)
IS
BEGIN
    UPDATE tblTodo SET completeDate = SYSDATE WHERE seq = pSeq;
    
    pResult := 1;
EXCEPTION
    WHEN OTHERS THEN
        pResult := 0;
END procCompleteTodo;
/

DECLARE
    vResult NUMBER;
BEGIN
    procCompleteTodo(25, vResult);
    
    DBMS_OUTPUT.PUT_LINE(vResult);
END;
/

SELECT * FROM tblTodo;

CREATE OR REPLACE PROCEDURE procDeleteTodo(
    pSeq NUMBER,
    pResult OUT NUMBER
)
IS
BEGIN
    DELETE FROM tblTodo WHERE seq = pSeq;
    
    pResult := 1;
EXCEPTION
    WHEN OTHERS THEN
        pResult := 0;
END procDeleteTodo;
/

DECLARE
    vResult NUMBER;
BEGIN
    procDeleteTodo(25, vResult);
    
    DBMS_OUTPUT.PUT_LINE(vResult);
END;
/

SELECT * FROM tblTodo;

CREATE OR REPLACE PROCEDURE procCountTodo(
    pCnt1 OUT NUMBER,
    pCnt2 OUT NUMBER,
    pCnt3 OUT NUMBER
)
IS
BEGIN
    SELECT COUNT(*) INTO pCnt1 FROM tblTodo WHERE completeDate IS NOT NULL;
    SELECT COUNT(*) INTO pCnt2 FROM tblTodo WHERE completeDate IS NULL;
    SELECT COUNT(*) INTO pCnt3 FROM tblTodo;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리');
END procCountTodo;
/

DECLARE
    vCnt1 NUMBER;
    vCnt2 NUMBER;
    vCnt3 NUMBER;
BEGIN
    procCountTodo(vCnt1, vCnt2, vCnt3);
    
    DBMS_OUTPUT.PUT_LINE(vCnt1);
    DBMS_OUTPUT.PUT_LINE(vCnt2);
    DBMS_OUTPUT.PUT_LINE(vCnt3);
END;
/

CREATE OR REPLACE PROCEDURE procCountTodo(
    pNum NUMBER,
    pCnt OUT NUMBER
)
IS
BEGIN
    IF pNum = 1 THEN
        SELECT COUNT(*) INTO pCnt FROM tblTodo WHERE completeDate IS NOT NULL;
    ELSIF pNum = 2 THEN
        SELECT COUNT(*) INTO pCnt FROM tblTodo WHERE completeDate IS NULL;
    ELSIF pNum = 3 THEN
        SELECT COUNT(*) INTO pCnt FROM tblTodo;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리');
END procCountTodo;
/

DECLARE
    vCnt NUMBER;
BEGIN
    procCountTodo(3, vCnt);
    
    DBMS_OUTPUT.PUT_LINE(vCnt);
END;
/

CREATE OR REPLACE PROCEDURE procGetTodo(
    pSeq NUMBER,
    pRow OUT tblTodo%ROWTYPE
)
IS
BEGIN
    SELECT * INTO pRow FROM tblTodo WHERE seq = pSeq;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리');
END procGetTodo;
/

DECLARE
    vRow tblTodo%ROWTYPE;
BEGIN
    procGetTodo(1, vRow);
    
    DBMS_OUTPUT.PUT_LINE(vRow.title);
END;
/

CREATE OR REPLACE PROCEDURE procGetTodoList(
    pNum NUMBER,
    pCursor OUT SYS_REFCURSOR
)
IS
BEGIN
    IF pNum = 1 THEN
        OPEN pCursor FOR
            SELECT * from tblTodo WHERE completeDate IS NOT NULL;
    ELSIF pNum = 2 THEN
        OPEN pCursor FOR
            SELECT * from tblTodo WHERE completeDate IS NULL;
    ELSIF pNum = 3 THEN
        OPEN pCursor FOR
            SELECT * from tblTodo;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리');
END procGetTodoList;
/

DECLARE
    vCursor SYS_REFCURSOR;
    vRow tblTodo%ROWTYPE;
BEGIN
    procGetTodoList(1, vCursor);
    
    LOOP
        FETCH vCursor INTO vRow;
        
        EXIT WHEN vCursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(vRow.title || ', ' || vRow.completeDate);
    END LOOP;
END;
/
