express = require 'express'

app = express()

app.get "/hello.txt", (req, res) ->
  res.send "Hello World"




mongoose = require 'mongoose'

mongoose.connect 'mongodb://localhost/expressapi_test'

db = mongoose.connection
db.on "error", console.error.bind(console, "connection error:")
db.once "open", callback = ->
  console.log "Yeah, connection opened"
  return
