

var api = require('nodeunit-httpclient').create({
    host: 'localhost',
    port: 8000,
    path: '/',   //Base URL for requests
    status: 200,    //Test each response is OK (can override later)
    headers: {      //Test that each response must have these headers (can override later)
        'content-type': 'application/html'
    }
});


exports.test1 = function(test) {
    api.get(test, '/', {
    headers: { 'content-type' : 'text/html; charset=utf-8' } })
};

