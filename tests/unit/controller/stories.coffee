describe 'StoriesController', ->
  beforeEach (done) ->
    databaseCleaner.clean mongoose.connections[0].db, ->
      console.log "KSJDFJHFKJHGSJLDGJHSLJHGLJKS"
      done()
    return

  it 'should list all stories', (done) ->
    Story.create {title: 'story 1'}, (err) ->
      throw err if err
      Story.create {title: 'story 2'}, (err) ->
        throw err if err
        Story.create {title: 'story 3'}, (err) ->
          throw err if err
          storiesCtl = new StoriesController()
          storiesCtl.list {},
            send: (stories) ->
              expect(stories).to.have.length 3
              expect(stories[0].title).to.be 'story 1'
              expect(stories[1].title).to.be 'story 2'
              expect(stories[2].title).to.be 'story 3'
              done()
              return
          return
        return
      return
    return
  return
