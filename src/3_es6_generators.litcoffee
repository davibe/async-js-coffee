### ES6 Generators
    
    Q = require 'q'

Require the [promised version of the client](client_promises.html)

    client = require './client_promises'
    
Implement using `Q.spawn` to run the generator function

    Q.spawn ->
      try
        yield client.login('davide', 'pass')
        posts = yield client.getPosts('alberto')
        results = []
        for post of posts
          results.push(yield client.countPostLikes(post))
        yield client.logout()
      catch e
        console.error 'should handle error here ..'


#### Comments

- Beside initial nesting to start the generator, it looks good
- Feels odd having to write `yield` for every promised value
- The result of `Q.spawn` is not a promise
- drawbacks ?
