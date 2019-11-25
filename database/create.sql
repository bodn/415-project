create table room(
	room_id number(3) not null,
	building varchar2(30),
	capacity number(3),
	primary key(room_id)
);

create table Student(
	student_id number(9) not null,
	first_name varchar2(20),
	last_name varchar2(20),
	email varchar2(30),
	major varchar2(30),
	gpa number(2, 1),
	department_id char(2) not null,
	primary key(student_id)
);

create table student_records(
	record_id number(4) not null,
	student_id number(9) not null,
	section_rec char(4) not null,
	grade number(2),
	status varchar2(30),
	year number(4),
	semester char(1),
	primary key(record_id)
);

create table course(
	course_id varchar2(8) not null,
	course_name varchar2(30), 
	description varchar2(100),
	department_id char(2) not null,
	primary key(course_id)
);

create table department(
	department_id char(2) not null,
	department_name varchar2(20),
	primary key(department_id)
);

create table professor(
	professor_id number(4) not null,
	first_name varchar2(20),
	last_name varchar2(20),
	email varchar2(30),
	department_id char(2) not null,
	primary key(professor_id)
);

create table section_records(
	section_id number(2) not null,
	section_rec char(4) not null,
	course_id varchar2(8) not null,
	professor_id number(4) not null,
	room_id number(3) not null,
	day_of_week varchar2(30),
	start_time varchar2(20),
	end_time varchar2(20),
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