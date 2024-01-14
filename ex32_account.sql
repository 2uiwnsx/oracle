/*
    ▶ 계정 생성 방법
    
        ▷ CREATE USER 계정명 IDENTIFIED BY 비밀번호;
        
    ▶ 계정 삭제 방법
    
        ▷ DROP USER 계정명 CASCADE;
    
    ------------------------------------------------
        
    ▶ 권한 부여 방법
    
        ▷ GRANT 권한 TO 계정명;
        
    ▶ 권한 취소 방법
    
        ▷ REVOKE 권한 FROM 계정명;
*/

SHOW USER;

CREATE USER oracle IDENTIFIED BY java1234;

GRANT CONNECT, RESOURCE, DBA TO oracle;
