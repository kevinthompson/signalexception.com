---
title: Setting Up an Impact.js Game Development Environment
---

For a number of years now I've wanted to create games. Actually, I've wanted to
create my own games for about as long as I can remember. I've finally decided to
try my hand at creating games for myself and my children, and after evaluating
a number of game development frameworks, I've decided that [Impact.js](http://impact.js)
is the platform that, being a web developer, will be the easiest for me to adopt
and actually create a game with.

Although there really isn't much to setting up an Impact.js development environment,
there are a few things that I wanted to be able to do that would make building games
with Impact.js feel more like my daily Ruby development.

Because Impact.js page require some sort of web server, I wanted them to work
with my development server of choice, [Pow](http://pow.cx). You can serve static
files through Pow by simply moving your static files to (in this case the source
of your Impact.js game) to a `public` folder, but I wanted a little more control
over my the project routing. More specifically, I also didn't want to have to
remember how to spell `weltmeister.html` so I wanted to be able to remap that URL.

To solve both of these issues, I decided to add a `config.ru` file to my project and use
`Rack::Rewrite` to serve the static files, and also to remap `/weltmeister.html` to
`/edit`. Below are the two files you need to create in order to duplicate my setup:

``` ruby

# ./Gemfile
source 'https://rubygems.org'

# Rack
gem 'rack'
gem 'rack-legacy'
gem 'rack-rewrite'
```

``` ruby

# ./config.ru
require 'rubygems'
require 'rack'
require 'rack-legacy'
require 'rack-rewrite'

INDEXES = ['index.html','index.php', 'index.cgi']

use Rack::Rewrite do
  rewrite %r{^/edit$}, '/weltmeister.html'
  rewrite %r{(.*/$)}, lambda {|match, rack_env|
    return_path = rack_env['PATH_INFO']
    INDEXES.each do |index|
      if File.exists?(File.join(Dir.getwd, rack_env['PATH_INFO'], index))
        return_path = rack_env['PATH_INFO'] + index
      end
    end
    return_path
  }
end

use Rack::Legacy::Php, Dir.getwd
use Rack::Legacy::Cgi, Dir.getwd
run Rack::File.new Dir.getwd
```

Once you've created those two files, you'll need run `bundle install` in order
to install the required gems. Now you just need to link your project to Pow
(I'd recommend using the [powder gem](https://github.com/Rodreegez/powder)) and
you should be able to access your impact game using pow (ex: http://impact.dev).

If you don't yet have PHP installed, you'll need to perform a few more steps in
order to get the Weltmeister level editor working properly with this setup. Simply
follow these [instructions for installing PHP using Homebrew](https://github.com/josegonzalez/homebrew-php)
over on Github and you should be all set.

-----

I'll continue posting about my experiences with Impact.js as I continue to explore,
and I'd love to hear any tips or recommendations from other Impact.js developers.