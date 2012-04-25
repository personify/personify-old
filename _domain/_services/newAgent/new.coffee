# create a new module and contract

new: ({path, type, name}) ->
  sideFX: ->
    series @in, 		
      1: createModule 
      2: createContract