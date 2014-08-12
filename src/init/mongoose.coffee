mongoose = require 'mongoose'
mongoose.connect SampleApi.options.database.url

db = mongoose.connection
db.on "error", console.error.bind(console, "connection error:")
db.once "open", ->
  console.log "Yeah, connection opened"
  return
