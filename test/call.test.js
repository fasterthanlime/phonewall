

var api = require('nodeunit-httpclient').create({
    host: 'localhost',
    port: 8000,
    path: '/twilio/api/',   //Base URL for requests
    status: 200,    //Test each response is OK (can override later)
    headers: {      //Test that each response must have these headers (can override later)
        'content-type': 'application/xml'
    }
});


exports.index = function(test) {
    api.get(test, 'index.xml', { })
};

