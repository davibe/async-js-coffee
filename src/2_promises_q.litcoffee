
### Promises with Q.js

    client = require './client_promises' 

    client.login('davide', 'pass').then ->
      client.getPosts('alberto')
    .then (posts) ->
      cur = Q()
      promises = posts.map (post) ->
        cur = cur.then -> client.countPostLies(post)
      Q.all(promises)
    .then (results) ->
      client.logout()
    .catch (e) ->
      console.error 'should handle error here'

#### Comments

- the code order matches execution order (big win)
- error handling is nicer because Q allows .catch at the end but we still need to manage different errors there
- we can also append .catch for each Promises for a more granular handling
- we still have to use closures (nesting) to serialize `client.countPostLike` executions, in a hacky way
