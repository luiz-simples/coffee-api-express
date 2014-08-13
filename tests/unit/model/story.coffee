describe 'Story', ->
  beforeEach (done) ->
    databaseCleaner.clean mongoose.connections[0].db, ->
      console.log "KSJDFJHFKJHGSJLDGJHSLJHGLJKS"
      done()
    return

  it 'should save', (done) ->
    story = new Story
    story.title = "big bang"
    story.save (err, story, numberAffected) ->
      expect(err).to.be null
      done()
      return
    return

  it 'should count', (done) ->
    story = new Story
    story.title = "big bang"
    story.save (err) ->
      Story.count (err, count) ->
        expect(err).to.be null
        expect(count).to.be 1
        done()
        return
      return
    return
  return
