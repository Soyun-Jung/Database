Rem Copyright (c) 1990 by Oracle Corporation
Rem NAME
REM    UTLSAMPL.SQL
Rem  FUNCTION
Rem  NOTES
Rem  MODIFIED
Rem	gdudey	   06/28/95 -  Modified for desktop seed database
Rem	glumpkin   10/21/92 -  Renamed from SQLBLD.SQL
Rem	blinden   07/27/92 -  Added primary and foreign keys to EMP and DEPT
Rem	rlim	   04/29/91 -	      change char to varchar2
Rem	mmoore	   04/08/91 -	      use unlimited tablespace priv
Rem	pritto	   04/04/91 -	      change SYSDATE to 13-JUL-87
Rem   Mendels	 12/07/90 - bug 30123;add to_date calls so language independent
Rem
rem
rem $Header: utlsampl.sql 7020100.1 94/09/23 22:14:24 cli Generic<base> $ sqlbld.sql
rem
SET TERMOUT OFF
SET ECHO OFF

rem CONGDON    Invoked in RDBMS at build time.	 29-DEC-1988
rem OATES:     Created: 16-Feb-83

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY TIGER;
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
CONNECT SCOTT/TIGER
DROP TABLE DEPT;
CREATE TABLE DEPT
       (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) ) ;
DROP TABLE EMP;
CREATE TABLE EMP
       (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);
INSERT INTO DEPT VALUES
	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
	(40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
DROP TABLE BONUS;
CREATE TABLE BONUS
	(
	ENAME VARCHAR2(10)	,
	JOB VARCHAR2(9)  ,
	SAL NUMBER,
	COMM NUMBER
	) ;
DROP TABLE SALGRADE;
CREATE TABLE SALGRADE
      ( GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER );
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

SET TERMOUT ON
SET ECHO ON

SELECT*FROM EMP;
SELECT*FROM DEPT;

SELECT * FROM (SELECT JOB, COUNT(JOB) AS NUM FROM EMP GROUP BY JOB) ORDER BY NUM DESC;

SELECT JOB, COUNT(JOB) AS NUM FROM EMP GROUP BY JOB ORDER BY NUM DESC; 

SELECT EDPTNO, AVGSAL, MAXSAL, MINSAL, 
FROM EMP
GROUP BY DEPTNO

SELECT DEPTNO, ROUND(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*) FROM EMP GROUP BY DEPTNO;

SELECT * 
FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;


--각부서별 최고급여와 동일 급여를 받는 사원정보 출력

SELECT * FROM EMP;

SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;

SELECT DEPTNO, ENAME
FROM EMP 
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT * 
FROM EMP M
WHERE EXISTS (SELECT * FROM EMP S WHERE S.EMPNO != M.EMPNO AND S.SAL=M.SAL);



--1.EMP 테이블에서 사원번호, 사원이름, 월급을 출력하시오.
SELECT EMPNO, ENAME, SAL FROM EMP;

--2. EMP테이블에서 사원이름과 월급 출력하는데 컬럼명은 이름, 월급으로 바꿔서 출력하시오.
SELECT ENAME AS 이름, SAL AS 월급 FROM EMP;

--3. EMP 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬럼명은 사원번호, 사원이름, 월급, 연봉으로 출력하시오.
SELECT EMPNO AS 사원번호, ENAME AS 사원이름, SAL AS 월급, SAL*12 AS 연봉 FROM EMP;

--4. EMP 테이블의 업무(JOB)를 중복되지 않게 표시하시오(GROUP BY)
SELECT JOB FROM EMP GROUP BY JOB;

--5. EMP 테이블에서 SAL*12를 사용하여 사원이름과 연봉을 출력
SELECT ENAME AS 사원이름, SAL*12 AS 연봉 FROM EMP;

--6. 이름이 J,A또는 M으로 시작하는 모든 사원의 이름과 이름의 길이를 표시하시오.
SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE ENAME LIKE 'J%' OR ENAME LIKE 'M%' OR ENAME LIKE 'A%';

SELECT * FROM EMP;
SELECT * FROM DEPT;
--7. 수당(COMM)을 받고 급여가 1600이상인 사원의 사원이름, 부서명, 근무지를 출력하시오.
SELECT EMP.ENAME AS 사원이름, dept.dname AS 부서명, DEPT.LOC AS 근무지
FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE EMP.COMM IS NOT NULL AND EMP.SAL>=1600;

--8. 근무지별로 근무하는 사원의 수가 5명 이하인 경우, 인원이 적은 도시 순으로 정렬하시오.

SELECT DEPT.LOC, COUNT(EMP.ENAME)
FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
GROUP BY DEPT.LOC
ORDER BY COUNT(EMP.ENAME);

--9. 총급여(SAL+COMM)가 평균 급여보다 많은 급여를 받는 사람의 부서번호, 이름, 총급여, 수당을 추력하시오,(수당은 유,무로표시 컬럼명은 COMM유무로 출력)
SELECT DEPTNO AS 부서번호, ENAME AS 이름, (NVL(COMM,0)+SAL) AS 총급여, NVL2(COMM,'유','무') AS 수당
FROM EMP
WHERE (NVL(COMM,0)+SAL) > (SELECT AVG((NVL(COMM,0)+SAL))
FROM EMP);

--10. 20번 부서에서 가장 급여를 많이 받는 사원과 동일한 급여를 받는 사원의 이름과 부서명, 급여, 급여등급을 출력하시오.(EMP, DEPT, SALGRADE 테이블 사용)
SELECT EMP.ENAME AS 사원이름, DEPT.DNAME AS 부서명, EMP.SAL AS 급여, (SELECT GRADE FROM SALGRADE WHERE LOSAL <= (SELECT EMP.SAL AS SAL FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
                                                                                                               WHERE EMP.SAL = (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20))
                                                                                                    AND HISAL >= (SELECT EMP.SAL AS SAL FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
                                                                                                                WHERE EMP.SAL = (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20))) AS 급여등급 
FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE EMP.SAL = (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20); 

SELECT EMP.SAL AS SAL 
FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE EMP.SAL = (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20); 

CREATE OR REPLACE VIEW V1
AS
SELECT GRADE FROM SALGRADE
WHERE LOSAL <= (SELECT EMP.SAL AS SAL FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
               WHERE EMP.SAL = (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20))
      AND HISAL >= (SELECT EMP.SAL AS SAL FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
               WHERE EMP.SAL = (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=20)); 
