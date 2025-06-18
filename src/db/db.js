const {Pool} = require("pg");

require("dotenv").config();

let pool;

function getDbInstance(){
    if(!pool)
    {
        pool = new Pool({
            user:process.env.USER,
            host:process.env.DB_HOST,
            database:process.env.DB_NAME,
            password:process.env.DB_PASS,
            port:process.env.DB_PORT,
        });

        pool.on('connect',()=>{
            console.log("Connected to postgre sql");
            
        })
    }

    return pool;
}

module.exports = getDbInstance();