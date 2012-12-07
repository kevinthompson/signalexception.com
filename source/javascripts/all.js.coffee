#= require jquery.pjax

# Open External Links in New Tab/Window
$('a').not('[href^="#"],[href^="/"],[href*="#{document.domain}"]').attr('target','_blank')

# PJAX Page Loading
$(document)
  .on 'click', 'a[href^="/"]', (event) ->
    event.preventDefault()
    $.pjax
      url: $(this).attr 'href'
      container: '#content'
      fragment: '#content'
      timeout: 5000