desc 'Deploy blog to Heroku'
task :deploy do

  # Check For Uncommitted Changes
  puts 'Checking for uncommitted changes...'
  unless `git status | grep 'not staged'`.empty?
    abort ' ! Stash or commit your work before publishing.'
  end

  # Ensure Current State has been Pushed to Github
  `git push origin master`

  # Build Static Site
  puts 'Building Middleman site...'
  `bundle exec middleman build`
  `git add build && git commit -m "Deploying to production..."`

  # Push Code
  puts 'Deploying to Heroku...'
  `git push -f heroku master`

  # Return to Master Branch
  `git checkout master`

end