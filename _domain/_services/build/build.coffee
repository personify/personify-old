_rzr = require 'rzr'

# scaffold project based on contract and build config

build: ({agent}) -> 
  sideFX: -> 
    _rzr.build @agent.config.build