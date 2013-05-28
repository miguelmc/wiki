# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#js-preview").click (e) ->
    e.preventDefault()
    url = "/article/preview"
    data = $('#js-article-form').serialize()
    $.ajax(
      url: url
      data: data
      type: 'POST'
      dataType: 'html'
      success: (data) ->
        $('#js-preview-container').html(data)
    )

