exports.init = (app) -> 
  app.get '/twilio/api/index.xml', (req, res) ->
 
    call =
      callSid: req.query["CallSid"]
      from:    req.query["From"]
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
  console.log(context.call.from)
  console.log('calling my mother')
  if context.call.from == '+33632249198' 
    callback(true, {})
  else
    callback(null, {num: '+33492047269'})
    

findRulesForUserAndCaller = (user, caller, context, callback) ->
      
    
processUser = (user, context) -> 
  redirectCallerToUser(context)


rejectCaller = (context) -> 
  res = context.res
  res.contentType('application/xml') 
  res.send """
    <?xml version="1.0" encoding="UTF-8"?>
    <Response>
     <Say voice="woman" language="en-gb">Cannot connect !</Say>
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
    
    
    
       
     
    
   
    