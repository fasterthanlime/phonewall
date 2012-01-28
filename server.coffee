
express = require('express')
app = express.createServer()

app.configure ->
  app.use express.methodOverride()
  app.use express.bodyParser()
  app.use app.router
  app.register '.html', {
    compile: (str, options) ->
      (locals) -> str
  }

app.configure 'development', ->
  app.use express.static(__dirname + '/frontend')
  app.use express.errorHandler { dumpExceptions: true, showStack: true }

app.get '/', (req, res) ->
  res.render __dirname + '/frontend/pipotron.html', { layout: false }

app.get '/twilio/api/index.xml', (req, res) ->
  res.contentType('application/xml')  
  res.send """
<?xml version="1.0" encoding="UTF-8" ?>
<Say>Hello Flying Spaghetti Monster !</Say>

"""
app.listen 8000
