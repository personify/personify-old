ee = require('events').EventEmitter
sh = 
  exec: (cmd) -> @agent.emit 'create'

mock = (what) ->
  obj = new ee()
  obj.watch = ->
  return obj

spec = ({service, can}) -> 
  console.log service
  console.log feature for feature, steps of can
  for step, func of steps
    try
      func -> report step
    catch e
      console.log e  

spec
  service: "watch"
  can: "watch an Agent for changes":

    "1. Given a mock agent": ->

      @agent = mock 'Agent'
   
    "2. And the agent is watching": (agent) ->
    
      @agent.watch() #!

    "3. Then the agent should detect file creation": (agent) ->

      @agent.on 'create', -> path.existsSync('./hi.txt').should.be.true 

    "4. When a file is created": ->

      sh.exec "echo 'hi' >> ./hi.txt" #!

   cleanup: -> sh.rm "./hi.txt"
