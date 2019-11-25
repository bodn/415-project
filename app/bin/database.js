const oracleDB = require("oracledb");
const dbConfig = require("./dbconfig");

var connection = null;

async function initConnection() {
  console.log("Starting Oracle DB connection...");
  try {
    connection = await oracleDB.getConnection({
      user: "SYS",
      password: "admin",
      connectString: "localhost:1521/orcl",
      privilege: oracleDB.SYSDBA
    });

    console.log("Connected to Oracle DB!");
  } catch (err) {
    console.error(err);
  }
}
function getConnection() {
  return connection;
}

async function getDeptartments() {
  let conn;

  try {
    conn = await oracleDB.getConnection('test',dbConfig);
    result = await conn.execute("select * from department");
    return result;

  } catch (err) {
    console.log("Ouch!", err);
  } finally {
    if (conn) {
      await conn.close();
    }
  }
}

module.exports = {
  initConnection,
  getConnection,
  getDeptartments
};
