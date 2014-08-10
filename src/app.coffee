express = require 'express'
app = express()

app.get "/hello.txt", (req, res) ->
  res.send "Hello World"

server = app.listen(3000, ->
  console.log "Listening on port %d", server.address().port
)
