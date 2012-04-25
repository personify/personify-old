require 'should'
path = require 'path'

report = (type, str) -> console.log type+":"+str
log = (str) -> console.log str

step = (str, func) ->   
  try
    func()
    report 'step', str
  catch err
    console.log "ERR: ", err



spec = ({service, can, error, cleanup}) -> 
  
  if can?
    report 'service', service
    report 'feature', feature for feature, steps of can
    step str, func for str, func of steps
    cleanup?()
  

###

series = (steps) -> 
  #console.log typeof step, func for step, func of steps
  for step, func of steps
    console.log step
    #async .add 
  #run

###

# will be auto DI'd at runtime
createModule = require './createModule'
sh = require 'shelljs'

spec 
  service: 'createModule'
  can: "create a module dir on a FileSystem":

    "When a module is created": ->
   
      createModule #!
        fsPath: path.join __dirname, "_scratch"
        name: "TestAgent"
    
    "Then a folder should exist": ->

      path.existsSync(path.join __dirname, "_scratch/TestAgent")
      .should.be.true

  #cleanup: -> sh.rmdir path.join __dirname, "_scratch/TestAgent"



###
spec: "error on duplicate module dir creation":

  "When I try to create a module when it exists": ->

    createModule #!
      fsPath: path.join __dirname, "_specs/_scratch"
      name: "TestAgent"

  "Then it should throw an error": -> 

    e.error.should.exist

