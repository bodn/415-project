var express = require("express");
const db = require("../bin/database");
const oracledb = require("oracledb");
var router = express.Router();

/* GET home page. */
router.get("/", function(req, res, next) {
  const pool = oracledb.getPool();
  const conn = pool.getConnection();
  console.log(getPoolConnection(pool))
  
  res.render("index", { title: "Express" });
});

async function getPoolConnection(pool) {
  try {
    console.log('Getting pool connection')
    const connection = await pool.getConnection({
      
    });
    const result = await connection.execute('SELECT * FROM employees');
    console.log(result.rows); // 'default'
  } catch (err) {
    console.log(err);
  }
}
module.exports = router;
