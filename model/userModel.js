const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const database = require('../config/database');

const { Schema } = mongoose;

const userSchema = new Schema ({
    email : {
        type: String,
        lowercase:true,
        required:true,
        unique:true
    },
    Password : {
        type: String,
        required:true
    },
    aadhaar_no : {
        type: String,
        unique : true
    },
    userName : {
        type: String,
        unique : true
    }
});

userSchema.pre('save',async function(){
    try{
        var user = this;
        const salt = await(bcrypt.genSalt(10))
        const hashpass = await bcrypt.hash(user.Password,salt);

        user.Password = hashpass;
    }
    catch(error){
        throw error;
    }
})
const userModel = database.model('user',userSchema);
module.exports = userModel;