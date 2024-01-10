/*
    ▶ Oracle 설치
    
        ▷ https://www.oracle.com/database/technologies/xe-prior-release-downloads.html
        ▷ Oracle Database 11gR2 Express Edition for Windows x64 다운로드 및 압축 해제
        
        ▷ 실행 및 종료 방법 : Win + R ➤ services.msc ➤ OracleServiceXE 및 OracleXETNSListener
    
    ▶ SQL Developer 설치
    
        ▷ https://www.oracle.com/tools/downloads/sqldev-downloads-23.1.0.html
        ▷ Windows 64-bit with JDK 11 included 다운로드 및 압축 해제
        
    ▶ DBeaver 설치
    
        ▷ https://dbeaver.io/files/23.2.0/
        ▷ dbeaver-ce-23.2.0-win32.win32.x86_64.zip 다운로드 및 압축 해제
        
    -----------------------------------------------------------------------------------------

    ▶ Ctrl + Enter : 코드 실행
    ▶ Alt + ' : 대소문자 변경
    
    -----------------------------------------------------------------------------------------
    
    ▶ 계정 비밀번호 변경 방법
    
        ▷ ALTER USER 계정명 IDENTIFIED BY 비밀번호;
        
    ▶ 계정 활성화 및 비활성화 방법
    
        ▷ ALTER USER 계정명 ACCOUNT UNLOCK/LOCK;
*/

ALTER USER hr IDENTIFIED BY java1234;

ALTER USER hr ACCOUNT UNLOCK;

/*
    ▶ SQL(Structured Query Language)
    
        ▷ DDL(Data Definition Language)
    
            ◆ CREATE
            ◆ ALTER
            ◆ DROP
    
        ▷ DML(Data Manipulation Language)
        
            ◆ SELECT
            ◆ INSERT
            ◆ UPDATE
            ◆ DELETE
        
        ▷ DCL(Data Control Language)
    
            ◆ COMMIT
            ◆ ROLLBACK
            ◆ GRANT
            ◆ REVOKE
        
        ▷ DQL(Data Query Langauge)
        
            ◆ SELECT
        
        ▷ TCL(Transaction Control Language)
            
            ◆ COMMIT
            ◆ ROLLBACK
*/

SELECT * FROM TABS;

-- 식별자의 크기는 30byte 이하여야 한다.
CREATE TABLE aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa (
    num NUMBER
);

-- ORA-00972: identifier is too long
CREATE TABLE aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa (
    num NUMBER
);
