exports.shouldSave = (test) ->
  story = new Story
  story.title = "big bang"
  test.expect(1)
  story.save (err, story, numberAffected) ->
    test.ok !err
    test.done()
