desc 'Deploy blog to Heroku'
task :deploy do

  # Check For Uncommitted Changes
  puts 'Checking for uncommitted changes...'
  unless `git status | grep 'not staged'`.empty?
    abort ' ! Stash or commit your work before publishing.'
  end

  # Ensure Current State has been Pushed to Github
  `git push origin master`

  # Switch to Orphaned Branch
  `git branch -D deploy`
  `git checkout --orphan deploy`

  # Build Static Site
  puts 'Building Middleman site...'
  `bundle exec middleman build`
  `git add build && git commit -m "Middleman Site Built"`

  # Push Code
  puts 'Deploying to Heroku...'
  `git push -f heroku master`

  # Return to Master Branch
  `git checkout master`
  `git branch -D deploy`

end