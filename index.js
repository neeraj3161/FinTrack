
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


//for ejs


app.set('view engine', 'ejs');         // Use .ejs files in /views folder
app.set('views', (path.join(__dirname, 'views')));           // Default is ./views

app.get('/', async(req, res) => {
  const { mode, categories } = await GetModeAndCategories();
    console.log('Mode:', mode);
    console.log('Categories:', categories);
    res.render('./pages/index',{mode,categories})
   
});

app.post('/submit', async(req,res)=>{
    const {amount, summary, mode, categoryOptions, newCat} = req.body;
    console.log(amount,summary,mode,categoryOptions,newCat);

    if(categoryOptions === -1 && await isNewCategory(newCat))
    {
        const insertNewCatQuery = `INSERT INTO ext.categories(name) VALUES (${newCat})`;
        const result = await db.query(insertNewCatQuery);
        console.log(result.rows[0].id);

        InsertRecord(amount, summary, result.rows[0].id, mode);

    }else{
         InsertRecord(amount, summary, categoryOptions, mode);
    }
    
})

async function InsertRecord(amount,summary,categoryId, modeId)
{
    // TODO::Add try catch
    const insertRecordQuery = `INSERT INTO ext.expenses(amount, summary, mode, category_id) VALUES (${amount}, '${summary}' ,  ${modeId}, ${categoryId})`
    const result = db.query(insertRecordQuery);
    console.log(result.rows);

}

app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});


async function addNewCategory(){
    //check if the category already exists 

}

async function isNewCategory(categoryName){
    const query  = `SELECT name FROM ext.categories WHERE name = '${categoryName}'`;
    const result  = await db.query(query);
    return result.rows.length > 0;
}

async function GetModeAndCategories()
{
    const modeQuery = 'SELECT id,name FROM ext.mode;'
    const categoriesQuery = 'SELECT id,name FROM ext.categories;'

    try {
        const modeRes = await db.query(modeQuery);
        const categoriesRes = await db.query(categoriesQuery);
        return {mode:modeRes.rows, categories: categoriesRes.rows}


    } catch (error) {
        
    }

}