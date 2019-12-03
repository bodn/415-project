-- SQL - Set up Project
CREATE SCHEMA student_info;
CREATE USER 'app'@'%' IDENTIFIED WITH mysql_native_password BY 'Password123';
GRANT ALL ON student_info.* TO 'app'@'%';
USE student_info;
-- Create the tables

create table room(
	room_id int(3) not null,
	room_num varchar(4),
	building varchar(30),
	capacity int(3),
	primary key(room_id)
);

create table Student(
	student_id int(9) not null,
	first_name varchar(20),
	last_name varchar(20),
	email varchar(30),
	major varchar(30),
	gpa double(3, 1),
	department_id char(2) not null,
	primary key(student_id)
);

create table student_records(
	record_id int(4) not null,
	student_id int(9) not null,
	section_rec char(4) not null,
	grade int(2),
	status varchar(30),
	year int(4),
	semester char(1),
	primary key(record_id)
);

create table course(
	course_id varchar(8) not null,
	course_name varchar(50), 
	description varchar(100),
	department_id char(2) not null,
	primary key(course_id)
);

create table department(
	department_id char(2) not null,
	department_name varchar(20),
	primary key(department_id)
);

create table professor(
	professor_id int(4) not null,
	first_name varchar(20),
	last_name varchar(20),
	email varchar(30),
	department_id char(2) not null,
	primary key(professor_id)
);

create table section_records(
	section_id int(2) not null,
	section_rec char(4) not null,
	course_id varchar(8) not null,
	professor_id int(4) not null,
	room_id int(3) not null,
	year char(4),
	day_of_week varchar(30),
	start_time varchar(20),
	end_time varchar(20),
	primary key(section_rec)
);

-- Foreign Keys for Student
ALTER TABLE student
ADD FOREIGN KEY(department_id) 
REFERENCES department(department_id);

-- Foreign Keys for student_records
ALTER TABLE student_records
ADD FOREIGN KEY(student_id) 
REFERENCES student(student_id);

ALTER TABLE student_records
ADD FOREIGN KEY(section_rec) 
REFERENCES section_records(section_rec);

-- Foreign Keys for Professor
ALTER TABLE professor
ADD FOREIGN KEY(department_id) 
REFERENCES department(department_id);

-- Foreign Keys for Course
ALTER TABLE course
ADD FOREIGN KEY(department_id) 
REFERENCES department(department_id);

-- Foreign Keys for section_records
ALTER TABLE section_records
ADD FOREIGN KEY(course_id) 
REFERENCES course(course_id);

ALTER TABLE section_records
ADD FOREIGN KEY(professor_id) 
REFERENCES professor(professor_id);

ALTER TABLE section_records
ADD FOREIGN KEY(room_id) 
REFERENCES room(room_id);

INSERT INTO ROOM VALUES (101, '1120', 'ERIE HALL', 110);
INSERT INTO ROOM VALUES (102, '1118', 'ERIE HALL', 60);
INSERT INTO ROOM VALUES (103, '3130', 'ERIE HALL', 35);
INSERT INTO ROOM VALUES (201, '1250', 'ESSEX HALL', 105);
INSERT INTO ROOM VALUES (202, '1230', 'ESSEX HALL', 55);
INSERT INTO ROOM VALUES (203, '1267', 'ESSEX HALL', 30);

INSERT INTO DEPARTMENT VALUES ('CS', 'Computer Science');
INSERT INTO DEPARTMENT VALUES ('CH', 'Chemistry');
INSERT INTO DEPARTMENT VALUES ('BU', 'Business');
INSERT INTO DEPARTMENT VALUES ('EN', 'Engineering');

insert into student values(100000000,'Jacki','Mcelyea','JMcelyea@uwindsor.ca','Engineering',55.1,'EN');
insert into student values(100000001,'Rowena','Julio','RJulio@uwindsor.ca','Engineering',54.9,'EN');
insert into student values(100000002,'Faith','Kolesar','FKolesar@uwindsor.ca','Chemistry',70.5,'CH');
insert into student values(100000003,'Vonnie','Rohrbaugh','VRohrbaugh@uwindsor.ca','Computer Science',56.8,'CS');
insert into student values(100000004,'Gilberte','Ober','GOber@uwindsor.ca','Chemistry',59.6,'CH');
insert into student values(100000005,'Carline','Trew','CTrew@uwindsor.ca','Business',69.0,'BU');
insert into student values(100000006,'Alesia','Stead','AStead@uwindsor.ca','Computer Science',65.9,'CS');
insert into student values(100000007,'Easter','Harrison','EHarrison@uwindsor.ca','Engineering',62.8,'EN');
insert into student values(100000008,'Arianne','Weidman','AWeidman@uwindsor.ca','Business',54.6,'BU');
insert into student values(100000009,'Kym','Fulk','KFulk@uwindsor.ca','Computer Science',58.1,'CS');
insert into student values(100000010,'Juanita','Munsey','JMunsey@uwindsor.ca','Chemistry',46.5,'CH');
insert into student values(100000011,'Emeline','Pomeroy','EPomeroy@uwindsor.ca','Engineering',42.0,'EN');
insert into student values(100000012,'Lizzie','Mcfate','LMcfate@uwindsor.ca','Computer Science',64.8,'CS');
insert into student values(100000013,'Verda','Carrales','VCarrales@uwindsor.ca','Chemistry',64.4,'CH');
insert into student values(100000014,'Shiela','Heber','SHeber@uwindsor.ca','Computer Science',57.5,'CS');
insert into student values(100000015,'Elicia','Balas','EBalas@uwindsor.ca','Chemistry',51.4,'CH');
insert into student values(100000016,'Tiffanie','Wiese','TWiese@uwindsor.ca','Chemistry',59.8,'CH');
insert into student values(100000017,'Monica','Hammaker','MHammaker@uwindsor.ca','Business',59.7,'BU');
insert into student values(100000018,'Hung','Clampitt','HClampitt@uwindsor.ca','Engineering',58.4,'EN');
insert into student values(100000019,'Glennis','Royston','GRoyston@uwindsor.ca','Computer Science',65.1,'CS');
insert into student values(100000020,'Hassan','Hamann','HHamann@uwindsor.ca','Engineering',47.3,'EN');
insert into student values(100000021,'Carman','Hillwig','CHillwig@uwindsor.ca','Business',43.5,'BU');
insert into student values(100000022,'Briana','Streater','BStreater@uwindsor.ca','Chemistry',65.5,'CH');
insert into student values(100000023,'Marcelene','Brophy','MBrophy@uwindsor.ca','Business',62.5,'BU');
insert into student values(100000024,'Liane','Vaquera','LVaquera@uwindsor.ca','Chemistry',49.8,'CH');
insert into student values(100000025,'Ching','Bigler','CBigler@uwindsor.ca','Chemistry',56.9,'CH');
insert into student values(100000026,'Lincoln','Engberg','LEngberg@uwindsor.ca','Business',44.0,'BU');
insert into student values(100000027,'Victor','Conners','VConners@uwindsor.ca','Engineering',48.5,'EN');
insert into student values(100000028,'Vada','Myron','VMyron@uwindsor.ca','Chemistry',49.2,'CH');
insert into student values(100000029,'Risa','Hazen','RHazen@uwindsor.ca','Chemistry',50.3,'CH');
insert into student values(100000030,'Blondell','Decarlo','BDecarlo@uwindsor.ca','Computer Science',57.7,'CS');
insert into student values(100000031,'Debby','Efird','DEfird@uwindsor.ca','Chemistry',56.6,'CH');
insert into student values(100000032,'Josef','Deeb','JDeeb@uwindsor.ca','Business',45.9,'BU');
insert into student values(100000033,'Shannan','Pasley','SPasley@uwindsor.ca','Chemistry',60.5,'CH');
insert into student values(100000034,'Rickey','Koury','RKoury@uwindsor.ca','Engineering',63.1,'EN');
insert into student values(100000035,'Alvina','Kabel','AKabel@uwindsor.ca','Computer Science',47.4,'CS');
insert into student values(100000036,'Mellie','Barlowe','MBarlowe@uwindsor.ca','Computer Science',69.9,'CS');
insert into student values(100000037,'Jerry','Calley','JCalley@uwindsor.ca','Chemistry',71.3,'CH');
insert into student values(100000038,'Vicente','Kearns','VKearns@uwindsor.ca','Chemistry',60.2,'CH');
insert into student values(100000039,'Vance','Bialek','VBialek@uwindsor.ca','Engineering',64.0,'EN');
insert into student values(100000040,'Rufina','Wiggs','RWiggs@uwindsor.ca','Chemistry',65.3,'CH');
insert into student values(100000041,'Cristy','Lis','CLis@uwindsor.ca','Computer Science',55.7,'CS');
insert into student values(100000042,'Sergio','Pocock','SPocock@uwindsor.ca','Business',51.1,'BU');
insert into student values(100000043,'Eulah','Zemlicka','EZemlicka@uwindsor.ca','Chemistry',55.9,'CH');
insert into student values(100000044,'Millie','Davy','MDavy@uwindsor.ca','Chemistry',58.7,'CH');
insert into student values(100000045,'Herlinda','Kreger','HKreger@uwindsor.ca','Business',63.8,'BU');
insert into student values(100000046,'Roselyn','Mcquaid','RMcquaid@uwindsor.ca','Business',50.3,'BU');
insert into student values(100000047,'Gabriele','Villagran','GVillagran@uwindsor.ca','Chemistry',64.1,'CH');
insert into student values(100000048,'Emogene','Morain','EMorain@uwindsor.ca','Chemistry',41.4,'CH');
insert into student values(100000049,'Mildred','Bulli','MBulli@uwindsor.ca','Computer Science',50.4,'CS');

INSERT INTO PROFESSOR VALUES (9001, 'BOBBY', 'JEAN', 'BJEAN@UWINDSOR.CA', 'CS');
INSERT INTO PROFESSOR VALUES (9002, 'CLAIRE', 'BAKER', 'CBAKER@UWINDSOR.CA', 'CS');
INSERT INTO PROFESSOR VALUES (9003, 'HAROLD', 'BEAUMONT', 'HBEAUMONT@UWINDSOR.CA', 'CH');
INSERT INTO PROFESSOR VALUES (9004, 'KATIE', 'SMITH', 'KSMITH@UWINDSOR.CA', 'CH');
INSERT INTO PROFESSOR VALUES (9005, 'BRANDON', 'BROWN', 'BBROWN@UWINDSOR.CA', 'BU');
INSERT INTO PROFESSOR VALUES (9006, 'WILLIAM', 'DAVIS', 'WDAVIS@UWINDSOR.CA', 'EN');

INSERT INTO COURSE VALUES ('COMP1050', 'INTRO TO PROGRAMMING', 'DESCRIPTION OF COMP1050', 'CS');
INSERT INTO COURSE VALUES ('COMP2080', 'OOP USING JAVA', 'DESCRIPTION OF COMP2080', 'CS');
INSERT INTO COURSE VALUES ('COMP2260', 'DATABASE MANAGEMENT SYSTEMS', 'DESCRIPTION OF COMP2260', 'CS');
INSERT INTO COURSE VALUES ('CHEM3470', 'SPECTROSCOPIC STRUCTURE IDENTIFICATION', 'DESCRIPTION OF CHEM3470', 'CH');
INSERT INTO COURSE VALUES ('CHEM3801', 'PRINCIPLES OF INSTRUMENTAL ANALYSIS', 'DESCRIPTION OF CHEM3810', 'CH');
INSERT INTO COURSE VALUES ('CHEM4540', 'BIO AND SUSTAINABLE MATERIALS', 'DESCRIPTION OF CHEM4540', 'CH');
INSERT INTO COURSE VALUES ('BUSS4540', 'BUSINESS MANAGEMENT', 'DESCRIPTION OF BUSS4540', 'BU');
INSERT INTO COURSE VALUES ('BUSS2500', 'ECONOMICS I', 'DESCRIPTION OF BUSS2500', 'BU');
INSERT INTO COURSE VALUES ('BUSS1000', 'ECONOMICS II', 'DESCRIPTION OF BUSS1000', 'BU');
INSERT INTO COURSE VALUES ('ENGI4540', 'MECHANICS I', 'DESCRIPTION OF ENGI4540', 'EN');
INSERT INTO COURSE VALUES ('ENGI3540', 'MECHANICS II', 'DESCRIPTION OF ENGI3540', 'EN');
INSERT INTO COURSE VALUES ('ENGI1000', 'ENGINEERING PRINCIPLES', 'DESCRIPTION OF ENGI1000', 'EN');

insert into section_records values(01,'3000','COMP1050',9006,101,2018,'Wednesday','7:00pm','9:50pm');
insert into section_records values(02,'3001','COMP1050',9006,202,2018,'Monday','2:30pm','3:50pm');
insert into section_records values(01,'3002','COMP2080',9006,103,2015,'Sunday','2:30pm','3:50pm');
insert into section_records values(02,'3003','COMP2080',9003,102,2015,'Friday','7:00pm','9:50pm');
insert into section_records values(01,'3004','COMP2260',9001,103,2019,'Tuesday','1:00pm','2:20pm');
insert into section_records values(02,'3005','COMP2260',9001,103,2019,'Sunday','8:30am','9:50am');
insert into section_records values(01,'3006','CHEM3470',9001,101,2012,'Saturday','1:00pm','2:20pm');
insert into section_records values(02,'3007','CHEM3470',9004,103,2012,'Saturday','4:00pm','5:20pm');
insert into section_records values(01,'3008','CHEM3801',9001,101,2011,'Monday','11:30am','12:50pm');
insert into section_records values(02,'3009','CHEM3801',9004,202,2011,'Thursday','7:00pm','9:50pm');
insert into section_records values(01,'3010','CHEM4540',9004,201,2019,'Monday','2:30pm','3:50pm');
insert into section_records values(02,'3011','CHEM4540',9002,103,2019,'Friday','8:30am','9:50am');
insert into section_records values(01,'3012','BUSS4540',9003,202,2017,'Sunday','11:30am','12:50pm');
insert into section_records values(02,'3013','BUSS4540',9001,203,2017,'Saturday','5:30pm','6:50pm');
insert into section_records values(01,'3014','BUSS2500',9004,201,2015,'Thursday','1:00pm','2:20pm');
insert into section_records values(02,'3015','BUSS2500',9003,103,2015,'Saturday','1:00pm','2:20pm');
insert into section_records values(01,'3016','BUSS1000',9001,202,2019,'Monday','4:00pm','5:20pm');
insert into section_records values(02,'3017','BUSS1000',9004,202,2019,'Wednesday','11:30am','12:50pm');
insert into section_records values(01,'3018','ENGI4540',9006,102,2014,'Monday','11:30am','12:50pm');
insert into section_records values(02,'3019','ENGI4540',9003,201,2014,'Monday','11:30am','12:50pm');
insert into section_records values(01,'3020','ENGI3540',9003,101,2011,'Thursday','4:00pm','5:20pm');
insert into section_records values(02,'3021','ENGI3540',9006,103,2011,'Saturday','11:30am','12:50pm');
insert into section_records values(01,'3022','ENGI1000',9002,203,2018,'Saturday','11:30am','12:50pm');
insert into section_records values(02,'3023','ENGI1000',9003,202,2018,'Saturday','10:00am','11:20am');

insert into student_records values(1000,100000000,3007,16,'Fail','2012','S');
insert into student_records values(1001,100000000,3020,74,'Pass','2011','W');
insert into student_records values(1002,100000000,3022,63,'Pass','2018','W');
insert into student_records values(1003,100000000,3001,32,'Fail','2018','W');
insert into student_records values(1004,100000000,3012,87,'Pass','2017','F');
insert into student_records values(1005,100000000,3000,19,'Fail','2018','W');
insert into student_records values(1006,100000000,3010,87,'Pass','2019','W');
insert into student_records values(1007,100000000,3013,68,'Pass','2017','W');
insert into student_records values(1008,100000000,3023,64,'Pass','2018','S');
insert into student_records values(1009,100000000,3003,41,'Fail','2015','S');
insert into student_records values(1010,100000001,3021,98,'Pass','2011','W');
insert into student_records values(1011,100000001,3012,39,'Fail','2017','W');
insert into student_records values(1012,100000001,3015,38,'Fail','2015','S');
insert into student_records values(1013,100000001,3003,46,'Fail','2015','F');
insert into student_records values(1014,100000001,3009,88,'Pass','2011','S');
insert into student_records values(1015,100000001,3002,22,'Fail','2015','S');
insert into student_records values(1016,100000001,3013,72,'Pass','2017','S');
insert into student_records values(1017,100000001,3008,67,'Pass','2011','F');
insert into student_records values(1018,100000001,3000,68,'Pass','2018','F');
insert into student_records values(1019,100000001,3001,11,'Fail','2018','W');
insert into student_records values(1020,100000002,3013,90,'Pass','2017','S');
insert into student_records values(1021,100000002,3009,49,'Fail','2011','S');
insert into student_records values(1022,100000002,3011,61,'Pass','2019','W');
insert into student_records values(1023,100000002,3004,43,'Fail','2019','F');
insert into student_records values(1024,100000002,3022,91,'Pass','2018','F');
insert into student_records values(1025,100000002,3002,99,'Pass','2015','S');
insert into student_records values(1026,100000002,3008,59,'Pass','2011','F');
insert into student_records values(1027,100000002,3001,92,'Pass','2018','W');
insert into student_records values(1028,100000002,3017,60,'Pass','2019','F');
insert into student_records values(1029,100000002,3010,61,'Pass','2019','W');
insert into student_records values(1030,100000003,3017,11,'Fail','2019','F');
insert into student_records values(1031,100000003,3016,52,'Pass','2019','F');
insert into student_records values(1032,100000003,3021,96,'Pass','2011','W');
insert into student_records values(1033,100000003,3006,65,'Pass','2012','W');
insert into student_records values(1034,100000003,3001,49,'Fail','2018','S');
insert into student_records values(1035,100000003,3020,28,'Fail','2011','F');
insert into student_records values(1036,100000003,3018,63,'Pass','2014','W');
insert into student_records values(1037,100000003,3002,86,'Pass','2015','W');
insert into student_records values(1038,100000003,3012,27,'Fail','2017','S');
insert into student_records values(1039,100000003,3013,91,'Pass','2017','W');
insert into student_records values(1040,100000004,3013,97,'Pass','2017','W');
insert into student_records values(1041,100000004,3002,88,'Pass','2015','W');
insert into student_records values(1042,100000004,3005,19,'Fail','2019','F');
insert into student_records values(1043,100000004,3020,51,'Pass','2011','F');
insert into student_records values(1044,100000004,3008,93,'Pass','2011','W');
insert into student_records values(1045,100000004,3003,65,'Pass','2015','W');
insert into student_records values(1046,100000004,3018,38,'Fail','2014','W');
insert into student_records values(1047,100000004,3017,43,'Fail','2019','F');
insert into student_records values(1048,100000004,3006,46,'Fail','2012','F');
insert into student_records values(1049,100000004,3022,56,'Pass','2018','S');
insert into student_records values(1050,100000005,3012,68,'Pass','2017','S');
insert into student_records values(1051,100000005,3007,42,'Fail','2012','F');
insert into student_records values(1052,100000005,3017,79,'Pass','2019','W');
insert into student_records values(1053,100000005,3008,82,'Pass','2011','W');
insert into student_records values(1054,100000005,3005,51,'Pass','2019','S');
insert into student_records values(1055,100000005,3021,50,'Pass','2011','F');
insert into student_records values(1056,100000005,3015,69,'Pass','2015','W');
insert into student_records values(1057,100000005,3013,96,'Pass','2017','W');
insert into student_records values(1058,100000005,3000,99,'Pass','2018','F');
insert into student_records values(1059,100000005,3001,54,'Pass','2018','W');
insert into student_records values(1060,100000006,3006,50,'Pass','2012','F');
insert into student_records values(1061,100000006,3009,61,'Pass','2011','F');
insert into student_records values(1062,100000006,3010,83,'Pass','2019','W');
insert into student_records values(1063,100000006,3002,27,'Fail','2015','F');
insert into student_records values(1064,100000006,3016,95,'Pass','2019','W');
insert into student_records values(1065,100000006,3014,80,'Pass','2015','W');
insert into student_records values(1066,100000006,3020,78,'Pass','2011','F');
insert into student_records values(1067,100000006,3003,62,'Pass','2015','W');
insert into student_records values(1068,100000006,3015,54,'Pass','2015','F');
insert into student_records values(1069,100000006,3007,69,'Pass','2012','W');
insert into student_records values(1070,100000007,3019,61,'Pass','2014','S');
insert into student_records values(1071,100000007,3020,77,'Pass','2011','F');
insert into student_records values(1072,100000007,3014,37,'Fail','2015','F');
insert into student_records values(1073,100000007,3009,60,'Pass','2011','W');
insert into student_records values(1074,100000007,3001,32,'Fail','2018','F');
insert into student_records values(1075,100000007,3021,71,'Pass','2011','S');
insert into student_records values(1076,100000007,3023,20,'Fail','2018','F');
insert into student_records values(1077,100000007,3011,90,'Pass','2019','W');
insert into student_records values(1078,100000007,3012,89,'Pass','2017','S');
insert into student_records values(1079,100000007,3006,91,'Pass','2012','W');
insert into student_records values(1080,100000008,3011,68,'Pass','2019','W');
insert into student_records values(1081,100000008,3005,71,'Pass','2019','S');
insert into student_records values(1082,100000008,3009,51,'Pass','2011','W');
insert into student_records values(1083,100000008,3008,69,'Pass','2011','F');
insert into student_records values(1084,100000008,3019,27,'Fail','2014','S');
insert into student_records values(1085,100000008,3002,24,'Fail','2015','F');
insert into student_records values(1086,100000008,3014,35,'Fail','2015','S');
insert into student_records values(1087,100000008,3012,72,'Pass','2017','F');
insert into student_records values(1088,100000008,3023,55,'Pass','2018','S');
insert into student_records values(1089,100000008,3000,74,'Pass','2018','W');
insert into student_records values(1090,100000009,3023,99,'Pass','2018','W');
insert into student_records values(1091,100000009,3002,54,'Pass','2015','S');
insert into student_records values(1092,100000009,3022,80,'Pass','2018','S');
insert into student_records values(1093,100000009,3017,92,'Pass','2019','W');
insert into student_records values(1094,100000009,3004,40,'Fail','2019','S');
insert into student_records values(1095,100000009,3013,34,'Fail','2017','S');
insert into student_records values(1096,100000009,3006,97,'Pass','2012','F');
insert into student_records values(1097,100000009,3007,29,'Fail','2012','S');
insert into student_records values(1098,100000009,3021,19,'Fail','2011','S');
insert into student_records values(1099,100000009,3018,37,'Fail','2014','S');
insert into student_records values(1100,100000010,3000,78,'Pass','2018','W');
insert into student_records values(1101,100000010,3006,50,'Pass','2012','W');
insert into student_records values(1102,100000010,3019,13,'Fail','2014','S');
insert into student_records values(1103,100000010,3023,54,'Pass','2018','S');
insert into student_records values(1104,100000010,3021,58,'Pass','2011','S');
insert into student_records values(1105,100000010,3001,70,'Pass','2018','W');
insert into student_records values(1106,100000010,3004,10,'Fail','2019','F');
insert into student_records values(1107,100000010,3010,45,'Fail','2019','W');
insert into student_records values(1108,100000010,3015,46,'Fail','2015','F');
insert into student_records values(1109,100000010,3020,41,'Fail','2011','W');
insert into student_records values(1110,100000011,3008,67,'Pass','2011','F');
insert into student_records values(1111,100000011,3012,12,'Fail','2017','F');
insert into student_records values(1112,100000011,3010,22,'Fail','2019','W');
insert into student_records values(1113,100000011,3016,54,'Pass','2019','S');
insert into student_records values(1114,100000011,3022,36,'Fail','2018','W');
insert into student_records values(1115,100000011,3009,28,'Fail','2011','S');
insert into student_records values(1116,100000011,3002,40,'Fail','2015','S');
insert into student_records values(1117,100000011,3000,48,'Fail','2018','F');
insert into student_records values(1118,100000011,3021,49,'Fail','2011','S');
insert into student_records values(1119,100000011,3013,64,'Pass','2017','F');
insert into student_records values(1120,100000012,3017,66,'Pass','2019','S');
insert into student_records values(1121,100000012,3022,63,'Pass','2018','W');
insert into student_records values(1122,100000012,3011,82,'Pass','2019','F');
insert into student_records values(1123,100000012,3007,33,'Fail','2012','W');
insert into student_records values(1124,100000012,3009,95,'Pass','2011','F');
insert into student_records values(1125,100000012,3023,86,'Pass','2018','W');
insert into student_records values(1126,100000012,3016,18,'Fail','2019','W');
insert into student_records values(1127,100000012,3005,57,'Pass','2019','S');
insert into student_records values(1128,100000012,3004,54,'Pass','2019','S');
insert into student_records values(1129,100000012,3019,94,'Pass','2014','W');
insert into student_records values(1130,100000013,3013,58,'Pass','2017','W');
insert into student_records values(1131,100000013,3008,24,'Fail','2011','S');
insert into student_records values(1132,100000013,3023,99,'Pass','2018','S');
insert into student_records values(1133,100000013,3012,66,'Pass','2017','W');
insert into student_records values(1134,100000013,3006,86,'Pass','2012','W');
insert into student_records values(1135,100000013,3016,78,'Pass','2019','F');
insert into student_records values(1136,100000013,3015,41,'Fail','2015','F');
insert into student_records values(1137,100000013,3004,88,'Pass','2019','F');
insert into student_records values(1138,100000013,3003,83,'Pass','2015','S');
insert into student_records values(1139,100000013,3007,21,'Fail','2012','W');
insert into student_records values(1140,100000014,3006,74,'Pass','2012','F');
insert into student_records values(1141,100000014,3011,96,'Pass','2019','F');
insert into student_records values(1142,100000014,3022,37,'Fail','2018','F');
insert into student_records values(1143,100000014,3016,95,'Pass','2019','F');
insert into student_records values(1144,100000014,3012,52,'Pass','2017','S');
insert into student_records values(1145,100000014,3007,27,'Fail','2012','S');
insert into student_records values(1146,100000014,3021,75,'Pass','2011','W');
insert into student_records values(1147,100000014,3001,33,'Fail','2018','S');
insert into student_records values(1148,100000014,3010,61,'Pass','2019','S');
insert into student_records values(1149,100000014,3013,25,'Fail','2017','W');
insert into student_records values(1150,100000015,3017,62,'Pass','2019','S');
insert into student_records values(1151,100000015,3002,61,'Pass','2015','F');
insert into student_records values(1152,100000015,3005,95,'Pass','2019','F');
insert into student_records values(1153,100000015,3015,18,'Fail','2015','F');
insert into student_records values(1154,100000015,3006,81,'Pass','2012','S');
insert into student_records values(1155,100000015,3022,62,'Pass','2018','W');
insert into student_records values(1156,100000015,3007,54,'Pass','2012','W');
insert into student_records values(1157,100000015,3014,29,'Fail','2015','W');
insert into student_records values(1158,100000015,3020,25,'Fail','2011','S');
insert into student_records values(1159,100000015,3010,27,'Fail','2019','F');
insert into student_records values(1160,100000016,3015,92,'Pass','2015','W');
insert into student_records values(1161,100000016,3017,11,'Fail','2019','F');
insert into student_records values(1162,100000016,3022,90,'Pass','2018','W');
insert into student_records values(1163,100000016,3002,97,'Pass','2015','S');
insert into student_records values(1164,100000016,3014,87,'Pass','2015','W');
insert into student_records values(1165,100000016,3016,83,'Pass','2019','W');
insert into student_records values(1166,100000016,3009,10,'Fail','2011','W');
insert into student_records values(1167,100000016,3019,90,'Pass','2014','F');
insert into student_records values(1168,100000016,3023,25,'Fail','2018','F');
insert into student_records values(1169,100000016,3003,13,'Fail','2015','S');
insert into student_records values(1170,100000017,3023,18,'Fail','2018','W');
insert into student_records values(1171,100000017,3016,82,'Pass','2019','W');
insert into student_records values(1172,100000017,3005,93,'Pass','2019','W');
insert into student_records values(1173,100000017,3002,13,'Fail','2015','W');
insert into student_records values(1174,100000017,3009,14,'Fail','2011','W');
insert into student_records values(1175,100000017,3000,85,'Pass','2018','W');
insert into student_records values(1176,100000017,3020,65,'Pass','2011','W');
insert into student_records values(1177,100000017,3004,90,'Pass','2019','F');
insert into student_records values(1178,100000017,3019,75,'Pass','2014','S');
insert into student_records values(1179,100000017,3018,62,'Pass','2014','W');
insert into student_records values(1180,100000018,3012,77,'Pass','2017','F');
insert into student_records values(1181,100000018,3002,51,'Pass','2015','F');
insert into student_records values(1182,100000018,3007,27,'Fail','2012','S');
insert into student_records values(1183,100000018,3006,10,'Fail','2012','F');
insert into student_records values(1184,100000018,3004,66,'Pass','2019','F');
insert into student_records values(1185,100000018,3021,44,'Fail','2011','F');
insert into student_records values(1186,100000018,3000,87,'Pass','2018','W');
insert into student_records values(1187,100000018,3014,51,'Pass','2015','S');
insert into student_records values(1188,100000018,3016,81,'Pass','2019','W');
insert into student_records values(1189,100000018,3011,90,'Pass','2019','W');
insert into student_records values(1190,100000019,3019,81,'Pass','2014','F');
insert into student_records values(1191,100000019,3013,76,'Pass','2017','S');
insert into student_records values(1192,100000019,3000,50,'Pass','2018','F');
insert into student_records values(1193,100000019,3008,74,'Pass','2011','W');
insert into student_records values(1194,100000019,3020,96,'Pass','2011','S');
insert into student_records values(1195,100000019,3003,22,'Fail','2015','S');
insert into student_records values(1196,100000019,3017,93,'Pass','2019','F');
insert into student_records values(1197,100000019,3023,50,'Pass','2018','W');
insert into student_records values(1198,100000019,3014,98,'Pass','2015','W');
insert into student_records values(1199,100000019,3004,11,'Fail','2019','F');
insert into student_records values(1200,100000020,3002,81,'Pass','2015','F');
insert into student_records values(1201,100000020,3011,81,'Pass','2019','W');
insert into student_records values(1202,100000020,3017,83,'Pass','2019','W');
insert into student_records values(1203,100000020,3020,24,'Fail','2011','S');
insert into student_records values(1204,100000020,3009,25,'Fail','2011','F');
insert into student_records values(1205,100000020,3019,46,'Fail','2014','F');
insert into student_records values(1206,100000020,3021,46,'Fail','2011','W');
insert into student_records values(1207,100000020,3005,23,'Fail','2019','W');
insert into student_records values(1208,100000020,3003,36,'Fail','2015','F');
insert into student_records values(1209,100000020,3022,28,'Fail','2018','W');
insert into student_records values(1210,100000021,3012,69,'Pass','2017','F');
insert into student_records values(1211,100000021,3017,38,'Fail','2019','S');
insert into student_records values(1212,100000021,3023,45,'Fail','2018','W');
insert into student_records values(1213,100000021,3011,42,'Fail','2019','W');
insert into student_records values(1214,100000021,3008,41,'Fail','2011','F');
insert into student_records values(1215,100000021,3014,27,'Fail','2015','W');
insert into student_records values(1216,100000021,3018,28,'Fail','2014','F');
insert into student_records values(1217,100000021,3019,88,'Pass','2014','F');
insert into student_records values(1218,100000021,3006,42,'Fail','2012','S');
insert into student_records values(1219,100000021,3003,15,'Fail','2015','S');
insert into student_records values(1220,100000022,3010,45,'Fail','2019','F');
insert into student_records values(1221,100000022,3017,96,'Pass','2019','F');
insert into student_records values(1222,100000022,3011,63,'Pass','2019','S');
insert into student_records values(1223,100000022,3004,26,'Fail','2019','S');
insert into student_records values(1224,100000022,3008,14,'Fail','2011','F');
insert into student_records values(1225,100000022,3005,98,'Pass','2019','S');
insert into student_records values(1226,100000022,3020,89,'Pass','2011','W');
insert into student_records values(1227,100000022,3018,99,'Pass','2014','F');
insert into student_records values(1228,100000022,3022,96,'Pass','2018','F');
insert into student_records values(1229,100000022,3019,29,'Fail','2014','S');
insert into student_records values(1230,100000023,3013,21,'Fail','2017','W');
insert into student_records values(1231,100000023,3006,69,'Pass','2012','S');
insert into student_records values(1232,100000023,3023,52,'Pass','2018','F');
insert into student_records values(1233,100000023,3009,63,'Pass','2011','W');
insert into student_records values(1234,100000023,3001,46,'Fail','2018','W');
insert into student_records values(1235,100000023,3008,86,'Pass','2011','F');
insert into student_records values(1236,100000023,3012,86,'Pass','2017','W');
insert into student_records values(1237,100000023,3017,40,'Fail','2019','W');
insert into student_records values(1238,100000023,3014,74,'Pass','2015','F');
insert into student_records values(1239,100000023,3020,88,'Pass','2011','W');
insert into student_records values(1240,100000024,3023,45,'Fail','2018','S');
insert into student_records values(1241,100000024,3003,43,'Fail','2015','W');
insert into student_records values(1242,100000024,3004,89,'Pass','2019','W');
insert into student_records values(1243,100000024,3014,51,'Pass','2015','S');
insert into student_records values(1244,100000024,3000,64,'Pass','2018','W');
insert into student_records values(1245,100000024,3005,14,'Fail','2019','W');
insert into student_records values(1246,100000024,3007,47,'Fail','2012','F');
insert into student_records values(1247,100000024,3008,26,'Fail','2011','W');
insert into student_records values(1248,100000024,3009,63,'Pass','2011','S');
insert into student_records values(1249,100000024,3019,56,'Pass','2014','W');
insert into student_records values(1250,100000025,3019,47,'Fail','2014','W');
insert into student_records values(1251,100000025,3002,28,'Fail','2015','F');
insert into student_records values(1252,100000025,3014,59,'Pass','2015','S');
insert into student_records values(1253,100000025,3018,87,'Pass','2014','W');
insert into student_records values(1254,100000025,3022,54,'Pass','2018','F');
insert into student_records values(1255,100000025,3020,63,'Pass','2011','S');
insert into student_records values(1256,100000025,3000,83,'Pass','2018','F');
insert into student_records values(1257,100000025,3009,77,'Pass','2011','F');
insert into student_records values(1258,100000025,3016,14,'Fail','2019','S');
insert into student_records values(1259,100000025,3004,57,'Pass','2019','S');
insert into student_records values(1260,100000026,3016,32,'Fail','2019','W');
insert into student_records values(1261,100000026,3006,25,'Fail','2012','F');
insert into student_records values(1262,100000026,3014,19,'Fail','2015','F');
insert into student_records values(1263,100000026,3004,38,'Fail','2019','W');
insert into student_records values(1264,100000026,3015,11,'Fail','2015','S');
insert into student_records values(1265,100000026,3010,55,'Pass','2019','F');
insert into student_records values(1266,100000026,3017,67,'Pass','2019','S');
insert into student_records values(1267,100000026,3005,49,'Fail','2019','F');
insert into student_records values(1268,100000026,3001,87,'Pass','2018','S');
insert into student_records values(1269,100000026,3020,57,'Pass','2011','F');
insert into student_records values(1270,100000027,3013,42,'Fail','2017','S');
insert into student_records values(1271,100000027,3007,47,'Fail','2012','W');
insert into student_records values(1272,100000027,3018,16,'Fail','2014','F');
insert into student_records values(1273,100000027,3009,59,'Pass','2011','W');
insert into student_records values(1274,100000027,3003,18,'Fail','2015','W');
insert into student_records values(1275,100000027,3002,93,'Pass','2015','S');
insert into student_records values(1276,100000027,3010,66,'Pass','2019','W');
insert into student_records values(1277,100000027,3021,35,'Fail','2011','F');
insert into student_records values(1278,100000027,3011,54,'Pass','2019','W');
insert into student_records values(1279,100000027,3012,55,'Pass','2017','W');
insert into student_records values(1280,100000028,3001,71,'Pass','2018','S');
insert into student_records values(1281,100000028,3017,56,'Pass','2019','W');
insert into student_records values(1282,100000028,3006,18,'Fail','2012','S');
insert into student_records values(1283,100000028,3021,74,'Pass','2011','S');
insert into student_records values(1284,100000028,3019,29,'Fail','2014','W');
insert into student_records values(1285,100000028,3011,20,'Fail','2019','W');
insert into student_records values(1286,100000028,3014,31,'Fail','2015','W');
insert into student_records values(1287,100000028,3015,51,'Pass','2015','S');
insert into student_records values(1288,100000028,3002,89,'Pass','2015','F');
insert into student_records values(1289,100000028,3010,53,'Pass','2019','W');
insert into student_records values(1290,100000029,3006,41,'Fail','2012','W');
insert into student_records values(1291,100000029,3022,23,'Fail','2018','F');
insert into student_records values(1292,100000029,3000,12,'Fail','2018','W');
insert into student_records values(1293,100000029,3015,25,'Fail','2015','F');
insert into student_records values(1294,100000029,3020,70,'Pass','2011','W');
insert into student_records values(1295,100000029,3019,77,'Pass','2014','W');
insert into student_records values(1296,100000029,3005,42,'Fail','2019','S');
insert into student_records values(1297,100000029,3004,92,'Pass','2019','W');
insert into student_records values(1298,100000029,3017,53,'Pass','2019','F');
insert into student_records values(1299,100000029,3002,68,'Pass','2015','W');
insert into student_records values(1300,100000030,3022,53,'Pass','2018','F');
insert into student_records values(1301,100000030,3007,32,'Fail','2012','F');
insert into student_records values(1302,100000030,3020,63,'Pass','2011','F');
insert into student_records values(1303,100000030,3012,61,'Pass','2017','S');
insert into student_records values(1304,100000030,3002,49,'Fail','2015','S');
insert into student_records values(1305,100000030,3017,91,'Pass','2019','S');
insert into student_records values(1306,100000030,3005,43,'Fail','2019','F');
insert into student_records values(1307,100000030,3016,36,'Fail','2019','F');
insert into student_records values(1308,100000030,3006,58,'Pass','2012','W');
insert into student_records values(1309,100000030,3003,91,'Pass','2015','S');
insert into student_records values(1310,100000031,3014,98,'Pass','2015','S');
insert into student_records values(1311,100000031,3009,41,'Fail','2011','F');
insert into student_records values(1312,100000031,3005,35,'Fail','2019','W');
insert into student_records values(1313,100000031,3018,73,'Pass','2014','F');
insert into student_records values(1314,100000031,3022,29,'Fail','2018','S');
insert into student_records values(1315,100000031,3002,87,'Pass','2015','W');
insert into student_records values(1316,100000031,3007,50,'Pass','2012','S');
insert into student_records values(1317,100000031,3013,64,'Pass','2017','W');
insert into student_records values(1318,100000031,3015,57,'Pass','2015','S');
insert into student_records values(1319,100000031,3019,32,'Fail','2014','W');
insert into student_records values(1320,100000032,3009,47,'Fail','2011','S');
insert into student_records values(1321,100000032,3001,48,'Fail','2018','W');
insert into student_records values(1322,100000032,3019,23,'Fail','2014','F');
insert into student_records values(1323,100000032,3017,23,'Fail','2019','F');
insert into student_records values(1324,100000032,3023,70,'Pass','2018','W');
insert into student_records values(1325,100000032,3008,25,'Fail','2011','S');
insert into student_records values(1326,100000032,3000,37,'Fail','2018','F');
insert into student_records values(1327,100000032,3021,81,'Pass','2011','F');
insert into student_records values(1328,100000032,3022,45,'Fail','2018','F');
insert into student_records values(1329,100000032,3016,60,'Pass','2019','W');
insert into student_records values(1330,100000033,3022,94,'Pass','2018','F');
insert into student_records values(1331,100000033,3013,21,'Fail','2017','W');
insert into student_records values(1332,100000033,3010,31,'Fail','2019','S');
insert into student_records values(1333,100000033,3020,96,'Pass','2011','F');
insert into student_records values(1334,100000033,3006,79,'Pass','2012','S');
insert into student_records values(1335,100000033,3002,96,'Pass','2015','F');
insert into student_records values(1336,100000033,3007,57,'Pass','2012','W');
insert into student_records values(1337,100000033,3008,68,'Pass','2011','F');
insert into student_records values(1338,100000033,3017,11,'Fail','2019','F');
insert into student_records values(1339,100000033,3023,52,'Pass','2018','S');
insert into student_records values(1340,100000034,3021,60,'Pass','2011','S');
insert into student_records values(1341,100000034,3018,75,'Pass','2014','W');
insert into student_records values(1342,100000034,3020,40,'Fail','2011','F');
insert into student_records values(1343,100000034,3013,90,'Pass','2017','W');
insert into student_records values(1344,100000034,3023,18,'Fail','2018','F');
insert into student_records values(1345,100000034,3012,70,'Pass','2017','S');
insert into student_records values(1346,100000034,3003,83,'Pass','2015','W');
insert into student_records values(1347,100000034,3000,15,'Fail','2018','S');
insert into student_records values(1348,100000034,3004,85,'Pass','2019','S');
insert into student_records values(1349,100000034,3019,95,'Pass','2014','F');
insert into student_records values(1350,100000035,3005,65,'Pass','2019','F');
insert into student_records values(1351,100000035,3012,16,'Fail','2017','W');
insert into student_records values(1352,100000035,3010,61,'Pass','2019','W');
insert into student_records values(1353,100000035,3014,72,'Pass','2015','W');
insert into student_records values(1354,100000035,3016,30,'Fail','2019','F');
insert into student_records values(1355,100000035,3021,32,'Fail','2011','F');
insert into student_records values(1356,100000035,3007,62,'Pass','2012','W');
insert into student_records values(1357,100000035,3006,68,'Pass','2012','W');
insert into student_records values(1358,100000035,3001,24,'Fail','2018','W');
insert into student_records values(1359,100000035,3003,44,'Fail','2015','W');
insert into student_records values(1360,100000036,3019,82,'Pass','2014','W');
insert into student_records values(1361,100000036,3015,42,'Fail','2015','F');
insert into student_records values(1362,100000036,3014,92,'Pass','2015','S');
insert into student_records values(1363,100000036,3022,96,'Pass','2018','W');
insert into student_records values(1364,100000036,3013,58,'Pass','2017','S');
insert into student_records values(1365,100000036,3017,99,'Pass','2019','W');
insert into student_records values(1366,100000036,3003,89,'Pass','2015','W');
insert into student_records values(1367,100000036,3005,29,'Fail','2019','F');
insert into student_records values(1368,100000036,3020,65,'Pass','2011','F');
insert into student_records values(1369,100000036,3018,47,'Fail','2014','W');
insert into student_records values(1370,100000037,3021,73,'Pass','2011','W');
insert into student_records values(1371,100000037,3013,96,'Pass','2017','F');
insert into student_records values(1372,100000037,3018,99,'Pass','2014','W');
insert into student_records values(1373,100000037,3022,94,'Pass','2018','S');
insert into student_records values(1374,100000037,3015,49,'Fail','2015','W');
insert into student_records values(1375,100000037,3011,73,'Pass','2019','F');
insert into student_records values(1376,100000037,3002,71,'Pass','2015','S');
insert into student_records values(1377,100000037,3004,30,'Fail','2019','W');
insert into student_records values(1378,100000037,3014,63,'Pass','2015','F');
insert into student_records values(1379,100000037,3000,65,'Pass','2018','W');
insert into student_records values(1380,100000038,3007,19,'Fail','2012','F');
insert into student_records values(1381,100000038,3023,13,'Fail','2018','S');
insert into student_records values(1382,100000038,3001,79,'Pass','2018','W');
insert into student_records values(1383,100000038,3011,46,'Fail','2019','F');
insert into student_records values(1384,100000038,3019,40,'Fail','2014','W');
insert into student_records values(1385,100000038,3005,62,'Pass','2019','W');
insert into student_records values(1386,100000038,3006,97,'Pass','2012','S');
insert into student_records values(1387,100000038,3002,60,'Pass','2015','W');
insert into student_records values(1388,100000038,3021,97,'Pass','2011','W');
insert into student_records values(1389,100000038,3008,89,'Pass','2011','W');
insert into student_records values(1390,100000039,3008,34,'Fail','2011','W');
insert into student_records values(1391,100000039,3011,86,'Pass','2019','S');
insert into student_records values(1392,100000039,3014,83,'Pass','2015','W');
insert into student_records values(1393,100000039,3002,21,'Fail','2015','S');
insert into student_records values(1394,100000039,3010,62,'Pass','2019','W');
insert into student_records values(1395,100000039,3017,86,'Pass','2019','W');
insert into student_records values(1396,100000039,3018,46,'Fail','2014','S');
insert into student_records values(1397,100000039,3009,87,'Pass','2011','W');
insert into student_records values(1398,100000039,3001,44,'Fail','2018','F');
insert into student_records values(1399,100000039,3015,91,'Pass','2015','S');
insert into student_records values(1400,100000040,3014,94,'Pass','2015','W');
insert into student_records values(1401,100000040,3001,53,'Pass','2018','W');
insert into student_records values(1402,100000040,3005,72,'Pass','2019','S');
insert into student_records values(1403,100000040,3017,59,'Pass','2019','W');
insert into student_records values(1404,100000040,3013,96,'Pass','2017','F');
insert into student_records values(1405,100000040,3002,92,'Pass','2015','F');
insert into student_records values(1406,100000040,3009,51,'Pass','2011','F');
insert into student_records values(1407,100000040,3004,44,'Fail','2019','S');
insert into student_records values(1408,100000040,3006,21,'Fail','2012','W');
insert into student_records values(1409,100000040,3020,71,'Pass','2011','F');
insert into student_records values(1410,100000041,3011,65,'Pass','2019','W');
insert into student_records values(1411,100000041,3023,14,'Fail','2018','S');
insert into student_records values(1412,100000041,3000,10,'Fail','2018','W');
insert into student_records values(1413,100000041,3004,66,'Pass','2019','W');
insert into student_records values(1414,100000041,3009,83,'Pass','2011','W');
insert into student_records values(1415,100000041,3013,31,'Fail','2017','W');
insert into student_records values(1416,100000041,3022,32,'Fail','2018','S');
insert into student_records values(1417,100000041,3005,88,'Pass','2019','W');
insert into student_records values(1418,100000041,3002,83,'Pass','2015','S');
insert into student_records values(1419,100000041,3012,85,'Pass','2017','W');
insert into student_records values(1420,100000042,3008,34,'Fail','2011','F');
insert into student_records values(1421,100000042,3005,32,'Fail','2019','F');
insert into student_records values(1422,100000042,3014,85,'Pass','2015','W');
insert into student_records values(1423,100000042,3016,55,'Pass','2019','W');
insert into student_records values(1424,100000042,3007,20,'Fail','2012','W');
insert into student_records values(1425,100000042,3001,63,'Pass','2018','W');
insert into student_records values(1426,100000042,3010,43,'Fail','2019','W');
insert into student_records values(1427,100000042,3003,79,'Pass','2015','F');
insert into student_records values(1428,100000042,3018,16,'Fail','2014','W');
insert into student_records values(1429,100000042,3006,84,'Pass','2012','W');
insert into student_records values(1430,100000043,3010,96,'Pass','2019','W');
insert into student_records values(1431,100000043,3005,33,'Fail','2019','F');
insert into student_records values(1432,100000043,3007,38,'Fail','2012','S');
insert into student_records values(1433,100000043,3001,54,'Pass','2018','S');
insert into student_records values(1434,100000043,3009,91,'Pass','2011','W');
insert into student_records values(1435,100000043,3008,58,'Pass','2011','F');
insert into student_records values(1436,100000043,3002,46,'Fail','2015','F');
insert into student_records values(1437,100000043,3019,65,'Pass','2014','F');
insert into student_records values(1438,100000043,3000,54,'Pass','2018','F');
insert into student_records values(1439,100000043,3011,24,'Fail','2019','F');
insert into student_records values(1440,100000044,3000,74,'Pass','2018','S');
insert into student_records values(1441,100000044,3002,55,'Pass','2015','W');
insert into student_records values(1442,100000044,3020,22,'Fail','2011','W');
insert into student_records values(1443,100000044,3007,85,'Pass','2012','F');
insert into student_records values(1444,100000044,3001,89,'Pass','2018','F');
insert into student_records values(1445,100000044,3004,69,'Pass','2019','W');
insert into student_records values(1446,100000044,3019,62,'Pass','2014','W');
insert into student_records values(1447,100000044,3006,58,'Pass','2012','F');
insert into student_records values(1448,100000044,3012,44,'Fail','2017','S');
insert into student_records values(1449,100000044,3003,29,'Fail','2015','W');
insert into student_records values(1450,100000045,3002,98,'Pass','2015','W');
insert into student_records values(1451,100000045,3020,76,'Pass','2011','S');
insert into student_records values(1452,100000045,3013,83,'Pass','2017','W');
insert into student_records values(1453,100000045,3007,38,'Fail','2012','F');
insert into student_records values(1454,100000045,3005,25,'Fail','2019','W');
insert into student_records values(1455,100000045,3019,66,'Pass','2014','F');
insert into student_records values(1456,100000045,3023,80,'Pass','2018','F');
insert into student_records values(1457,100000045,3015,88,'Pass','2015','S');
insert into student_records values(1458,100000045,3021,63,'Pass','2011','F');
insert into student_records values(1459,100000045,3009,21,'Fail','2011','S');
insert into student_records values(1460,100000046,3013,45,'Fail','2017','W');
insert into student_records values(1461,100000046,3014,81,'Pass','2015','F');
insert into student_records values(1462,100000046,3008,35,'Fail','2011','F');
insert into student_records values(1463,100000046,3016,94,'Pass','2019','S');
insert into student_records values(1464,100000046,3017,10,'Fail','2019','F');
insert into student_records values(1465,100000046,3001,17,'Fail','2018','F');
insert into student_records values(1466,100000046,3000,42,'Fail','2018','F');
insert into student_records values(1467,100000046,3019,43,'Fail','2014','W');
insert into student_records values(1468,100000046,3009,44,'Fail','2011','W');
insert into student_records values(1469,100000046,3004,92,'Pass','2019','F');
insert into student_records values(1470,100000047,3018,75,'Pass','2014','F');
insert into student_records values(1471,100000047,3016,24,'Fail','2019','F');
insert into student_records values(1472,100000047,3004,43,'Fail','2019','F');
insert into student_records values(1473,100000047,3011,99,'Pass','2019','S');
insert into student_records values(1474,100000047,3007,92,'Pass','2012','W');
insert into student_records values(1475,100000047,3003,17,'Fail','2015','F');
insert into student_records values(1476,100000047,3020,86,'Pass','2011','S');
insert into student_records values(1477,100000047,3014,85,'Pass','2015','W');
insert into student_records values(1478,100000047,3021,75,'Pass','2011','S');
insert into student_records values(1479,100000047,3001,45,'Fail','2018','W');
insert into student_records values(1480,100000048,3004,35,'Fail','2019','S');
insert into student_records values(1481,100000048,3014,47,'Fail','2015','S');
insert into student_records values(1482,100000048,3023,56,'Pass','2018','S');
insert into student_records values(1483,100000048,3022,86,'Pass','2018','W');
insert into student_records values(1484,100000048,3013,54,'Pass','2017','W');
insert into student_records values(1485,100000048,3003,41,'Fail','2015','F');
insert into student_records values(1486,100000048,3019,12,'Fail','2014','S');
insert into student_records values(1487,100000048,3001,39,'Fail','2018','S');
insert into student_records values(1488,100000048,3002,31,'Fail','2015','S');
insert into student_records values(1489,100000048,3000,13,'Fail','2018','F');
insert into student_records values(1490,100000049,3018,32,'Fail','2014','F');
insert into student_records values(1491,100000049,3006,40,'Fail','2012','S');
insert into student_records values(1492,100000049,3004,25,'Fail','2019','W');
insert into student_records values(1493,100000049,3014,55,'Pass','2015','S');
insert into student_records values(1494,100000049,3021,72,'Pass','2011','W');
insert into student_records values(1495,100000049,3015,92,'Pass','2015','S');
insert into student_records values(1496,100000049,3008,18,'Fail','2011','S');
insert into student_records values(1497,100000049,3009,35,'Fail','2011','F');
insert into student_records values(1498,100000049,3017,52,'Pass','2019','W');
insert into student_records values(1499,100000049,3022,83,'Pass','2018','W');


-- Procedure to apply a 5% curve to a section
DELIMITER $$
CREATE PROCEDURE applyCurve (
    IN sec char(4)
)
BEGIN
	UPDATE student_records SET grade = grade * 1.05 where
	section_rec = sec; 
END$$
DELIMITER ;

-- Procedure to get grade total and number of courses
DELIMITER $$
CREATE PROCEDURE getGrades (
	IN id integer,
    INOUT total integer,
    INOUT number123 integer
)
BEGIN

	DECLARE finished INTEGER DEFAULT 0;
	declare tempGrade integer;
    
    DEClARE c1 
        CURSOR FOR 
            Select grade from student_records where
            student_id = id;

	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
	
    open c1;
    
    doLoop: LOOP
        FETCH c1 INTO tempGrade;
        IF finished = 1 THEN 
            LEAVE doLoop;
        END IF;
        
        SET total = total + tempGrade;
        set number123 = number123 + 1;
    END LOOP doLoop;
    
    close c1;
    
END$$
DELIMITER ;

-- Procedure to calculate and update GPAs
DELIMITER $$
CREATE PROCEDURE calculateGPA()
BEGIN
	
    declare id integer;
    declare total integer;
    declare num_of_courses integer;
    declare new_avg double;
    
    DECLARE finished INTEGER DEFAULT 0;
    
    DEClARE c1 
        CURSOR FOR 
		SELECT student_id FROM student;
    
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
    
	open c1;
    
    doLoop: LOOP
        FETCH c1 INTO id;
        set total = 0;
        set num_of_courses = 0;
        set new_avg = 0.0;
        IF finished = 1 THEN 
            LEAVE doLoop;
        END IF;
		
		call getGrades(id, total, num_of_courses);
        set new_avg = cast(total as double) / cast(num_of_courses as double);
        update student set gpa = new_avg where student_id = id;
    END LOOP doLoop;
    
    close c1;
    
END$$
DELIMITER ;

-- Trigger for whenever a curve is applied through applyCurve(...)
CREATE TRIGGER after_curve 
    after UPDATE ON student_records
    FOR EACH ROW 
	CALL calculateGPA();

-- Procedure to add a student to the database
DELIMITER $$
CREATE PROCEDURE addStudent(
	IN first varchar(20),
    IN last varchar(20),
    IN major varchar(30)
)
BEGIN
	
    declare email varchar(30);
	declare dep_code char(2);
    declare id integer(9);
    
    set email = concat(concat(left(first, 1), last), '@uwindsor.ca');
    
    CASE major
		WHEN 'Computer Science' THEN set dep_code = 'CS'; 
		WHEN 'Chemistry' THEN set dep_code = 'CS';
		WHEN 'Business' THEN set dep_code = 'CS';
		WHEN 'Engineering' THEN set dep_code = 'CS';
        else set dep_code = 'NA';
	END CASE;
    
    set id = (select student_id from student order by student_id desc limit 1) + 1;
	INSERT INTO STUDENT VALUES(id, first, last, email, major, 0, dep_code);
    
END$$
DELIMITER ;
