service: 'createModule'
in:
  fsPath : @FSPath
  name	 : @String

sideFX: "create module on FileSystem at fsPath"

specs: 
  "can create a module dir on a FileSystem"
  "error on duplicate module creation"
