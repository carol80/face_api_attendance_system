const mongoose = require('mongoose');
require('mongoose-type-url');

const landSchema = mongoose.Schema({
    name : {
        type : String,
        required : false
    },
    roll : {
        type : String,
        required : true
    },
    phone : {
        type : String,
        required : true
    },
    landmarks : {
        type : Array,
        required : true
    }
});

module.exports = mongoose.model('landmarks' , landSchema);