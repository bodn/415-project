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

insert into student values(484515001,'Jacki','Mcelyea','JMcelyea@uwindsor.ca','Engineering',56.33,'EN');
insert into student values(646013504,'Rowena','Julio','RJulio@uwindsor.ca','Computer Science',21.33,'CS');
insert into student values(678383380,'Faith','Kolesar','FKolesar@uwindsor.ca','Engineering',43.33,'EN');
insert into student values(910088970,'Vonnie','Rohrbaugh','VRohrbaugh@uwindsor.ca','Business',20.0,'BU');
insert into student values(486658759,'Gilberte','Ober','GOber@uwindsor.ca','Chemistry',44.67,'CH');
insert into student values(995950512,'Carline','Trew','CTrew@uwindsor.ca','Business',58.0,'BU');
insert into student values(263593901,'Alesia','Stead','AStead@uwindsor.ca','Chemistry',62.0,'CH');
insert into student values(867068470,'Easter','Harrison','EHarrison@uwindsor.ca','Business',52.0,'BU');
insert into student values(863724236,'Arianne','Weidman','AWeidman@uwindsor.ca','Computer Science',45.67,'CS');
insert into student values(337647666,'Kym','Fulk','KFulk@uwindsor.ca','Computer Science',54.33,'CS');
insert into student values(746608364,'Juanita','Munsey','JMunsey@uwindsor.ca','Business',45.33,'BU');
insert into student values(622033372,'Emeline','Pomeroy','EPomeroy@uwindsor.ca','Chemistry',68.0,'CH');
insert into student values(519702530,'Lizzie','Mcfate','LMcfate@uwindsor.ca','Computer Science',52.33,'CS');
insert into student values(609905768,'Verda','Carrales','VCarrales@uwindsor.ca','Business',63.67,'BU');
insert into student values(206887522,'Shiela','Heber','SHeber@uwindsor.ca','Chemistry',43.0,'CH');
insert into student values(549971984,'Elicia','Balas','EBalas@uwindsor.ca','Engineering',78.33,'EN');
insert into student values(863923279,'Tiffanie','Wiese','TWiese@uwindsor.ca','Engineering',63.0,'EN');
insert into student values(654954147,'Monica','Hammaker','MHammaker@uwindsor.ca','Business',54.67,'BU');
insert into student values(638181431,'Hung','Clampitt','HClampitt@uwindsor.ca','Engineering',49.33,'EN');
insert into student values(909333735,'Glennis','Royston','GRoyston@uwindsor.ca','Engineering',33.67,'EN');
insert into student values(259375600,'Hassan','Hamann','HHamann@uwindsor.ca','Engineering',50.33,'EN');
insert into student values(457553657,'Carman','Hillwig','CHillwig@uwindsor.ca','Engineering',57.67,'EN');
insert into student values(252450675,'Briana','Streater','BStreater@uwindsor.ca','Chemistry',53.33,'CH');
insert into student values(756395728,'Marcelene','Brophy','MBrophy@uwindsor.ca','Chemistry',55.0,'CH');
insert into student values(960202697,'Liane','Vaquera','LVaquera@uwindsor.ca','Engineering',76.33,'EN');
insert into student values(598310257,'Ching','Bigler','CBigler@uwindsor.ca','Chemistry',72.67,'CH');
insert into student values(290995346,'Lincoln','Engberg','LEngberg@uwindsor.ca','Business',95.33,'BU');
insert into student values(143210586,'Victor','Conners','VConners@uwindsor.ca','Computer Science',54.0,'CS');
insert into student values(635292127,'Vada','Myron','VMyron@uwindsor.ca','Computer Science',36.67,'CS');
insert into student values(256991806,'Risa','Hazen','RHazen@uwindsor.ca','Business',44.0,'BU');
insert into student values(562142854,'Blondell','Decarlo','BDecarlo@uwindsor.ca','Business',89.0,'BU');
insert into student values(599013130,'Debby','Efird','DEfird@uwindsor.ca','Chemistry',52.0,'CH');
insert into student values(726028664,'Josef','Deeb','JDeeb@uwindsor.ca','Chemistry',47.67,'CH');
insert into student values(653447505,'Shannan','Pasley','SPasley@uwindsor.ca','Business',27.67,'BU');
insert into student values(238224925,'Rickey','Koury','RKoury@uwindsor.ca','Business',22.0,'BU');
insert into student values(817533108,'Alvina','Kabel','AKabel@uwindsor.ca','Computer Science',52.0,'CS');
insert into student values(258644904,'Mellie','Barlowe','MBarlowe@uwindsor.ca','Business',60.67,'BU');
insert into student values(722596448,'Jerry','Calley','JCalley@uwindsor.ca','Business',46.0,'BU');
insert into student values(248774637,'Vicente','Kearns','VKearns@uwindsor.ca','Business',46.67,'BU');
insert into student values(202707327,'Vance','Bialek','VBialek@uwindsor.ca','Business',66.67,'BU');
insert into student values(667058438,'Rufina','Wiggs','RWiggs@uwindsor.ca','Business',56.0,'BU');
insert into student values(176908971,'Cristy','Lis','CLis@uwindsor.ca','Engineering',51.67,'EN');
insert into student values(876020383,'Sergio','Pocock','SPocock@uwindsor.ca','Business',52.0,'BU');
insert into student values(728781201,'Eulah','Zemlicka','EZemlicka@uwindsor.ca','Engineering',51.33,'EN');
insert into student values(424770027,'Millie','Davy','MDavy@uwindsor.ca','Computer Science',40.67,'CS');
insert into student values(264727764,'Herlinda','Kreger','HKreger@uwindsor.ca','Engineering',33.0,'EN');
insert into student values(383293931,'Roselyn','Mcquaid','RMcquaid@uwindsor.ca','Engineering',43.33,'EN');
insert into student values(981476118,'Gabriele','Villagran','GVillagran@uwindsor.ca','Engineering',33.0,'EN');
insert into student values(928324946,'Emogene','Morain','EMorain@uwindsor.ca','Computer Science',53.0,'CS');
insert into student values(683292247,'Mildred','Bulli','MBulli@uwindsor.ca','Business',74.67,'BU');

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

insert into section_records values(01,'7765','BUSS4540',9006,203,'Friday','8:30am','9:50am');
insert into section_records values(01,'1004','COMP2260',9005,101,'Thursday','7:00pm','9:50pm');
insert into section_records values(01,'6353','ENGI4540',9003,102,'Wednesday','8:30am','9:50am');
insert into section_records values(01,'5028','BUSS4540',9004,103,'Friday','8:30am','9:50am');
insert into section_records values(01,'2363','BUSS1000',9005,202,'Wednesday','8:30am','9:50am');
insert into section_records values(01,'3007','CHEM3801',9003,101,'Tuesday','11:30am','12:50pm');
insert into section_records values(01,'1625','COMP2260',9002,201,'Saturday','10:00am','11:20am');
insert into section_records values(01,'9862','ENGI3540',9005,101,'Thursday','2:30pm','3:50pm');
insert into section_records values(01,'7647','ENGI3540',9004,102,'Saturday','7:00pm','9:50pm');
insert into section_records values(01,'3347','BUSS4540',9005,103,'Tuesday','7:00pm','9:50pm');
insert into section_records values(01,'3589','COMP2260',9001,203,'Monday','8:30am','9:50am');
insert into section_records values(01,'9661','CHEM3801',9006,101,'Monday','1:00pm','2:20pm');

insert into student_records values(1782,484515001,3347,36,'Fail','2017','S');
insert into student_records values(5255,484515001,3007,58,'Pass','2017','F');
insert into student_records values(6649,484515001,3589,75,'Pass','2017','S');
insert into student_records values(9103,646013504,9661,24,'Fail','2017','S');
insert into student_records values(4005,646013504,6353,13,'Fail','2017','W');
insert into student_records values(2332,646013504,3007,27,'Fail','2017','W');
insert into student_records values(5049,678383380,1004,12,'Fail','2017','S');
insert into student_records values(2983,678383380,1625,90,'Pass','2017','W');
insert into student_records values(2050,678383380,3347,28,'Fail','2017','W');
insert into student_records values(2834,910088970,6353,18,'Fail','2017','F');
insert into student_records values(8859,910088970,3007,27,'Fail','2017','F');
insert into student_records values(4095,910088970,1625,15,'Fail','2017','F');
insert into student_records values(9652,486658759,7765,79,'Pass','2017','F');
insert into student_records values(4854,486658759,9862,29,'Fail','2017','W');
insert into student_records values(4125,486658759,2363,26,'Fail','2017','S');
insert into student_records values(5792,995950512,1004,87,'Pass','2017','W');
insert into student_records values(1490,995950512,3007,52,'Pass','2017','S');
insert into student_records values(1875,995950512,3347,35,'Fail','2017','W');
insert into student_records values(4001,263593901,3347,40,'Fail','2017','S');
insert into student_records values(7629,263593901,3589,80,'Pass','2017','S');
insert into student_records values(5420,263593901,3347,66,'Pass','2017','S');
insert into student_records values(3573,867068470,9862,58,'Pass','2017','W');
insert into student_records values(6497,867068470,1004,20,'Fail','2017','F');
insert into student_records values(8214,867068470,3589,78,'Pass','2017','F');
insert into student_records values(8758,863724236,1004,31,'Fail','2017','W');
insert into student_records values(4365,863724236,1625,60,'Pass','2017','S');
insert into student_records values(3242,863724236,9661,46,'Fail','2017','S');
insert into student_records values(6201,337647666,9862,66,'Pass','2017','F');
insert into student_records values(6366,337647666,3007,30,'Fail','2017','S');
insert into student_records values(9736,337647666,9862,67,'Pass','2017','F');
insert into student_records values(3444,746608364,1625,12,'Fail','2017','S');
insert into student_records values(2074,746608364,7765,96,'Pass','2017','W');
insert into student_records values(3270,746608364,3007,28,'Fail','2017','W');
insert into student_records values(4164,622033372,9862,79,'Pass','2017','W');
insert into student_records values(4704,622033372,1004,57,'Pass','2017','F');
insert into student_records values(7892,622033372,1625,68,'Pass','2017','W');
insert into student_records values(3658,519702530,5028,95,'Pass','2017','F');
insert into student_records values(5714,519702530,1004,30,'Fail','2017','S');
insert into student_records values(5157,519702530,1625,32,'Fail','2017','S');
insert into student_records values(2804,609905768,5028,67,'Pass','2017','S');
insert into student_records values(1303,609905768,7765,96,'Pass','2017','W');
insert into student_records values(8862,609905768,3347,28,'Fail','2017','W');
insert into student_records values(7061,206887522,3007,62,'Pass','2017','S');
insert into student_records values(4434,206887522,1004,14,'Fail','2017','S');
insert into student_records values(3398,206887522,6353,53,'Pass','2017','F');
insert into student_records values(7353,549971984,5028,74,'Pass','2017','S');
insert into student_records values(9952,549971984,3007,99,'Pass','2017','F');
insert into student_records values(7122,549971984,7647,62,'Pass','2017','F');
insert into student_records values(3348,863923279,6353,29,'Fail','2017','F');
insert into student_records values(3583,863923279,2363,81,'Pass','2017','S');
insert into student_records values(1667,863923279,3007,79,'Pass','2017','S');
insert into student_records values(6789,654954147,3007,39,'Fail','2017','W');
insert into student_records values(1162,654954147,7647,95,'Pass','2017','F');
insert into student_records values(3375,654954147,1625,30,'Fail','2017','F');
insert into student_records values(7601,638181431,3347,52,'Pass','2017','W');
insert into student_records values(8458,638181431,7647,83,'Pass','2017','W');
insert into student_records values(7997,638181431,1004,13,'Fail','2017','S');
insert into student_records values(8742,909333735,6353,60,'Pass','2017','F');
insert into student_records values(1030,909333735,6353,10,'Fail','2017','S');
insert into student_records values(8954,909333735,5028,31,'Fail','2017','F');
insert into student_records values(5362,259375600,1004,31,'Fail','2017','S');
insert into student_records values(7360,259375600,7765,55,'Pass','2017','S');
insert into student_records values(9795,259375600,1004,65,'Pass','2017','S');
insert into student_records values(7666,457553657,6353,35,'Fail','2017','F');
insert into student_records values(5947,457553657,9862,76,'Pass','2017','W');
insert into student_records values(6341,457553657,1625,62,'Pass','2017','W');
insert into student_records values(7392,252450675,9862,58,'Pass','2017','S');
insert into student_records values(1197,252450675,9661,90,'Pass','2017','W');
insert into student_records values(3948,252450675,1004,12,'Fail','2017','F');
insert into student_records values(9374,756395728,2363,67,'Pass','2017','F');
insert into student_records values(1309,756395728,7765,32,'Fail','2017','W');
insert into student_records values(3009,756395728,1625,66,'Pass','2017','W');
insert into student_records values(5815,960202697,7647,91,'Pass','2017','S');
insert into student_records values(1575,960202697,5028,98,'Pass','2017','W');
insert into student_records values(2761,960202697,3589,40,'Fail','2017','W');
insert into student_records values(2651,598310257,3347,86,'Pass','2017','S');
insert into student_records values(4389,598310257,7765,70,'Pass','2017','F');
insert into student_records values(6430,598310257,2363,62,'Pass','2017','S');
insert into student_records values(4509,290995346,2363,94,'Pass','2017','F');
insert into student_records values(6919,290995346,3007,97,'Pass','2017','F');
insert into student_records values(5716,290995346,3589,95,'Pass','2017','S');
insert into student_records values(7788,143210586,6353,88,'Pass','2017','F');
insert into student_records values(4332,143210586,9661,64,'Pass','2017','S');
insert into student_records values(5596,143210586,7647,10,'Fail','2017','F');
insert into student_records values(3437,635292127,2363,69,'Pass','2017','W');
insert into student_records values(3007,635292127,5028,29,'Fail','2017','F');
insert into student_records values(7084,635292127,1004,12,'Fail','2017','W');
insert into student_records values(7829,256991806,9862,45,'Fail','2017','F');
insert into student_records values(6154,256991806,3589,56,'Pass','2017','F');
insert into student_records values(5930,256991806,3589,31,'Fail','2017','W');
insert into student_records values(9100,562142854,1004,75,'Pass','2017','W');
insert into student_records values(2220,562142854,9661,96,'Pass','2017','S');
insert into student_records values(6814,562142854,7647,96,'Pass','2017','S');
insert into student_records values(2354,599013130,2363,32,'Fail','2017','W');
insert into student_records values(5849,599013130,5028,84,'Pass','2017','F');
insert into student_records values(1996,599013130,3007,40,'Fail','2017','S');
insert into student_records values(6210,726028664,1004,75,'Pass','2017','F');
insert into student_records values(6951,726028664,9661,21,'Fail','2017','S');
insert into student_records values(4626,726028664,5028,47,'Fail','2017','S');
insert into student_records values(8099,653447505,3007,12,'Fail','2017','W');
insert into student_records values(5853,653447505,3007,61,'Pass','2017','W');
insert into student_records values(8573,653447505,7765,10,'Fail','2017','S');
insert into student_records values(5240,238224925,1625,24,'Fail','2017','S');
insert into student_records values(8844,238224925,1004,20,'Fail','2017','W');
insert into student_records values(2708,238224925,9862,22,'Fail','2017','W');
insert into student_records values(2853,817533108,6353,17,'Fail','2017','F');
insert into student_records values(5597,817533108,1004,66,'Pass','2017','W');
insert into student_records values(7292,817533108,5028,73,'Pass','2017','F');
insert into student_records values(3152,258644904,3007,69,'Pass','2017','S');
insert into student_records values(6170,258644904,9862,69,'Pass','2017','F');
insert into student_records values(1545,258644904,9862,44,'Fail','2017','S');
insert into student_records values(7724,722596448,7647,59,'Pass','2017','W');
insert into student_records values(8545,722596448,6353,63,'Pass','2017','W');
insert into student_records values(5198,722596448,9862,16,'Fail','2017','F');
insert into student_records values(7651,248774637,9862,36,'Fail','2017','W');
insert into student_records values(9268,248774637,3589,14,'Fail','2017','W');
insert into student_records values(4086,248774637,3589,90,'Pass','2017','S');
insert into student_records values(4462,202707327,3007,93,'Pass','2017','W');
insert into student_records values(1377,202707327,6353,67,'Pass','2017','W');
insert into student_records values(2784,202707327,3347,40,'Fail','2017','S');
insert into student_records values(1859,667058438,5028,74,'Pass','2017','S');
insert into student_records values(9808,667058438,7647,24,'Fail','2017','S');
insert into student_records values(4835,667058438,3007,70,'Pass','2017','S');
insert into student_records values(9609,176908971,1004,10,'Fail','2017','W');
insert into student_records values(9816,176908971,3347,95,'Pass','2017','S');
insert into student_records values(2452,176908971,3347,50,'Pass','2017','W');
insert into student_records values(7415,876020383,7765,60,'Pass','2017','S');
insert into student_records values(2337,876020383,9862,59,'Pass','2017','S');
insert into student_records values(4891,876020383,7765,37,'Fail','2017','W');
insert into student_records values(8074,728781201,2363,63,'Pass','2017','F');
insert into student_records values(7979,728781201,7647,52,'Pass','2017','F');
insert into student_records values(1884,728781201,7647,39,'Fail','2017','W');
insert into student_records values(9803,424770027,1625,64,'Pass','2017','F');
insert into student_records values(4686,424770027,7765,39,'Fail','2017','W');
insert into student_records values(6920,424770027,9661,19,'Fail','2017','W');
insert into student_records values(1439,264727764,9862,34,'Fail','2017','S');
insert into student_records values(4881,264727764,3007,43,'Fail','2017','F');
insert into student_records values(3363,264727764,7765,22,'Fail','2017','W');
insert into student_records values(6308,383293931,9862,21,'Fail','2017','F');
insert into student_records values(7521,383293931,3589,73,'Pass','2017','W');
insert into student_records values(8680,383293931,2363,36,'Fail','2017','F');
insert into student_records values(9589,981476118,3007,18,'Fail','2017','F');
insert into student_records values(8575,981476118,3007,68,'Pass','2017','S');
insert into student_records values(8257,981476118,9862,13,'Fail','2017','W');
insert into student_records values(1508,928324946,6353,17,'Fail','2017','S');
insert into student_records values(4315,928324946,7647,58,'Pass','2017','W');
insert into student_records values(3627,928324946,7765,84,'Pass','2017','W');
insert into student_records values(3665,683292247,5028,99,'Pass','2017','W');
insert into student_records values(1768,683292247,1625,82,'Pass','2017','S');
insert into student_records values(1125,683292247,3589,43,'Fail','2017','F');

