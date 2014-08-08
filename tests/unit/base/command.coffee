exports.CommandBase =
  "Should return yes when call method execute block": (test) ->
    judge = new Judge true, ->
      true
    , ->
      false

    commandBase = new CommandBase judge

    oneHit = 1
    test.expect oneHit
    test.ok commandBase.execute()
    test.done()
    return

  "Should return false when call method execute block": (test) ->
    judgeNothing = new Judge false, ->
      true
    , ->
      false

    commandBaseNothing = new CommandBase judgeNothing

    nothing = false
    oneHit = 1

    test.expect oneHit
    test.equal commandBaseNothing.execute(), nothing
    test.done()
    return
