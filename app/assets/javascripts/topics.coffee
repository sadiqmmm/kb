# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(".topic").hover (->
    $('.access-links', this).removeClass "hide"
    return
  ), ->
    $('.access-links', this).addClass "hide"
    return

  return
