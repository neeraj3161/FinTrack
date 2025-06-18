
const express = require("express");
const path = require("path");
const getDbInstance = require("./src/db/db");

require("dotenv").config();

const app = express();
const port = 3000;
const db = getDbInstance;


//to parse form data
app.use(express.urlencoded({extended:true}));

//if sending a json response
app.use(express.json());

const result = db.query('SELECT NOW()');
console.log(result);



console.log(process.env.DB_NAME);

app.use(express.static(path.join(__dirname, 'public')));

app.get('/', async(req, res) => {
//     try {
//     const result = await db.query('SELECT NOW()');
//     res.send(result.rows);
//   } catch (err) {
//     console.error('DB error:', err);
//     res.status(500).send('Internal Server Error');
//   }
    res.sendFile(path.join(__dirname, 'public/html/index.html'));
});

app.post('/submit', (req,res)=>{
    const {amount, summary, mode, categoryOptions, newCat} = req.body;
    console.log(amount,summary,mode,categoryOptions,newCat);
    
})

app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});
