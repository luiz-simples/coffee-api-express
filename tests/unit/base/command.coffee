exports.CommandBase =
  setup: (callback)->
    @oneHit = 1
    callback()
    return

  "Should return yes when call method execute block": (test) ->
    commandBase = new CommandBase ->
      true

    test.expect @oneHit
    test.ok commandBase.execute()
    test.done()
    return

  "Should return false when call method execute block": (test) ->
    commandBase = new CommandBase ->
      false

    nothing = false
    test.expect @oneHit
    test.equal commandBase.execute(), nothing
    test.done()
    return
