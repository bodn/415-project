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
  connection.query("SELECT * FROM SECTION_RECORDS WHERE course_id = ?", [cid], (err, rows, fields) => {
    if (err) callback(null);
    else callback(rows);
  });
};

