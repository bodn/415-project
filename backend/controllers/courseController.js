var db = require("../bin/db");
// GET ALL COURSES
exports.getAllCourses = async callback => {
  const connection = db.get();
  connection.query("SELECT * FROM COURSE", (err, rows, fields) => {
    if (err) callback(null);
    else callback(rows);
  });
};

