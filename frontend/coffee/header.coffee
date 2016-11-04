'use strict'

###
# Directive: header.
# Description: A header for the blog.
###
angular.module('SimpleBlog').directive 'header', ->
  {
  restrict: 'E'
  templateUrl: '/header.html'
  controller: ($scope) ->

  }