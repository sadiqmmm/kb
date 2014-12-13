# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#edit").editable
    inlineMode: false
    toolbarFixed: false
    placeholder: 'Start to type something...'    
    imageResize: true
  return
