exports.init = (app) -> 
  app.get '/twilio/api/index.xml', (req, res) ->
 
    inCall =
      callSid: req.get('CallSid')
      from:    req.get('From')
      dest:    req.get('To')
      
    res.contentType('application/xml')    
    finduser =  (to, callback)  -> 
    
    callback = (err, user) -> 
      if err
        res.send """
          <?xml version="1.0" encoding="UTF-8"?>
          <Response>
           <Say voice="woman" language="en-gb" loop="2">Hello Flying Spaghetti Monster !</Say>
           <Reject />
          </Response>
        """
      else 
        processUser(inCall, user, res)
    
    finduser(inCall.dest,callback)
    
    
    
    
processUser = (call, user, res) -> 
    
    
       
     
    
   
    