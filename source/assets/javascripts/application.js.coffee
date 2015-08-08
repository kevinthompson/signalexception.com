#= require jquery.pjax

# Events
$(document)
  .on 'click', 'a', (event) ->
    $target = $(event.currentTarget)

    # PJAX Page Loading
    if $target.is('a[href^="/"]')
      event.preventDefault()
      href = $target.attr('href')
      unless href == window.location.pathname
        $.pjax
          url: href
          container: '#content'
          fragment: '#content'
          timeout: 5000

    # Open External Links in New Tab/Window
    else if $target.is($('a').not('[href^="#"],[href^="/"],[href*="#{document.domain}"]'))
      $target.attr('target','_blank')

  .on 'pjax:complete', ->
