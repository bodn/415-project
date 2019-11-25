const oracleDB = require('oracledb');
module.exports = {
    user: "SYS",
    password: "admin",
    connectString: "localhost:1521/orcl",
    privilege: oracleDB.SYSDBA,
};