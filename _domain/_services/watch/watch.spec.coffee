
given: "a sample agent": -> sample 'agent'
and: "the agent is watched", -> 
  	@agent.watch 
  	  what: 'FileSystem' 

then: "the agent should detect file creation", -> 
  @agent.on 'create', -> @pass 'file creation detected'

when: "a file is created" ->
  exec "echo 'hi!' >> hello.txt"  
  
