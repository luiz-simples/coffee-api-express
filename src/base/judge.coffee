class Judge
  constructor: ->
    @check = arguments[0]
    @actionTrue = arguments[1]
    @actionFalse = arguments[2]
    ObjectBase.apply @, arguments

  verify: ->
    if @check then @actionTrue() else @actionFalse()
