## REST API CRUD

> 🛠 개발환경
- OS : Mac OS
- IDE : Spring Tool Suite 3 Version: 3.9.18.RELEASE
- Framework : Spring Framework
- JAVA : JDK 18
- WAS : Tomcat 9.0
- 프로젝트 설정 : Spring Lagacy Project ➡️ Spring MVC Project 
  - Properties ➡️ Project Facets ➡️ Dynamic Web Module: 4.0
  - Java: 15(1.8버전 이상으로 설정/설치 된 본인 컴퓨터 Java 최상위 버전으로 설정) 
- Server ➡️ Tomcat 더블클릭 ➡️ Modules → Add Web Module ➡️ restApi 클릭 → path: '/restApi'

<br>

> ✏️ 테이블 및 시퀀스 생성

``` 
CREATE TABLE BOARD(
  NO NUMBER PRIMARY KEY,
  NAME VARCHAR2(10) NOT NULL,
  CONTENT VARCHAR2(200) NOT NULL,
  REGDATE DATE NOT NULL
);
CREATE SEQUENCE BOARD_SEQ;
```

<br>
