var db = require("../bin/db");

exports.getAllProfessors = async callback => {
  const connection = db.get();
  connection.query("SELECT * FROM PROFESSOR", (err, rows, fields) => {
    if (err) callback(null);
    else callback(rows);
  });
};
// GET The courses taught by the professor
exports.getCourses = async (id, callback) => {
  const connection = db.get();
  connection.query(
    //  c.course_id, c.course_name, s.section_rec
    `select  c.course_id, c.course_name, s.section_rec from course c, professor p, section_records s where
    c.course_id = s.course_id and p.professor_id = s.professor_id and
    p.professor_id = ?`,
    [id],
    (err, rows, fields) => {
      if (err) callback(err);
      else callback(rows);
    }
  );
};
