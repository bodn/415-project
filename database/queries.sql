-- 1

select the courses that a certain student is taking
	select c.name from course c
	join sectrion_records ser on ser.course_id = C.course_id
	join student_records sr on sr.section_rec = ser.section_rec
	join student s on s.student_id = sr.student_id where s.student_id = 100000001;

-- 2

select c.course_name from course c, professor p, sectrion_records s where
c.course_id = s.course_id and p.professor_id = s.professor_id and
p.first_name = 'BOBBY';

-- 3

select c.course_name from course c
join sectrion_records se on se.course_id = c.course_id
join student_records sr on sr.section_rec = se.section_rec
join student s on s.student_id = sr.student_id
where student_id = 100000002;

-- 4 

select s.student_id, s.first_name, s.last_name from student s
join student_records sr on sr.student_id = s.student_id
join sectrion_records se on se.section_rec = sr.section_rec
join course c on s.course_id = se.course_id
where c.course_id = 'COMP1050';

-- 5

select r.building, r.room_code from room r
join sectrion_records sr on sr.room_id = r.room_id
join course c on c.course_id = sr.course_id
where c.course_id = 'COMP2080';

-- 6 

select s.student_id, s.first_name, s.last_name from student s
join student_records sr on sr.student_id = s.student_id
join sectrion_records se on se.section_rec = sr.section_rec
join professor p on se.professor_id = p.professor_id
where p.professor_id = 9001;

-- 7 

select s.first_name, s.last_name, d.department_name from Student s
join department d on d.department_id = s.department_id;

-- 8 

declare
	
	cursor c1 is
	select s.student_id from student s
	join student_records sr on sr.student_id = s.student_id
	where sr.section_rec = '1234' for update;

begin
	
	for s1 in c1 loop
		update student_records
		set grade := grade * 1.05
		where current of c1;
	end loop;
end;

-- 9

declare
	
	CREATE OR REPLACE TRIGGER delete_student_warning
	BEFORE DELETE ON student_records

	DECLARE
	
	BEGIN
		-- execute query if they say yes
	END;

	cursor c1 is
		select sr.record_id from student_records sr
		join sectrion_records se on se.section_rec = sr.section_rec
		join course c on c.course_id = se.course_id
		where sr.student_id = 100000001 
		and c.course_id = 'COMP1050' for update;


begin
	
	for c in c1 loop
		delete from student_records where current of c;
	end loop;

end;

-- 10
	
declare

	CREATE PROCEDURE update_major(id number(9), major_name varchar2(30)) AS
		BEGIN
			update student
			set major = major_name
			where student_id = id;	
		END;
begin
	update_major(100000001, 'Business');
end;

-- 11 

declare
	
	cursor c1 is 
	select sr.student_id, sr.section_rec, se.section_id
	from student_records sr
	join section_records se on se.section_rec = sr.section_rec for update;

begin
	
	for c in c1 loop
		update section_records
		set section_id = $new_id
		where current of c;
	end loop;

end;

-- 12 

declare

begin

	update section_records 
	set professor_id = 
	where course_id = 
	and section_id =  

end;

-- 13

declare

	cursor c1 is
	select sr.record_id, sr.grade from student_records sr
	join section_records se on se.section_rec = sr.section_rec
	where se.course_id = 'COMP2260' and se.section_id = 1 for update;

	grade_total number;
	average number;

begin
	
	for c in c1 loop
		grade_total := grade_total + c.grade;
	end loop;

	open c1;

	average := grade_total / c1%ROWCOUNT; 

	-- do something with average

	close c1;
end;

-- 14

select c.course_id, c.course_name from course c
join department d on d.department_id = c.department_id
where d.department_id = ;

-- 15

select s.student_id, s.first_name, s.last_name from student s where s.gpa >= 80.0;
