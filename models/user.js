const mongoose = require('mongoose');
require('mongoose-type-url');

const userSchema = mongoose.Schema({
    name : {
        type : String,
        required :true
    },
    email : {
        type : String,
        required : false 
    },
    password : {
        type : String,
        required : true
    },
    phone : {
        type : String,
        required : true
    },
    image : {
        type : mongoose.SchemaTypes.Url,
        required : false
    }
});

module.exports = mongoose.model('User' , userSchema);