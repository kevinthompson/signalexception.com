---
layout: post
title: "Start Required Processes on Pow Application Boot"
comments: true
---

Using [Pow](http://pow.cx/) to serve your Rack apps makes managing multiple applications a breeze, but you may still find yourself manually starting up additional processes that your apps depend on. Luckily, Pow provides us with a few hooks to automate these processes as well.

<!-- more -->

In the [Pow Manual](http://pow.cx/manual.html) under section 2.2, "[Customizing Environment Variables](http://pow.cx/manual.html#section_2.2)", we're given an overview of how we might customize the environment for our worker processes through the `.powrc` and `.powenv` files. However, because these files simply execute a series of bash commands, we can add much more than environment variable exports to our application boot process.

For example, most of the projects I've been contributing to lately use MongoDB, and as such, I need to have an instance of the `mongod` process running in order to connect to my databases. To avoid the inevitable application startup error, or having to manually check for an existing MongoDB process, I can simply add the following code to my `.powrc` file:

    # Start MongoDB
    if ! ps ax | grep -v grep | grep 'mongod' > /dev/null
    then
      mongod -port 27017 </dev/null &>/dev/null &
    fi

These few lines are all I need to check for a `mongod` process, and automatically start it if it's not already running when my application is booted.

If you want to test the functionality in your `.rvmrc` file, you can run the files directly from your project directory: `./.rvmrc`. If you're going to be executing this file directly, I would recommend rounding out your code with a few echos for clarity:

    if ! ps ax | grep -v grep | grep 'mongod' > /dev/null
    then
      echo "Starting MongoDB server..."
      mongod -port 27017 </dev/null &>/dev/null &
      echo "MongoDB is now up and running."
    else
      echo "Relax bro. MongoDB is already running."
    fi