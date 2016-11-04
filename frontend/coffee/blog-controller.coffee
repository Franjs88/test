'use strict'

angular.module('SimpleBlog').controller 'blogController', ($scope, blogService) ->
  $scope.posts = []

  ###
  # Function to retrieve all blog posts
  ###

  retrieveAllBlogPosts = ->
    blogService.getPosts().success((data) ->
      $scope.posts = data
      return
    ).error ->
      console.log 'Error retrieving blog posts'
      return
    return

  retrieveAllBlogPosts()
  return