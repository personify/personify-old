# watch an agent for changes

watch: ({agent}) -> 
  sideFX: -> agent.watch()
