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
  if to == '666'  
    console.log('calling my mother')
    callback(null, {num: +33632249198})
  else  
    callback(true, {})
    

findRulesForUserAndCaller = (user, caller, context, callback) ->
      
    
processUser = (user, context) -> 
  redirectCallerToUser(context)


rejectCaller = (context) -> 
  res = context.res
  res.contentType('application/xml') 
  res.send """
    <?xml version="1.0" encoding="UTF-8"?>
    <Response>
     <Say voice="woman" language="en-gb" loop="2">Hello Flying Spaghetti Monster !</Say>
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
    
    
    
       
     
    
   
    