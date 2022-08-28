## REST API CRUD
<img src="https://camo.githubusercontent.com/5a3766cb85679609350d1f7d02015c8aabc8270f10db3557367f0cecd4016af8/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c616e67756167652d4a6176612d677265656e3f7374796c653d666c6174" data-canonical-src="https://img.shields.io/badge/Language-Java-purple?style=flat" style="max-width: 100%;">

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

[Go To Site](http://ec2-3-37-163-105.ap-northeast-2.compute.amazonaws.com/restApi/board)
