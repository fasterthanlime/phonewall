exports.init = (app) -> 
  app.get '/twilio/api/index.xml', (req, res) ->
 
    call =
      callSid: req.params.CallSid
      from:    req.params.From
      dest:    req.query["To"]
      
    res.contentType('application/xml')    
    
    
    callback = (err, user) -> 
      if err
        rejectCaller({res: res})
      else 
        console.log('processing rules ... or not')
        processUser(user, {res: res, call: call, user: user})
    
    finduser(call.dest,{res: res,call: call},callback)
    



finduser =  (to, context, callback)  ->
  console.log(to)
  console.log('calling my mother')
  if to == '+33632249198' 
    callback(true, {})
  else
    if to == '+33617695517'  
      callback(null, {num: '+33632249198})
    

findRulesForUserAndCaller = (user, caller, context, callback) ->
      
    
processUser = (user, context) -> 
  redirectCallerToUser(context)


rejectCaller = (context) -> 
  res = context.res
  res.contentType('application/xml') 
  res.send """
    <?xml version="1.0" encoding="UTF-8"?>
    <Response>
     <Say voice="woman" language="en-gb">Hello Flying Spaghetti Monster !</Say>
     <Reject />
    </Response>
  """

redirectCallerToUser = (context) -> 
  res = context.res
  usernum = context.user.num
  res.contentType('application/xml') 
  res.send """
    <?xml version="1.0" encoding="UTF-8"?>
    <Response>
      <Dial>""" + usernum + """</Dial>
    </Response>
  """
    
    
    
       
     
    
   
    