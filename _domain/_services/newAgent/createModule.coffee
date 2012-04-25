# create a new module 

createModule = ({fsPath, name}, next) -> 

  #sideFX: create module on FileSystem
  sh = require 'shelljs'
  modulePath = path.join fsPath, name 
  if !path.existsSync modulePath then sh.mkdir '-p', modulePath #!
  else log 'path already exists: ' + modulePath

  next?()
