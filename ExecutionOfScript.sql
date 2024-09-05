--CREATE TABLES
CREATE TABLE City(
City_id int NOT NULL PRIMARY KEY,
City_name char(30) NOT NULL);


CREATE TABLE BLOODSAMPLE(
Sample_no int NOT NULL PRIMARY KEY,
Blood_group varchar(50),
Status varchar(100) NOT NULL,
Staff_id int,
Dr_id int);

CREATE TABLE DISEASEFINDER(
Dr_id int NOT NULL PRIMARY KEY,
Dr_name varchar(50) NOT NULL,
Dr_phoneno INT);

Create Table BloodBankStaff(
Staff_id int NOT NULL PRIMARY KEY,
Staff_name char(50) NOT NULL,
Staff_phoneno varchar(50));  

CREATE TABLE Donor(
D_id int NOT NULL PRIMARY KEY,
D_name varchar(100) NOT NULL,
D_age varchar(100),
gender varchar(10),
D_bloodgrp varchar(10),
D_regdate date,
staff_id int NOT NULL,
city_id int NOT NULL,
FOREIGN KEY(staff_id) references BloodBankStaff(staff_id),
FOREIGN KEY(city_id) references city(city_id)
);



CREATE TABLE HOSPITALINFO(
hosp_id int NOT NULL,
hosp_name varchar(100),
city_id number(38) NOT NULL,
staff_id int NOT NULL,
primary key(hosp_id),
foreign key(staff_id) REFERENCES bloodbankstaff(staff_id),
foreign key(city_id) REFERENCES city(city_id));



CREATE TABLE RECIPIENT(
reci_id int NOT NULL PRIMARY KEY,
reci_name varchar(100) NOT NULL,
reci_age varchar(10),
reci_bgrp varchar(100),
reci_bqty float,
reco_ID int NOT NULL,
city_id int NOT NULL,
staff_id int NOT NULL,
FOREIGN KEY(staff_id) REFERENCES bloodbankstaff(staff_id),
FOREIGN KEY(city_id)REFERENCES city(city_id));

--INSERT 

INSERT INTO city VALUES(10,'Boston');
INSERT INTO city VALUES(11,'Quincy');
INSERT INTO city VALUES(12,'Cambridge');
INSERT INTO city VALUES(13,'Salem');
SELECT*FROM CITY;

INSERT INTO bloodsample VALUES(101,'O+ve',1,10101,101);
INSERT INTO bloodsample VALUES(102,'AB+ve',0,10102,102);
INSERT INTO bloodsample VALUES(103,'B+ve',1,10103,103);
INSERT INTO bloodsample VALUES(104,'O-ve',0,10104,104);
SELECT*FROM bloodsample;

INSERT INTO DISEASEFINDER VALUES(102,'Aishwarya',9767812345);
INSERT INTO DISEASEFINDER VALUES(101,'Nitin',9767812100);
INSERT INTO DISEASEFINDER VALUES(103,'Naveen',9767812223);
INSERT INTO DISEASEFINDER VALUES(104,'Kirti',9722312347);
SELECT*FROM DISEASEFINDER;

INSERT INTO BLOODBANKSTAFF VALUES (10101,'Mitali',9822145678);
INSERT INTO BLOODBANKSTAFF VALUES(10102,'Karan',8888734561);
INSERT INTO BLOODBANKSTAFF VALUES(10103,'Shiba',9878965432);
INSERT INTO BLOODBANKSTAFF VALUES(10104,'Nupoor',8887632412);
SELECT*FROM BLOODBANKSTAFF;
UPDATE BLOODBANKSTAFF
SET Staff_Name = 'Alfred Schmidt'
WHERE Staff_id=10102;
SELECT*FROM BLOODBANKSTAFF;

INSERT INTO donor VALUES(1501,'Mark',32,'Male','O+ve',to_date('2021-04-29','YYYY-MM-DD'),10102,10);
INSERT INTO donor VALUES(1506,'Nancy',23,'Female','AB+ve',to_date('2021-07-28','YYYY-MM-DD'),10101,13);
INSERT INTO donor VALUES(1502,'Sarah',33,'Female','B+ve',to_date('2022-07-11','YYYY-MM-DD'),10103,11);
INSERT INTO donor VALUES(1511,'rick',45,'Male','O+ve',to_date('2022-07-21','YYYY-MM-DD'),10102,12);
INSERT INTO donor VALUES(1512,'deadpool',45,'Male','O-ve',to_date('2020-01-21','YYYY-MM-DD'),10104,13);
INSERT INTO donor VALUES(1514,'tony',45,'Male','O-ve',to_date('2012-03-25','YYYY-MM-DD'),10101,12);
INSERT INTO donor VALUES(1515,'steve',45,'Male','ab+ve',to_date('2022-08-26','YYYY-MM-DD'),10102,11);
SELECT*FROM Donor;
DELETE FROM Donor WHERE D_name='steve';
SELECT*FROM Donor;

INSERT INTO hospitalinfo VALUES(1,'Sigma',11,10101);
INSERT INTO hospitalinfo  VALUES(2,'Alpha',12,10102);
INSERT INTO hospitalinfo  VALUES(3,'Ruby',13,10103);
INSERT INTO hospitalinfo  VALUES(4,'Diamond',10,10104);
SELECT*FROM hospitalinfo;

INSERT INTO RECIPIENT VALUES(01,'david',33,'o+ve',4,1121 ,10,10101);
INSERT INTO RECIPIENT VALUES(02,'devil',12,'o-ve',2,1102 ,11,10102);
INSERT INTO RECIPIENT VALUES(03,'dan',55,'o+ve',3,1104 ,13,10103);
SElect*From Recipient;
UPDATE RECIPIENT
SET reci_Name = 'daniel'
WHERE reci_id=01;
SElect*From Recipient;
---DROP THE TABLES
SET SERVEROUTPUT ON;
DECLARE
    count1 NUMBER;
BEGIN
    SELECT count(*)
    INTO count1
    FROM user_tables WHERE table_name = 'HOSPITALINFO';
    IF count1 > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE HOSPITALINFO';
    END IF;
END;
/





DECLARE
    count5 NUMBER;
BEGIN
    SELECT count(*)
    INTO count5
    FROM user_tables WHERE table_name = 'RECIPIENT';
    IF count5 > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE RECIPIENT';
    END IF;
END;
/





DECLARE
    count6 NUMBER;
BEGIN
    SELECT count(*)
    INTO count6
    FROM user_tables WHERE table_name = 'BLOODSAMPLE';
    IF count6 > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE BLOODSAMPLE';
    END IF;
END;
/





DECLARE
    count4 NUMBER;
BEGIN
    SELECT count(*)
    INTO count4
    FROM user_tables WHERE table_name = 'CITY';
    IF count4 > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE CITY';
    END IF;
END;
/





DECLARE
    count2 NUMBER;
BEGIN
    SELECT count(*)
    INTO count2
    FROM user_tables WHERE table_name = 'BLOODBANKSTAFF';
    IF count2 > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE BLOODBANKSTAFF';
    END IF;
END;
/





DECLARE
    count3 NUMBER;
BEGIN
    SELECT count(*)
    INTO count3
    FROM user_tables WHERE table_name = 'DISEASEFINDER';
    IF count3 > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE DISEASEFINDER';
    END IF;
END;
/







DECLARE
    count7 NUMBER;
BEGIN
    SELECT count(*)
    INTO count7
    FROM user_tables WHERE table_name = 'DONOR';
    IF count7 > 0
    THEN
    EXECUTE IMMEDIATE 'DROP TABLE DONOR';
    END IF;
END;
/



