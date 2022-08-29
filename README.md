## REST API CRUD
<img src="https://camo.githubusercontent.com/5a3766cb85679609350d1f7d02015c8aabc8270f10db3557367f0cecd4016af8/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c616e67756167652d4a6176612d677265656e3f7374796c653d666c6174" data-canonical-src="https://img.shields.io/badge/Language-Java-green?style=flat" style="max-width: 100%;"><img src="https://img.shields.io/badge/DB-ORACLE-yellow" data-canonical-src="https://img.shields.io/badge/Platform-AWS-blue?style=flat" style="max-width: 100%;"><img src="https://camo.githubusercontent.com/7be8cf874ff520c83747483ddfa44ef93b0a1d4b2398fb885f73cbec9bbb901d/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f506c6174666f726d2d4157532d626c75653f7374796c653d666c6174" data-canonical-src="https://img.shields.io/badge/Platform-AWS-blue?style=flat" style="max-width: 100%;">

[Go To Site](http://ec2-3-37-163-105.ap-northeast-2.compute.amazonaws.com/restApi/board)

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
<br>

> 📁 파일 생성 순서
- DTO → MAPPER → DAO → SERVICE → CONTROLLER
- Spring MVC 구조 흐름:  
  - ➡️ 호출: Web Browser ➡️ Controller ➡️ Service ➡️ Dao ➡️ DB
  - ⬅️ 리턴: DB ➡️ Dao ➡️ Service ➡️ Controller ➡️ Web Browser
1. Controller: 웹 브라우저의 요청을 전담하여 처리.
2. Service: 비지니스 로직을 수행. 데이터베이스에 접근하는 DAO를 이용해서 결과값을 받아 옴.
3. DAO: 데이터베이스에 접속하여 비즈니스 로직 실행에 필요한 쿼리를 호출. 
4. DB: 알맞은 쿼리를 실행하고 결과값을 반환.
5. DTO: Data Transfer Object, 각 계층(뷰, 컨트롤러, 서비스, DAO, DB)이 데이터를 주고 받을 때 사용하는 객체. 
