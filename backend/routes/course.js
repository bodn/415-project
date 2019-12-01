var express = require("express");
var router = express.Router();
const course = require("../controllers/courseController");
// Get ALL Courses
router.get("/", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    course.getAllCourses(res => {
      if (res) {
        resolve(res);
      } else {
        reject("ERROR ON QUERY");
      }
    });
  });

  promise.then(val => {
      res.status(200).json({
        info: "Success!",
        total: val.length,
        data: val
      });
  })
});

module.exports = router;