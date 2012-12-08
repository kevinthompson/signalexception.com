desc 'Publish blog to Heroku'
task :publish do

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
  `git checkout publish`
  `mv .git .gitbackup`
  `git init`
  `git remote add heroku git@heroku.com:kevinthompson.git`
  `git add --all && git commit -m "Middleman Site Built"`

  # Push Code
  puts 'Deploying to Heroku...'
  `git push -f heroku master`

  # Remove Generated Static Files
  `rm -rf build .git`
  `mv .gitbackup .git`
  `git reset --hard HEAD`
  `git checkout master`

end