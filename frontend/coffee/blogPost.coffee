'use strict'

###
# Directive: blogPost.
# Description: A blog post component that can be reused.
###
angular.module('SimpleBlog').directive 'blogPost', ->
  {
  restrict: 'E'
  templateUrl: '/blogPost.html'
  scope:
    title: '='
    categorie: '='
    text: '='
  controller: ($scope) ->

  }