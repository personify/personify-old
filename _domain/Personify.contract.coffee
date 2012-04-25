#~/agents/Uatu$ personify
#> watch
#  watching Uatu

# scaffold from the top down, build from the bottom up

agent: 'Personify'
goal: "build Personify projects"

services:
  create: "create a new module and contract"
  test:   "run all specs for agent"
  build:  "build project based on contract and build config"
  watch:  "have agent watch itself for changes"



###



    in:
  	  path: Exists
  	  type: 'agent', 'job', Agent
  	  name: String
  	sideFX: ->
  	  series @in,
  	    1: createModule
  	    2: createContract

  build: "scaffold project based on contract and build config":
    in: 
      agent: Agent 
    sideFX: -> _rzr.build @agent

  watch: "have agent watch for changes":
    in: 
      agent: Agent
    sideFX: -> agent.watch()
