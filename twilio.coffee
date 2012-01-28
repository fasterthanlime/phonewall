
exports.init = (app) -> 
    app.get '/twilio/api/index.xml', (req, res) ->
      res.contentType('application/xml')  
      res.send """
      <?xml version="1.0" encoding="UTF-8" ?>
      <Say>Hello Flying Spaghetti Monster !</Say>
      """


