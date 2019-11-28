import os
import sys
from random import randint
import random

names = ['Jacki Mcelyea',
'Rowena Julio',
'Faith Kolesar',
'Vonnie Rohrbaugh',
'Gilberte Ober',
'Carline Trew',
'Alesia Stead',
'Easter Harrison',
'Arianne Weidman',
'Kym Fulk',
'Juanita Munsey',
'Emeline Pomeroy',
'Lizzie Mcfate',
'Verda Carrales',
'Shiela Heber',
'Elicia Balas',
'Tiffanie Wiese',
'Monica Hammaker',
'Hung Clampitt',
'Glennis Royston',
'Hassan Hamann',
'Carman Hillwig',
'Briana Streater',
'Marcelene Brophy',
'Liane Vaquera',
'Ching Bigler',
'Lincoln Engberg',
'Victor Conners',
'Vada Myron',
'Risa Hazen',
'Blondell Decarlo',
'Debby Efird',
'Josef Deeb',
'Shannan Pasley',
'Rickey Koury',
'Alvina Kabel',
'Mellie Barlowe',
'Jerry Calley',
'Vicente Kearns',
'Vance Bialek',
'Rufina Wiggs',
'Cristy Lis',
'Sergio Pocock',
'Eulah Zemlicka',
'Millie Davy',
'Herlinda Kreger',
'Roselyn Mcquaid',
'Gabriele Villagran',
'Emogene Morain',
'Mildred Bulli']

semesters = ['S', 'W', 'F']
student_numbers = []
dep_names = ['Computer Science', 'Chemistry', 'Business', 'Engineering']
dep_id = ['CS', 'CH', 'BU', 'EN']
prof_id = [9001, 9002, 9003, 9004, 9005, 9006]
prof_names = ['Bobby Jean', 'Claire Baker', 'Harold Beaumont', 'Katie Smith', 'Brandon Brown', 'William Davis']
section_numbers = [1234, 1235, 1236, 1237, 1238, 1239, 1240, 1241, 1242, 1243, 1244, 1245]
room_ids = [101, 102, 103, 201, 202, 203] 
week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
times = ['8:30am-9:50am', '10:00am-11:20am', '11:30am-12:50pm', '1:00pm-2:20pm', '2:30pm-3:50pm', '4:00pm-5:20pm']

def rand_num(n):
	range_start = 10**(n-1)
	range_end = (10**n)-1
	return randint(range_start,range_end)

def rand_num_range(start, end):
	return random.randint(start, end)

def gen_gpa():
	return round(random.uniform(50.0 , 99.0), 2)

def gen_students():
	file_name = sys.argv[1]
	f = open(file_name, 'w')

	output = ''

	for i in range(0, len(names)):
		output = 'insert into student values('
		num = str(rand_num(9))
		student_numbers.append(num)
		output += num + ','
		name = names[i].split()
		output += '\'' + name[0] + '\','
		output += '\'' + name[1] + '\','
		output += '\'' + name[0][0] + name[1] + '@uwindsor.ca\','
		index = rand_num_range(0, len(dep_names) - 1)
		output += '\'' + dep_names[index] + '\','
		output += str(gen_gpa()) + ','
		output += '\'' + dep_id[index] + '\')\n'
		f.write(output)
	
	f.close()
	return

def gen_section_records():
	file_name = sys.argv[3]
	f = open(file_name, 'w')

	output = ''
	for i in range(0, len(section_numbers)):
		output = 'insert into section_records values(01,'
		sec = section_numbers[rand_num_range(0, len(section_numbers) - 1)]
		output += '\'' + str(sec) + '\','
		output += '\'' + 'COURSE_NAME' +'\','
		output += str(prof_id[rand_num_range(0, len(prof_id) - 1)]) + ','
		output += str(room_ids[rand_num_range(0, len(room_ids) - 1)]) + ','
		output += '\'' + week[rand_num_range(0, len(week) - 1)] + '\','
		
		time_slot = times[rand_num_range(0, len(times) - 1)].split('-')
		output += '\'' + time_slot[0] + '\',' + '\'' + time_slot[1] + '\')\n'
		f.write(output)

	f.close()

def gen_student_records():
	
	file_name = sys.argv[2]
	f = open(file_name, 'w')

	output = ''

	for student in range(0, len(names)):
		for i in range(0, 3):
			output = 'insert into student_records values('
			output += str(rand_num(4)) + ','
			output += str(student_numbers[student]) + ','
			grade = rand_num(2)
			section_rec = section_numbers[rand_num_range(0, len(section_numbers) - 1)]
			output += str(section_rec) + ','
			output += str(grade) + ','
			output += '\'Pass\',' if grade >= 50 else '\'Fail\','
			output += '\'2017\','
			output += '\'' + semesters[rand_num_range(0, len(semesters) - 1)] + '\')\n'
			f.write(output)

	f.close()
	return

def check_args():
	if len(sys.argv) != 4:
		print('ERROR: Please run as...')
		print('\tpython3 gen_students.py <student insert file> <student records insert file> <section records insert file>')
	else:
		gen_students()
		gen_student_records()
		gen_section_records()

def main():
	check_args()

if __name__ == '__main__':
	main()