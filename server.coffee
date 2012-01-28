
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
  res.render __dirname + '/frontend/index.html', { layout: false }

app.listen 8000
