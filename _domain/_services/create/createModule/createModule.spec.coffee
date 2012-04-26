require 'should'
path = require 'path'

report = (type, str) -> console.log type+":"+str
log = (str) -> console.log str

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

createModule = require './createModule'
scratch = path.join __dirname, "_scratch"

spec
  service: 'createModule'
  can: "create a module dir on a FileSystem": ->
 
    series

      "1. When a module is created": ->
     
        createModule #!
          fsPath: scratch
          name: "TestAgent"
      
      "2. Then fsPath/name should exist": ->

        path.existsSync(path.join scratch, "TestAgent")
        .should.be.true

  cleanup: -> 

    sh = require 'shelljs'
    sh.rmdir path.join scratch, "TestAgent"





















###
spec: "error on duplicate module dir creation":

  "When I try to create a module when it exists": ->

    createModule #!
      fsPath: path.join __dirname, "_specs/_scratch"
      name: "TestAgent"

  "Then it should throw an error": -> 

    e.error.should.exist

