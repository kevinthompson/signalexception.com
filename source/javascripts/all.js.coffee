#= require jquery.pjax

@disqusLoaded = false
loadDisqus = ->
  unless disqusLoaded == true
    $.ajax
      type: 'GET',
      url: 'http://kevinthompson.disqus.com/embed.js',
      dataType: 'script',
      cache: true
      success: ->
        disqusLoaded = true

# Events
$(document)
  .on 'ready', ->
    loadDisqus() if $('#disqus_thread').length
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

    # Reload Comments
    if $('#disqus_thread').length && window.location.pathname.match(/^\/blog/)
      if disqusLoaded == true
        identifier = window.location.pathname.match(/\/([a-z0-9-]+)\.html$/)[1]
        DISQUS.reset
          reload: true
          config: ->
            this.page.identifier = identifier
            this.page.url = document.URL
      else
        loadDisqus()
