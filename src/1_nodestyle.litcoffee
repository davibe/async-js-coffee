
### Node-style callbacks


Require a callback-based implementation of the client

    client = require './client_callbacks'

Use it

    client.login 'davide', 'pass', (e) ->
      if e then return consol.error 'should handle error here..'
      
      client.getPosts 'albertop', (e1, posts) ->
        if e1 then return consol.error 'should handle error here..'
        
        results = []
        next = (e3, partialResult) ->
          if e3 then return consol.error 'should handle error here..'
          
          if partialResult then results.push(partialResult)
          post = posts.pop()
          if post
            client.countPostLikes(post, next)
          else
            client.logout (e2) ->
              if e2 then return console.error 'should handle error here..'
              


#### Comments

- callback hell
- hacky way to collect partial results
- code out of order w.r.t. execution
- messy and poor error handling
- async.js library would solve a lot here i know. Anybody cares to send me an example ?
