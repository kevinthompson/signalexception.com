---
title: Writing Regular Expressions with Comments in Ruby
---

I don't think it's any secret that regular expressions are essentially magic to
a large number of developers. One potential solution I found to help demystify
regular expressions for my fellow developers is to move them into methods or variables
where they can be expressed across multiple lines. Once expanded, helpful
comments can be added to each line to clarify the intention of a pattern.

``` ruby
def email_pattern
  %r{
    ^[A-Z0-9._%+-]+   # Beginning with one or more letters, numbers, period, etc.
    @                 # An "at" sign
    [A-Z0-9.-]+       # One or more letters, numbers, period, or dash
    \.                # A period
    [A-Z]{2,4}$       # Ending with a two to four character text domain extension
  }ix                 # Flags: Ignore letter case and ignore newlines in regex
end
 
'a@b.com'.match(email_pattern) # => #<MatchData "a@b.com">
'email@madebykevin.com'.match(email_pattern) # => #<MatchData "email@madebykevin.com">
'madebykevin.com'.match(email_pattern) # => nil
```

For simpler regular expression statements this is probably overkill, but if
you're implementing something particularly complex, this format could even help
regex veterans more quickly parse these cryptic strings.
