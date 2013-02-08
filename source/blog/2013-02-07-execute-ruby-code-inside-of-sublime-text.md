---
title: Execute Ruby Code Inside of Sublime Text
---

Lately I've been watching a lot of [Avdi Grimm's](http://devblog.avdi.org/) excellent Ruby screencast series, [Ruby Tapas](http://devblog.avdi.org/rubytapas/) (if you haven't seen any of these, I strongly recommend you subscribe, or if nothing else, watch the [free episodes](http://devblog.avdi.org/rubytapas-free-monday-episodes/)) In Avdi's videos he can often be seen executing example ruby code in which the output is returned directly in the editor. Avdi uses Emacs in his videos, but personally I prefer [Sublime Text](http://www.sublimetext.com/), and I wanted to find a way to do the same in my browser of choice.

A bit of Googling led me to a few pre-existing solutions, but none worked quite the way I wanted, so I modify the existing solutions to meet my needs. 

My version of RubyEval was originally forked from [jugyo/SublimeRubyEval](https://github.com/jugyo/SublimeRubyEval), but the code is primarily based off of examples privided in [this superuser.com post](http://superuser.com/questions/472413/is-there-a-way-to-execute-and-update-markers-in-sublime-text-2). This package is available as a git repo here: [https://github.com/kevinthompson/SublimeRubyEval](https://github.com/kevinthompson/SublimeRubyEval)

Here's a quick example of how to install and start using this package:

## Getting Started
``` bash
cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages
git clone https://github.com/kevinthompson/SublimeRubyEval.git RubyEval
```

## Usage
RubyEval will evaluate either your entire file, or the selected region, and will replace any instance of `# =>` with its evaluated result. Simply add `# =>` to the end of each line that you'd like to display the evaluated result of, then optionally select the region to parse, and execute the `ruby_eval` command using your assigned hotkey, or through Sublime Text 2's command pallette.

By default, the `ruby_eval` command is bound to `super+k, super +e`.

## Example Input/Output
``` ruby
class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

p = Person.new('Kevin')
p.name # => "Kevin"
p.age # => 
# ~> -:11: undefined method `age' for #<Person:0x10ecef310 @name="Kevin"> (NoMethodError)
```