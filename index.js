const app = require('./app');
const database = require('./config/database');
const userModel = require('./model/userModel');  
const port = 3000;

app.get('/',(req,res)=>{
    res.send("jaishreeram!!");
});
app.listen(port,()=>{
    console.log(`server Listening running on port http://localhost:${port}`);
});