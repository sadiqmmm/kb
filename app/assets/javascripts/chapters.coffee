# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(".chapter").hover (->
    $('.chapter-access-links', this).removeClass "hide"
    return
  ), ->
    $('.chapter-access-links', this).addClass "hide"
    return

  return  