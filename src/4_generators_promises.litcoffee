### Using Generators and promises (Q.js)

I took liberty to extend `Q` by adding a couple of utility functions to simplify the workflow called `Q.each` and `Q.genrun`.

    Q = require 'q'

A serialized version of `Q.all`

    Q.each = (collection, iterator) ->
      cur = Q()
      promises = collection.map (item) ->
        cur = cur.then ->
          iterator(item)
      Q.all(promises)

A function that turns a generator into a promise

    Q.genrun = (generator) -> Q.async(generator)()


Example combined usage

    client = require './client_promises'

    Q.genrun ->
      
      yield client.login('davide', 'pass')
      console.log 'logged in'
      
      posts = yield client.getPosts('alberto')
      console.log 'got posts', posts
      
      results = yield Q.each posts, (post) ->
        console.log 'counting likes on post', post
        client.countPostLikes(post)

      yield client.logout()
      console.log 'logged out'
      
      yield results
      
    .then (val) ->
      console.log 'completed', val
      
    .catch (e) ->
      console.error 'ERROR:', e
