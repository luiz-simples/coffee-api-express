exports.Story =
  "should save": (test) ->
    story = new Story
    story.title = "big bang"
    test.expect 1
    story.save (err, story, numberAffected) ->
      test.ok !err
      test.done()
      return

  "should count": (test) ->
    cleaner = databaseCleaner.clean mongoose.connections[0].db
    story = new Story
    story.title = "big bang"
    promise = story.find().exec()
    test.expect 2

    promise.then (obj) ->
      Story.count (err, count) ->
        test.ok !err
        test.equal count, 1
        test.done()
        return
      return
    return
    
