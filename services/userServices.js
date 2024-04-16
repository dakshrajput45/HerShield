const userModel = require('../model/userModel')

class userServices{
    static async registerUser(email,Password,aadhaar_no,userName){
        try{
            const createUser = new userModel({email,Password,aadhaar_no,userName});
            return await createUser.save();
        }catch(err){
            throw err;
        }
    }
}

module.exports = userServices