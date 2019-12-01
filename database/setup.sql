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

insert into student values(116607267,'Jacki','Mcelyea','JMcelyea@uwindsor.ca','Chemistry',56.12,'CH');
insert into student values(555203208,'Rowena','Julio','RJulio@uwindsor.ca','Computer Science',84.16,'CS');
insert into student values(985247948,'Faith','Kolesar','FKolesar@uwindsor.ca','Business',71.8,'BU');
insert into student values(906494709,'Vonnie','Rohrbaugh','VRohrbaugh@uwindsor.ca','Chemistry',79.77,'CH');
insert into student values(582712075,'Gilberte','Ober','GOber@uwindsor.ca','Computer Science',71.03,'CS');
insert into student values(583279241,'Carline','Trew','CTrew@uwindsor.ca','Engineering',53.0,'EN');
insert into student values(810969560,'Alesia','Stead','AStead@uwindsor.ca','Engineering',92.79,'EN');
insert into student values(984804930,'Easter','Harrison','EHarrison@uwindsor.ca','Engineering',77.5,'EN');
insert into student values(816838741,'Arianne','Weidman','AWeidman@uwindsor.ca','Engineering',93.96,'EN');
insert into student values(719250756,'Kym','Fulk','KFulk@uwindsor.ca','Business',67.6,'BU');
insert into student values(836272296,'Juanita','Munsey','JMunsey@uwindsor.ca','Computer Science',69.31,'CS');
insert into student values(404738465,'Emeline','Pomeroy','EPomeroy@uwindsor.ca','Chemistry',97.08,'CH');
insert into student values(403639680,'Lizzie','Mcfate','LMcfate@uwindsor.ca','Business',92.84,'BU');
insert into student values(345619669,'Verda','Carrales','VCarrales@uwindsor.ca','Engineering',85.9,'EN');
insert into student values(705296532,'Shiela','Heber','SHeber@uwindsor.ca','Chemistry',57.13,'CH');
insert into student values(998958618,'Elicia','Balas','EBalas@uwindsor.ca','Business',84.7,'BU');
insert into student values(145701353,'Tiffanie','Wiese','TWiese@uwindsor.ca','Business',53.44,'BU');
insert into student values(598977255,'Monica','Hammaker','MHammaker@uwindsor.ca','Business',65.29,'BU');
insert into student values(845586701,'Hung','Clampitt','HClampitt@uwindsor.ca','Computer Science',80.6,'CS');
insert into student values(546486109,'Glennis','Royston','GRoyston@uwindsor.ca','Business',87.98,'BU');
insert into student values(278476656,'Hassan','Hamann','HHamann@uwindsor.ca','Chemistry',95.91,'CH');
insert into student values(524090352,'Carman','Hillwig','CHillwig@uwindsor.ca','Engineering',57.79,'EN');
insert into student values(479437427,'Briana','Streater','BStreater@uwindsor.ca','Computer Science',77.23,'CS');
insert into student values(726057515,'Marcelene','Brophy','MBrophy@uwindsor.ca','Business',52.29,'BU');
insert into student values(949915032,'Liane','Vaquera','LVaquera@uwindsor.ca','Computer Science',68.49,'CS');
insert into student values(720476043,'Ching','Bigler','CBigler@uwindsor.ca','Engineering',87.87,'EN');
insert into student values(284998264,'Lincoln','Engberg','LEngberg@uwindsor.ca','Chemistry',52.92,'CH');
insert into student values(592700431,'Victor','Conners','VConners@uwindsor.ca','Business',87.34,'BU');
insert into student values(207630767,'Vada','Myron','VMyron@uwindsor.ca','Chemistry',93.93,'CH');
insert into student values(819680764,'Risa','Hazen','RHazen@uwindsor.ca','Business',55.87,'BU');
insert into student values(108772666,'Blondell','Decarlo','BDecarlo@uwindsor.ca','Computer Science',94.39,'CS');
insert into student values(811054584,'Debby','Efird','DEfird@uwindsor.ca','Chemistry',91.59,'CH');
insert into student values(159820213,'Josef','Deeb','JDeeb@uwindsor.ca','Computer Science',88.57,'CS');
insert into student values(947732495,'Shannan','Pasley','SPasley@uwindsor.ca','Chemistry',97.31,'CH');
insert into student values(876060224,'Rickey','Koury','RKoury@uwindsor.ca','Engineering',55.72,'EN');
insert into student values(571884775,'Alvina','Kabel','AKabel@uwindsor.ca','Business',75.86,'BU');
insert into student values(228427847,'Mellie','Barlowe','MBarlowe@uwindsor.ca','Engineering',88.23,'EN');
insert into student values(578831017,'Jerry','Calley','JCalley@uwindsor.ca','Engineering',83.22,'EN');
insert into student values(762609761,'Vicente','Kearns','VKearns@uwindsor.ca','Business',52.85,'BU');
insert into student values(178018990,'Vance','Bialek','VBialek@uwindsor.ca','Business',90.09,'BU');
insert into student values(504403937,'Rufina','Wiggs','RWiggs@uwindsor.ca','Business',94.76,'BU');
insert into student values(736347887,'Cristy','Lis','CLis@uwindsor.ca','Chemistry',73.97,'CH');
insert into student values(864907504,'Sergio','Pocock','SPocock@uwindsor.ca','Computer Science',91.63,'CS');
insert into student values(221417528,'Eulah','Zemlicka','EZemlicka@uwindsor.ca','Computer Science',53.86,'CS');
insert into student values(833680654,'Millie','Davy','MDavy@uwindsor.ca','Business',87.96,'BU');
insert into student values(484379339,'Herlinda','Kreger','HKreger@uwindsor.ca','Business',74.98,'BU');
insert into student values(970681580,'Roselyn','Mcquaid','RMcquaid@uwindsor.ca','Computer Science',66.82,'CS');
insert into student values(120430301,'Gabriele','Villagran','GVillagran@uwindsor.ca','Chemistry',54.61,'CH');
insert into student values(517073466,'Emogene','Morain','EMorain@uwindsor.ca','Business',62.71,'BU');
insert into student values(638059867,'Mildred','Bulli','MBulli@uwindsor.ca','Chemistry',60.98,'CH');

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

insert into section_records values(01,'8963','CHEM3470',9003,203,'Saturday','10:00am','11:20am');
insert into section_records values(01,'6684','COMP2080',9005,202,'Sunday','11:30am','12:50pm');
insert into section_records values(01,'2087','ENGI3540',9006,102,'Sunday','1:00pm','2:20pm');
insert into section_records values(01,'2799','CHEM4540',9006,201,'Wednesday','11:30am','12:50pm');
insert into section_records values(01,'9916','BUSS4540',9001,202,'Saturday','8:30am','9:50am');
insert into section_records values(01,'8720','COMP2260',9006,101,'Tuesday','10:00am','11:20am');
insert into section_records values(01,'7176','COMP1050',9005,102,'Wednesday','11:30am','12:50pm');
insert into section_records values(01,'7568','ENGI1000',9005,103,'Wednesday','5:30pm','6:50pm');
insert into section_records values(01,'6606','ENGI4540',9002,202,'Monday','1:00pm','2:20pm');
insert into section_records values(01,'6647','CHEM3801',9001,102,'Monday','8:30am','9:50am');
insert into section_records values(01,'7375','BUSS4540',9002,202,'Saturday','5:30pm','6:50pm');
insert into section_records values(01,'7218','BUSS2500',9004,102,'Tuesday','7:00pm','9:50pm');

insert into student_records values(8433,116607267,7375,26,'Fail','2017','S');
insert into student_records values(1039,116607267,7218,32,'Fail','2017','S');
insert into student_records values(5914,116607267,7375,65,'Pass','2017','W');
insert into student_records values(1672,555203208,9916,95,'Pass','2017','S');
insert into student_records values(9697,555203208,8720,71,'Pass','2017','W');
insert into student_records values(8146,555203208,6684,97,'Pass','2017','F');
insert into student_records values(2744,985247948,2087,95,'Pass','2017','W');
insert into student_records values(9268,985247948,7568,27,'Fail','2017','W');
insert into student_records values(7425,985247948,7218,30,'Fail','2017','F');
insert into student_records values(8124,906494709,7176,48,'Fail','2017','F');
insert into student_records values(8370,906494709,8963,40,'Fail','2017','W');
insert into student_records values(5184,906494709,8720,15,'Fail','2017','F');
insert into student_records values(9141,582712075,7568,37,'Fail','2017','W');
insert into student_records values(8620,582712075,7176,48,'Fail','2017','W');
insert into student_records values(9028,582712075,2087,98,'Pass','2017','F');
insert into student_records values(2859,583279241,6647,10,'Fail','2017','W');
insert into student_records values(8150,583279241,7375,48,'Fail','2017','W');
insert into student_records values(9402,583279241,8720,57,'Pass','2017','S');
insert into student_records values(8754,810969560,7176,74,'Pass','2017','W');
insert into student_records values(1830,810969560,8720,52,'Pass','2017','S');
insert into student_records values(2239,810969560,8963,86,'Pass','2017','F');
insert into student_records values(1951,984804930,7568,31,'Fail','2017','F');
insert into student_records values(9457,984804930,7218,48,'Fail','2017','F');
insert into student_records values(6575,984804930,2799,84,'Pass','2017','S');
insert into student_records values(2149,816838741,2087,26,'Fail','2017','S');
insert into student_records values(8173,816838741,7218,33,'Fail','2017','S');
insert into student_records values(5626,816838741,6647,37,'Fail','2017','F');
insert into student_records values(8337,719250756,7375,53,'Pass','2017','F');
insert into student_records values(3495,719250756,6684,68,'Pass','2017','F');
insert into student_records values(9150,719250756,7568,37,'Fail','2017','F');
insert into student_records values(4599,836272296,2087,75,'Pass','2017','F');
insert into student_records values(7125,836272296,6684,43,'Fail','2017','S');
insert into student_records values(5074,836272296,2087,97,'Pass','2017','F');
insert into student_records values(1996,404738465,2087,28,'Fail','2017','W');
insert into student_records values(8026,404738465,7176,12,'Fail','2017','S');
insert into student_records values(7081,404738465,8963,24,'Fail','2017','S');
insert into student_records values(4595,403639680,7176,33,'Fail','2017','F');
insert into student_records values(3306,403639680,7375,37,'Fail','2017','F');
insert into student_records values(6441,403639680,2799,99,'Pass','2017','F');
insert into student_records values(3785,345619669,6684,14,'Fail','2017','W');
insert into student_records values(2193,345619669,8720,72,'Pass','2017','W');
insert into student_records values(6236,345619669,8720,70,'Pass','2017','S');
insert into student_records values(6284,705296532,7375,57,'Pass','2017','F');
insert into student_records values(4328,705296532,8963,81,'Pass','2017','W');
insert into student_records values(7354,705296532,9916,64,'Pass','2017','S');
insert into student_records values(1427,998958618,6684,78,'Pass','2017','S');
insert into student_records values(3672,998958618,6606,43,'Fail','2017','F');
insert into student_records values(7046,998958618,6606,58,'Pass','2017','W');
insert into student_records values(5905,145701353,9916,78,'Pass','2017','W');
insert into student_records values(4233,145701353,8720,85,'Pass','2017','W');
insert into student_records values(4143,145701353,7176,37,'Fail','2017','W');
insert into student_records values(4925,598977255,7176,15,'Fail','2017','F');
insert into student_records values(4112,598977255,2799,51,'Pass','2017','W');
insert into student_records values(6815,598977255,9916,67,'Pass','2017','S');
insert into student_records values(1721,845586701,7176,26,'Fail','2017','S');
insert into student_records values(9436,845586701,8963,89,'Pass','2017','F');
insert into student_records values(3644,845586701,6606,13,'Fail','2017','W');
insert into student_records values(5073,546486109,7176,19,'Fail','2017','F');
insert into student_records values(1908,546486109,7568,12,'Fail','2017','W');
insert into student_records values(5724,546486109,7176,76,'Pass','2017','S');
insert into student_records values(9795,278476656,9916,76,'Pass','2017','F');
insert into student_records values(1966,278476656,2799,81,'Pass','2017','F');
insert into student_records values(8166,278476656,6647,21,'Fail','2017','W');
insert into student_records values(3985,524090352,9916,58,'Pass','2017','F');
insert into student_records values(4481,524090352,2799,43,'Fail','2017','F');
insert into student_records values(8669,524090352,6684,22,'Fail','2017','S');
insert into student_records values(6907,479437427,7218,11,'Fail','2017','W');
insert into student_records values(5171,479437427,6606,50,'Pass','2017','F');
insert into student_records values(3358,479437427,8963,10,'Fail','2017','S');
insert into student_records values(3722,726057515,2799,81,'Pass','2017','S');
insert into student_records values(9162,726057515,7176,57,'Pass','2017','F');
insert into student_records values(6484,726057515,6684,84,'Pass','2017','S');
insert into student_records values(6369,949915032,2087,33,'Fail','2017','F');
insert into student_records values(4274,949915032,9916,74,'Pass','2017','S');
insert into student_records values(4366,949915032,7176,52,'Pass','2017','S');
insert into student_records values(6695,720476043,6684,20,'Fail','2017','W');
insert into student_records values(8271,720476043,8720,63,'Pass','2017','S');
insert into student_records values(8211,720476043,8720,29,'Fail','2017','F');
insert into student_records values(9539,284998264,7375,64,'Pass','2017','W');
insert into student_records values(4699,284998264,8720,75,'Pass','2017','W');
insert into student_records values(4635,284998264,6606,33,'Fail','2017','F');
insert into student_records values(9667,592700431,6647,54,'Pass','2017','W');
insert into student_records values(4794,592700431,2799,13,'Fail','2017','S');
insert into student_records values(9158,592700431,7176,35,'Fail','2017','W');
insert into student_records values(3135,207630767,8963,43,'Fail','2017','F');
insert into student_records values(9902,207630767,6647,97,'Pass','2017','W');
insert into student_records values(9928,207630767,7176,98,'Pass','2017','F');
insert into student_records values(1404,819680764,6606,16,'Fail','2017','S');
insert into student_records values(2907,819680764,7375,20,'Fail','2017','S');
insert into student_records values(6874,819680764,7176,57,'Pass','2017','W');
insert into student_records values(7030,108772666,7375,43,'Fail','2017','F');
insert into student_records values(2473,108772666,2087,40,'Fail','2017','W');
insert into student_records values(1251,108772666,8720,11,'Fail','2017','F');
insert into student_records values(8644,811054584,6684,73,'Pass','2017','S');
insert into student_records values(7875,811054584,6606,90,'Pass','2017','W');
insert into student_records values(5008,811054584,7375,36,'Fail','2017','S');
insert into student_records values(4000,159820213,6647,52,'Pass','2017','F');
insert into student_records values(8890,159820213,6684,48,'Fail','2017','S');
insert into student_records values(2984,159820213,6606,71,'Pass','2017','W');
insert into student_records values(6247,947732495,7568,78,'Pass','2017','W');
insert into student_records values(1308,947732495,6647,13,'Fail','2017','W');
insert into student_records values(3615,947732495,2799,20,'Fail','2017','F');
insert into student_records values(7220,876060224,7568,28,'Fail','2017','S');
insert into student_records values(2876,876060224,8963,96,'Pass','2017','S');
insert into student_records values(7990,876060224,7568,37,'Fail','2017','F');
insert into student_records values(9688,571884775,9916,22,'Fail','2017','F');
insert into student_records values(8195,571884775,7375,36,'Fail','2017','F');
insert into student_records values(8278,571884775,6606,98,'Pass','2017','W');
insert into student_records values(5490,228427847,8720,78,'Pass','2017','F');
insert into student_records values(6930,228427847,6684,88,'Pass','2017','S');
insert into student_records values(2741,228427847,6606,73,'Pass','2017','S');
insert into student_records values(6988,578831017,6606,33,'Fail','2017','F');
insert into student_records values(7375,578831017,6606,99,'Pass','2017','W');
insert into student_records values(1751,578831017,6684,35,'Fail','2017','W');
insert into student_records values(2125,762609761,6606,72,'Pass','2017','F');
insert into student_records values(8660,762609761,6647,83,'Pass','2017','S');
insert into student_records values(1628,762609761,2799,37,'Fail','2017','F');
insert into student_records values(5496,178018990,9916,36,'Fail','2017','W');
insert into student_records values(4742,178018990,9916,78,'Pass','2017','F');
insert into student_records values(4219,178018990,2087,45,'Fail','2017','W');
insert into student_records values(5385,504403937,7568,69,'Pass','2017','F');
insert into student_records values(3311,504403937,7218,89,'Pass','2017','S');
insert into student_records values(9086,504403937,7218,34,'Fail','2017','S');
insert into student_records values(6525,736347887,6647,47,'Fail','2017','F');
insert into student_records values(9924,736347887,7176,88,'Pass','2017','S');
insert into student_records values(1078,736347887,7375,96,'Pass','2017','W');
insert into student_records values(4068,864907504,7568,10,'Fail','2017','F');
insert into student_records values(6721,864907504,6606,10,'Fail','2017','F');
insert into student_records values(6011,864907504,8720,44,'Fail','2017','W');
insert into student_records values(5091,221417528,7375,43,'Fail','2017','F');
insert into student_records values(8494,221417528,7375,52,'Pass','2017','F');
insert into student_records values(8231,221417528,2799,34,'Fail','2017','W');
insert into student_records values(6808,833680654,2087,33,'Fail','2017','F');
insert into student_records values(2173,833680654,8720,42,'Fail','2017','W');
insert into student_records values(6741,833680654,6606,79,'Pass','2017','W');
insert into student_records values(3326,484379339,2799,86,'Pass','2017','W');
insert into student_records values(3637,484379339,2087,91,'Pass','2017','W');
insert into student_records values(2781,484379339,2799,16,'Fail','2017','S');
insert into student_records values(8837,970681580,7218,59,'Pass','2017','W');
insert into student_records values(6942,970681580,8720,61,'Pass','2017','F');
insert into student_records values(2704,970681580,7375,58,'Pass','2017','W');
insert into student_records values(7662,120430301,6684,67,'Pass','2017','W');
insert into student_records values(5361,120430301,9916,37,'Fail','2017','S');
insert into student_records values(9842,120430301,7218,99,'Pass','2017','F');
insert into student_records values(5328,517073466,7176,95,'Pass','2017','S');
insert into student_records values(7598,517073466,8720,35,'Fail','2017','S');
insert into student_records values(3198,517073466,8720,13,'Fail','2017','F');
insert into student_records values(7324,638059867,7375,50,'Pass','2017','S');
insert into student_records values(9947,638059867,6647,66,'Pass','2017','S');
insert into student_records values(9211,638059867,7568,26,'Fail','2017','F');


