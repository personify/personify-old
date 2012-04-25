spec: new: "watch an agent for changes":

  given: "a sample agent": -> sample 'agent'

  and: "the agent is watching", -> 
    @agent.watch target: @agent.target 

  then: "the agent should detect file creation", -> 
    @agent.on 'create', -> @pass 'file creation detected'

when: "a file is created" ->
  exec "echo 'hi!' >> hello.txt"  
  
