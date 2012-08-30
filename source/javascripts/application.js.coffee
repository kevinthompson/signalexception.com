#
# Application Scripts
# ------------------------------

$ ->

  # Github Repos
  if $('#gh_repos').length > 0
    github.showRepos
      user: 'kevinthompson'
      count: 3
      skip_forks: true
      target: '#gh_repos'

  # External Links in New Tab
  $('a').not('[href^="/"],[href*="kevinthompson.info"]').attr('target','_blank')

  # Syntax Highlighting
  window.prettyPrint && prettyPrint()