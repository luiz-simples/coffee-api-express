express = require 'express'

app = express()

app.get "/hello.txt", (req, res) ->
  res.send "Hello World"
  return
