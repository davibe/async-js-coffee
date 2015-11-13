
### Client

A fake/stub implementation of the behaviour of a client using Q.js promises.

    Q = require 'q'
    
    client =
    
      login: (username, password) ->
        Q.promise (resolve) -> setTimeout(resolve, 1000)
        
      getPosts: (userId) ->
        Q.promise (resolve, reject) ->
          setTimeout ->
            resolve(["post1", "post2", "post3"])
          , 1000
          
      countPostLikes: (post) ->
        Q.promise (resolve, reject) ->
          setTimeout ->
            resolve(10)
          , 1000
          
      logout: ->
        Q.promise (resolve) -> setTimeout(resolve, 1000)


    module.exports = client


You can also have a look at the [node-style callbacks version](client_callbacks.html)