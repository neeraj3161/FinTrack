const {Pool} = require("pg");

let pool;

function getDbInstance(){
    if(!pool)
    {
        pool = new Pool({
            user:"",
            host:"",
            database:"",
            password:"",
            port:"",
        });

        pool.on('connect',()=>{
            console.log("Connected to postgre sql");
            
        })
    }

    return pool;
}

module.exports = getDbInstance();