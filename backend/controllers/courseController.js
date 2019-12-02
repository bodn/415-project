var db = require("../bin/db");
// GET ALL COURSES
exports.getAllCourses = async callback => {
  const connection = db.get();
  connection.query("SELECT * FROM COURSE", (err, rows, fields) => {
    if (err) callback(null);
    else callback(rows);
  });
};
// Obtain course details
exports.getCourseById = async (cid, callback) => {
  const connection = db.get();
  connection.query("SELECT * FROM course WHERE course_id = ?", [cid], (err, rows, fields) => {
    if (err) callback(null);
    else callback(rows);
  });
}

exports.getAllSectionsByCourseId = async (cid, callback) => {
  const connection = db.get();
  connection.query(`
    select se.section_rec, c.course_id, c.course_name, se.section_id, p.first_name, se.year, count(sr.record_id) 'num_students' from course c
    join section_records se on se.course_id = c.course_id
    join student_records sr on sr.section_rec = se.section_rec
    join professor p on p.professor_id = se.professor_id
    WHERE c.course_id = ?
    group by se.section_rec, c.course_id, c.course_name, se.section_id, p.first_name,se.year;
    `, [cid], (err, rows, fields) => {
    if (err) callback(null);
    else callback(rows);
  });
};

