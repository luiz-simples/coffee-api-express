class StoriesController
  list: (req, res) ->
    Story.find {}, (err, stories) ->
      throw err if err
      res.send stories
      return
    return
