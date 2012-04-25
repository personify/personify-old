path = require 'path'
sh 	 = require 'shelljs'
log  = console.log

# create a new module 

createModule = ({fsPath, name}, next) -> 

  #sideFX: create module on FileSystem

  modulePath = path.join fsPath, name 
  if !path.existsSync modulePath then sh.mkdir '-p', modulePath #!
  else log 'path already exists: ' + modulePath

  next?()



module.exports = createModule