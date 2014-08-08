exports.Judge =
  "Should return yes when call method execute block true": (test) ->
    judge = new Judge true, ->
      true
    , ->
      false

    oneHit = 1

    test.expect oneHit
    test.ok judge.verify()
    test.done()
    return

  "Should return nothing when call method execute block false": (test) ->
    judgeNothing = new Judge false, ->
      true
    , ->
      false

    nothing = false
    oneHit = 1

    test.expect oneHit
    test.equals judgeNothing.verify(), nothing
    test.done()
    return
