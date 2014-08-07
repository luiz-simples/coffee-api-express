class CommandBase extends ObjectBase
  judge = null

  constructor: ->
    judge = arguments_[0];

  execute: ->
    judge.verify()
