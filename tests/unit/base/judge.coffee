exports.Judge =
  setup: (callback)->
    @oneHit = 1
    callback()
    return

  "Should return yes when call method execute block true": (test) ->
    judge = new Judge true, ->
      true
    , ->
      false

    test.expect @oneHit
    test.ok judge.verify()
    test.done()
    return

  "Should return nothing when call method execute block false": (test) ->
    judge = new Judge false, ->
      true
    , ->
      false

    nothing = false
    test.expect @oneHit
    test.equals judge.verify(), nothing
    test.done()
    return
