const userService = require("../services/userServices");

exports.register = async(req,res,next) => {
    try {
        const {email,Password,aadhaar_no,userName} = req.body;
        const successRes = await userService.registerUser(email,Password,aadhaar_no,userName);
        res.json({status:true,success:"user register succesfully"});
    }
    catch(error){
        throw error;
    }
}