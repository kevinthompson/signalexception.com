#= require jquery.pjax

$(document)
  .on 'click', (event) ->
    $target = $(event.target)

    # PJAX Page Loading
    if $target.is('a[href^="/"]')
      event.preventDefault()
      $.pjax
        url: $target.attr 'href'
        container: '#content'
        fragment: '#content'
        timeout: 5000

    # Open External Links in New Tab/Window
    else if $target.is($('a').not('[href^="#"],[href^="/"],[href*="#{document.domain}"]'))
      $target.attr('target','_blank')