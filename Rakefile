require 'rubygems'
require 'bundler/setup'
require 'net/http'

desc 'Ping URL'
task :ping, :url do |t, args|
  url = args[:url]
  url ||= 'kevinthompson.info'
  puts "Pinging #{url}..."
  r = Net::HTTP.new(url, 80).request_head('/')
  puts "Response Received: [#{r.code}] #{r.message}"
end

desc 'Deploy site to github and production'
task :deploy do

  # Check For Uncommitted Changes
  puts "Checking for uncommitted changes..."
  unless `git status | grep 'not staged'`.empty?
    abort " ! Sorry princess, but you've got uncommitted changes. Stash or commit your work before deploying."
  end

  # Build Static Site
  `bundle exec middleman build`
  `git add --all && git commit --amend -C HEAD`

  # Push Code
  `git push origin master`
  `git push production master`

  # Remove Generated Static Files
  `rm -rf build`
  `git add --all && git commit --amend -C HEAD`

end