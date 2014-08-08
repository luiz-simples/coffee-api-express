class CommandBase
  constructor: ->
    @judge = arguments[0];
    ObjectBase.apply @, arguments

  execute: ->
    @judge.verify()
