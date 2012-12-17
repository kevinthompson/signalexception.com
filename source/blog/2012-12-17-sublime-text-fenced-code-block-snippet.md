---
title: Sublime Text Fenced Code Block Snippet
---

I write all of my blog posts in markdown, and being a developer, that means that I frequently include blocks of code in my writing. In order to make this as easy as possible on myself, I've created a simple Sublime Text 2 snippet that lets me tab complete a single backtick (`` ` ``) character, specify a language, then write my example code.

    <snippet>
      <content><![CDATA[
    ``` ${1:lang}
    ${2}
    ```
    ]]></content>
      <tabTrigger>`</tabTrigger>
      <scope>text.html.markdown</scope>
    </snippet>

To use this snippet, select "Tools > New Snippet" from your meny bar in Sublime Text 2, then copy the snippet code into your new snippet file. Save your file and name it something like `Fenced Code Block.sublime-snippet` (the spaces in the name follows Sublime Text 2's naming conventions).

Once the snippet file has been saved, you should be able to open or create a new markdown file, type `` ` ``, then press tab in order to generate your fenced code block.