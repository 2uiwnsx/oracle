/*
    ▶ PL/SQL 자료형
    
        ▷ 숫자형
            
            ◆ NUMBER : 유효 자리가 최대 39자리인, 5 ~ 22byte 크기의 숫자
         
                ◇ NUMBER
                ◇ NUMBER(전체 자릿수) : 정수
                ◇ NUMBER(전체 자릿수, 소수점 이하 자릿수) : 정수, 소수
        
        ▷ 문자형
        
            ◆ CHAR : 1 ~ 2000byte 크기의 고정 길이 문자열
        
                ◇ CHAR(길이)
                ◇ CHAR(글자수 CHAR)
                
            ◆ NCHAR : 인코딩 형식이 UTF-16인, 1 ~ 1000byte 크기의 고정 길이 문자열
        
                ◇ NCHAR(길이)
                ◇ NCHAR(글자수 CHAR)
            
            ◆ VARCHAR2 : 1 ~ 4000byte 크기의 가변 길이 문자열
        
                ◇ VARCHAR2(길이)
                ◇ VARCHAR2(글자수 CHAR)
            
            ◆ NVARCHAR2 : 인코딩 형식이 UTF-16인, 1 ~ 2000byte 크기의 가변 길이 문자열
    
                ◇ NVARCHAR2(길이)
                ◇ NVARCHAR2(글자수 CHAR)
                
            ◆ CLOB, NCLOB : 최대 128TB 크기의 가변 길이 문자열
    
        ▷ 날짜/시간형
       
            ◆ DATE : 연, 월, 일, 시, 분, 초
            ◆ TIMESTAMP : 연, 월, 일, 시, 분, 초, 밀리세컨드, 나노세컨드
            ◆ INTERVAL : 두 날짜/시간 간의 차이
    
        ▷ 이진 데이터형
    
            ◆ BLOB : 최대 128TB 크기의 비텍스트 데이터
            
    ----------------------------------------------------------------------------------
    
    ▶ 테이블 생성 방법
    
        ▷ CREATE TABLE 테이블명 (
              컬럼명 자료형
          );
          
    ----------------------------------------------------------------------------------
    
    ▶ 데이터 삽입 방법
    
        ▷ INSERT INTO 테이블명 [(컬럼명)] VALUES (값);
*/

CREATE TABLE tblType (
    -- num NUMBER
    -- num NUMBER(3)
    num NUMBER(4, 2)
);

INSERT INTO tblType (num) VALUES (10);
INSERT INTO tblType (num) VALUES (3.14);
INSERT INTO tblType (num) VALUES (3.99);
INSERT INTO tblType (num) VALUES (1234);
INSERT INTO tblType (num) VALUES (999);
INSERT INTO tblType (num) VALUES (-999);
INSERT INTO tblType (num) VALUES (99.99);
INSERT INTO tblType (num) VALUES (-99.99);
INSERT INTO tblType (num) VALUES (1234567890);
INSERT INTO tblType (num) VALUES (12345678901234567890);
INSERT INTO tblType (num) VALUES (123456789012345678901234567890);
INSERT INTO tblType (num) VALUES (1234567890123456789012345678901234567890);
INSERT INTO tblType (num) VALUES (12345678901234567890123456789012345678901234567890);

SELECT * FROM tblType;

DROP TABLE tblType;

CREATE TABLE tblType (
    -- txt CHAR(10)
    -- txt CHAR(10 CHAR)
    -- txt VARCHAR2(10)
     
    txt1 CHAR(10),
    txt2 VARCHAR2(10)
);

INSERT INTO tblType (txt) VALUES (100);
INSERT INTO tblType (txt) VALUES ('홍길동');
INSERT INTO tblType (txt) VALUES ('abcdabcdab');
INSERT INTO tblType (txt) VALUES ('abcdabcdabc');
INSERT INTO tblType (txt) VALUES ('홍길동입니다.');

INSERT INTO tblType (txt1, txt2) VALUES ('abc', 'abc');

SELECT * FROM tblType;

DROP TABLE tblType;

CREATE TABLE tblType (
    regdate DATE
);

INSERT INTO tblType (regdate) VALUES ('2023-08-25');

SELECT * FROM tblType;

COMMIT;
