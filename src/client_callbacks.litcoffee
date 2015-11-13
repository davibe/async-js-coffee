
### Client

A fake/stub implementation of the behaviour of a client with node-style callbacks.

    client =
    
      login: (username, password, cb) ->
        Q.promise (resolve) -> setTimeout(cb, 1000)
        
      getPosts: (userId, cb) ->
        setTimeout ->
          cb(["post1", "post2", "post3"])
        , 1000
        
      countPostLikes: (post, cb) ->
        setTimeout ->
          cb(10)
        , 1000
        
      logout: (cb) ->
        setTimeout(cb, 1000)

    module.exports = client


You can also have a look at the [promises (Q.js) version](client_promises.html)