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

spec = ({service, desc, steps}) -> 
  report 'title', "#{service}: #{desc}"
  steps()
  #step str, func for str, func of steps


####

sh = require 'shelljs'

createModule = ({fsPath, name}, next) -> 

  #sideFX: create module on FileSystem

  modulePath = path.join fsPath, name 
  if !path.existsSync modulePath then sh.mkdir '-p', modulePath #!
  else log 'path already exists: ' + modulePath

  next?()

####

series = (steps) -> 
  #console.log typeof step, func for step, func of steps
  for step, func of steps
    console.log step
    #async .add 
  #run

####

service: 'createModule'
in:
  fsPath : @FSPath
  name: @String

sideFX: "create module on FileSystem"

spec: 
  "can create a module dir on FileSystem"
  "error on duplicate module dir creation"

  steps:

    "When a module is created": ->
 
      createModule #!
        fsPath: path.join __dirname, "_specs/_scratch"
        name: "TestModule"
 
    "Then a folder should exist": ->

      path.existsSync(path.join __dirname, "_specs/_scratch/TestAgent")
      .should.be.true

###    
    "When I try to create a module when it exists": ->

      createModule #!
        fsPath: path.join __dirname, "_specs/_scratch"
        name: "TestAgent"

    "Then it should throw an error": -> 

      e.error.should.exist







####

spec 
  service: 'createModule'
  desc: "create a module"
  steps: ->

    chain

      "When a module is created": ->
 
        createModule #!
          fsPath: path.join __dirname, "_specs/_scratch"
          name: "TestAgent"

      "Then a folder should exist": -> 
 
         path.existsSync(path.join __dirname, "_specs/_scratch/TestAgent")
         .should.be.true


      "When I try to create a module when it exists": ->

        createModule #!
          fsPath: path.join __dirname, "_specs/_scratch"
          name: "TestAgent"

      "Then it should throw an error": -> 

        e.error.should.exist

##
