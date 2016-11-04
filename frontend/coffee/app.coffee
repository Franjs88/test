'use strict'

###
# Main source file for the app.
###

angular.module('SimpleBlog', [
  'ngMaterial'
  'config'
]).factory 'blogService', ($http, ENV) ->
  endPoint = undefined
  endPoint = ENV.endpoint
  { getPosts: ->
    $http.get endPoint + 'posts/'
  }