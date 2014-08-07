class Judge extends ObjectBase
  check = null
  actionTrue = null
  actionFalse = null

  constructor: ->
    check = arguments_[0]
    actionTrue = arguments_[1]
    actionFalse = arguments_[2]

  verify: ->
    if check then actionTrue() else actionFalse()
