exports.init = (app) -> 
  pre = 'api/v0'
  app.get pre + '/user/:userId/about.json', (req, res, next) -> 
    res.json 'ma grand mère tire les cartes', 501

  
  app.get pre + '/@me.json', (req,res, next) ->
    res.json 'TODO, devrait revoyer une redirection vers les informations de l'utilisateur courant', 501
    
  app.get pre + '/@me/, (req,res, next) ->


 