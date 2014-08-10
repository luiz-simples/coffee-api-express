mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/expressapi_test'

db = mongoose.connection
db.on "error", console.error.bind(console, "connection error:")
db.once "open", callback = ->
  console.log "Yeah, connection opened"
  return
