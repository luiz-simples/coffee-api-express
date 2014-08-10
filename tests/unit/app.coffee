request = require("nodeunit-express")

# This is a nodeunit test example
exports.testGet = (test) ->
  express = request(app)
  express.get("/hello.txt").expect (response) ->
    
    # response is the response from hitting '/'
    test.equal response.body, "Hello World"
    test.equal response.statusCode, 200
    test.equal response.headers["content-type"], "text/html; charset=utf-8"
    test.done()
    express.close()
    return

  return
