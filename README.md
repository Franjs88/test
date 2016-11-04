# Gremyo Developer Test

Heroku app is not working properly because of the HTTPS Mixed Content Error Chrome and Firefox throw. This error occurs when the page is running on a HTTPS enviroment, but any of the internal or external requests use HTTP. The browser detects this as unsecure and block this 'unsecure' requests.

heroku lets you add an SSL certificate but you need to pay for that, so for the intentions of this test, I wont do that.

## Fran Instructions to deploy locally the test:
Project is written in CoffeeScript, so you need to build the project before running it, do it in this way:
```
grunt build
node build/server.js
```
Now open your prefered browser and write the url:
```
http://localhost:8080
```

Done!


![gremyo logo](http://i.imgur.com/XqXUlvv.png)

Welcome! This test covers frontend and backend web development.

First answer the questions on the file **questions.md** and push the commit to a fork of this repo on github, after that you have two hours to finish the challenge.

Good luck!


## Challenge

The challenge is to build a very simple blog with this specifications:

* The blog should have a header and three posts.
* For the layout you have to use flexbox.
* The html should be rendered on the browser, you can use vanilla javascript or a framework. For example [react.js](https://facebook.github.io/react/) or [vue.js](https://vuejs.org/), you shouldn't use jquery.
* An api rest for getting the data of the posts.
* For the backend you can use any language/framework that you like. We are currently using nodejs and python in gremyo.
* Use a build system for the frontend, for example [gulp](http://gulpjs.com/), [grunt](http://gruntjs.com/) or [webpack](https://webpack.github.io/).

**Optional:**

* Deploy the app, you can use something like [heroku](https://www.heroku.com/) or [AWS](https://aws.amazon.com/es/).
* Create an ad below every post using this url from our api [https://r2.gremyo.com/api/v1/sites/eal](https://r2.gremyo.com/api/v1/sites/eal) (we are currently working on the documentantion of our api, if you have any doubt you can ask to our developers).
* Use a css preprocessor.
* Use es2016 standard for javascript code.
* Hability to add comments to each post (you can use something like https://disqus.com/).
* A system for assigning categories to the posts.
