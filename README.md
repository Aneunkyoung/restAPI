## REST API CRUD
<img src="https://camo.githubusercontent.com/5a3766cb85679609350d1f7d02015c8aabc8270f10db3557367f0cecd4016af8/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c616e67756167652d4a6176612d677265656e3f7374796c653d666c6174" data-canonical-src="https://img.shields.io/badge/Language-Java-green?style=flat" style="max-width: 100%;"><img src="https://img.shields.io/badge/DB-ORACLE-yellow" data-canonical-src="https://img.shields.io/badge/Platform-AWS-blue?style=flat" style="max-width: 100%;"><img src="https://camo.githubusercontent.com/7be8cf874ff520c83747483ddfa44ef93b0a1d4b2398fb885f73cbec9bbb901d/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f506c6174666f726d2d4157532d626c75653f7374796c653d666c6174" data-canonical-src="https://img.shields.io/badge/Platform-AWS-blue?style=flat" style="max-width: 100%;">

[Go To Site](http://ec2-3-37-163-105.ap-northeast-2.compute.amazonaws.com/restApi/board)

> ๐  ๊ฐ๋ฐํ๊ฒฝ
- OS : Mac OS
- IDE : Spring Tool Suite 3 Version: 3.9.18.RELEASE
- Framework : Spring Framework
- JAVA : JDK 18
- WAS : Tomcat 9.0
- ํ๋ก์ ํธ ์ค์  : Spring Lagacy Project โก๏ธ Spring MVC Project 
  - Properties โก๏ธ Project Facets โก๏ธ Dynamic Web Module: 4.0
  - Java: 15(1.8๋ฒ์  ์ด์์ผ๋ก ์ค์ /์ค์น ๋ ๋ณธ์ธ ์ปดํจํฐ Java ์ต์์ ๋ฒ์ ์ผ๋ก ์ค์ )ย 
- Server โก๏ธ Tomcat ๋๋ธํด๋ฆญ โก๏ธ Modules โ Add Web Module โก๏ธ restApi ํด๋ฆญ โ path: '/restApi'

<br>
<br>

> โ๏ธ ํ์ด๋ธ ๋ฐ ์ํ์ค ์์ฑ

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

> ๐ ํ์ผ ์์ฑ ์์
- DTO โ MAPPER โ DAO โ SERVICE โ CONTROLLER
- Spring MVC ๊ตฌ์กฐ ํ๋ฆ:  
  - โก๏ธ ํธ์ถ: Web Browser โก๏ธ Controller โก๏ธ Service โก๏ธ Dao โก๏ธ DB
  - โฌ๏ธ ๋ฆฌํด: DB โก๏ธ Dao โก๏ธ Service โก๏ธ Controller โก๏ธ Web Browser
1. Controller: ์น ๋ธ๋ผ์ฐ์ ์ ์์ฒญ์ ์ ๋ดํ์ฌ ์ฒ๋ฆฌ.
2. Service: ๋น์ง๋์ค ๋ก์ง์ ์ํ. ๋ฐ์ดํฐ๋ฒ ์ด์ค์ ์ ๊ทผํ๋ DAO๋ฅผ ์ด์ฉํด์ ๊ฒฐ๊ณผ๊ฐ์ ๋ฐ์ ์ด.
3. DAO: ๋ฐ์ดํฐ๋ฒ ์ด์ค์ ์ ์ํ์ฌ ๋น์ฆ๋์ค ๋ก์ง ์คํ์ ํ์ํ ์ฟผ๋ฆฌ๋ฅผ ํธ์ถ. 
4. DB: ์๋ง์ ์ฟผ๋ฆฌ๋ฅผ ์คํํ๊ณ  ๊ฒฐ๊ณผ๊ฐ์ ๋ฐํ.
5. DTO: Data Transfer Object, ๊ฐ ๊ณ์ธต(๋ทฐ, ์ปจํธ๋กค๋ฌ, ์๋น์ค, DAO, DB)์ด ๋ฐ์ดํฐ๋ฅผ ์ฃผ๊ณ  ๋ฐ์ ๋ ์ฌ์ฉํ๋ ๊ฐ์ฒด. 
