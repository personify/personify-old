# create a new module and contract

newAgent = ({path, type, name}, next) ->

  #sideFX: series createModule, createContract

  series @in, 		
    1: createModule 
    2: createContract
    3: next?

