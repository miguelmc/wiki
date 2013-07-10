# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#js-preview").click (e) ->
    $(".write").addClass('flip-preview')
    $('html, body').animate({
      scrollTop: 0
    }, 100)
    e.preventDefault()
    url = "/article/preview"
    data = $('#js-article-form').serialize()
    $.ajax(
      url: url
      data: data
      type: 'POST'
      dataType: 'html'
      success: (data) ->
        $('.prev-container').html(data)
    )  

  $(".write").on "click", "#js-back", (e) ->
    e.preventDefault()
    $(".write").removeClass('flip-preview')

  $.cachedScript = (url, options) ->
    options = $.extend(options || {},
      dataType: "script",
      cache: true,
      url: url
    )

    return jQuery.ajax(options)

  $(document).on "click", "#js-comments-pagination .next_page", (e) ->
    e.preventDefault()
    url = $('#js-comments-pagination .next_page').attr('href')
    $(this).text("Cargando...")
    $.cachedScript(url)

  $(document).on "click", "#js-articles-pagination .next_page", (e) ->
    e.preventDefault()
    url = $('#js-articles-pagination .next_page').attr('href')
    $(this).text("Cargando...")
    $.cachedScript(url)
