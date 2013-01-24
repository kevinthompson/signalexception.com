---
title: Scroll Past The End of a File in Sublime Text 2
---

When I'm working with larger files in Sublime Text 2, it's a little annoying to reach the bottom of the file and be staring at the bottom of my screen. Because I don't want to litter my files and diffs with unnecessary newlines, I was determined to find a better solution.

After a bit of Googling, I found that with the addition of one simple option in my user preferences, I was able to scroll past the end of a file without adding any additional characters.

## Adding The Option

To start, open your user preferences by pressing `⌘ + ,`. Next, add `"scroll_past_end": true` to your user preferences hash and save the file:

``` javascript
{
  // ...
  "scroll_past_end": true
  // ...
}
```

That's it! Now you should be able to scroll past the bottom of any file. As an additional tip, if you're a hotkey junky like me, you can also hold `Ctrl + Option` and press the up or down arrow key to scroll the file without using a mouse.