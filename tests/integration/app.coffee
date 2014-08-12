describe 'app', ->
  it 'sohuld respond to get /hello.txt', (done) ->
    req = request app
    get = req.get "/hello.txt"
    get.expect 200
    get.expect "Hello World"
    get.expect "content-type", "text/html; charset=utf-8"
    done()
    return
  return
