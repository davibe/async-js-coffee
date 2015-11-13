# Async programming in JS/Coffee


Imagine we have a client library that talks to a server asynchronously

- **client.login(u, p, ..)** : LogIn with username and password
- **client.getPosts(userId, ..)** : Get array of posts of a user
- **client.countPostLike(post, ..)** : Like one post
- **client.logout(..)** : Log out current user

Now imagine you want to like all the posts of a user one by one (serialized) and logout, using plain old-style js and node-style callbacks.

You can implement this in many ways. Let me discuss some

1. [Node-style callbacks](1_nodestyle.html)
2. [Promises (Q.js)](2_promises_q.html)
3. [ES6 Generators/yield](3_es6_generators.html)
4. [Generators and promises (Q.js) together](4_generators_promises.html)

#### Further readings

If you are interested into generators and async stuff without promises I suggest you go on reading [this article](http://jlongster.com/A-Closer-Look-at-Generators-Without-Promises). I personally prefer promises.
