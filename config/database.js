const mongoose=require('mongoose');

const connection = mongoose.createConnection('mongodb://localhost:27017/HerShield').on('open',()=>{
    console.log("connected ho gya");
}).on('error',()=>{
    console.log("Connection errror");
});

module.exports = connection;