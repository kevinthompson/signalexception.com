#= require github

$ ->
  # Github Repos
  if $('#gh_repos').length > 0
    github.showRepos
      user: 'kevinthompson'
      count: 3
      skip_forks: true
      target: '#gh_repos'

  # Open External Links in New Tab
  $('a').not('[href^="#"],[href^="/"],[href*="#{document.domain}"]').attr('target','_blank')