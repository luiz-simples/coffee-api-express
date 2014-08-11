exports.Story =
  "should save": (test) ->
    story = new Story
    story.title = "big bang"
    test.expect 1
    story.save (err, story, numberAffected) ->
      test.ok !err
      test.done()
      return
    return

  "should count": (test) ->
    databaseCleaner.clean mongoose.connections[0].db, () ->
      story = new Story
      story.title = "big bang"
      test.expect 2
      promise = story.save (err) ->
        Story.count (err, count) ->
          test.ok !err
          test.equal count, 1
          test.done()
          return
        return
      return
    return
