exports.init = (app) -> 
  app.get '/api/v0/user/:userId/about.json', (req, res, next) -> 
    res.json 'ma grand mère tire les cartes', 501

  
  app.get '/api/v0/@me.json', (req,res, next) ->
    res.json 'TODO, devrait revoyer une redirection vers les informations de l'utilisateur courant', 501


 