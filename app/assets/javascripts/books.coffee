# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(".book").hover (->
    $(".book-access-links", this).removeClass "hide"
    return
  ), ->
    $(".book-access-links", this).addClass "hide"
    return
   
  # link will expand chapter sections
  $(".expand-chapter").on "click", (event) ->
    event.preventDefault()
    $(".glyphicon", this).toggleClass "glyphicon-plus glyphicon-minus"
    return

  # link will expand sections
  $(".expand-section").on "click", (event) ->
    event.preventDefault()
    $(".glyphicon", this).toggleClass "glyphicon-plus glyphicon-minus"
    return

  return