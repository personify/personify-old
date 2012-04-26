service: 'createModule'
in:
  fsPath : @FSPath
  name	 : @String

sideFX: "create module on FileSystem at fsPath/name"






specs: 

  "Can create module on FileSystem":

    "1. When a module is created"
    "2. Then the dir should exist"

    cleanup: "remove dir"

  "Error on duplicate module creation":

    "1. When a module is created"
    "2. And the same module is created again"
    "3. It should throw an error"

    cleanup: "remove dir"
