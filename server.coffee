
express = require('express')
app = express.createServer()

app.configure ->
  app.use express.methodOverride()
  app.use express.bodyParser()
  app.use app.router

app.configure 'development', ->
  app.use express.static(__dirname + '/frontend')
  app.use express.errorHandler { dumpExceptions: true, showStack: true }
  
app.get '/', (req, res) ->
  res.send 'Hello World'

app.listen 8000
