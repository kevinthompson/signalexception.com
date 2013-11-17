---
title: Using Git Repos as Project Templates
---

When I begin working with a new technology, I often like to set up my ideal
starting point for new projects, and as any good developer should, I manage
those templates using Git.

The following is the workflow I use for starting a new project based off of one of
these templates. The steps below make use of commands only available through the
[Hub](https://github.com/github/hub) library, which you should really be using
either way.

## Three Simple Commands

``` shell
$ git clone --depth 1 --origin source project-template new-project
$ cd new-project
$ git create new-project
```

## Process

For the sake of this article, lets say I have a repo called `project-template`
in my github account. On [Github](http://github.com) this would technically be
`kevinthompson/project-template`. In order to duplicate this project on my local
machine, I just need to run a few commands:

``` shell
$ git clone --depth 1 --origin source project-template new-project
Cloning into 'new-project'...
done.
$ cd new-project
$ git create new-project
Updating origin
created repository: kevinthompson/new-project
$ git log
abfe202 Project Template v0.0.1
$
```

These commands clone the project template into a new directory named `new-project` truncating its history
and assign the remote named `source` to the original project template (which makes
it easy for me to merge in changes to the original template). Then after `cd`ing into
the new project directory, the `git create` command (which we have access to through
the [Hub](https://github.com/github/hub) library) creates a new repo on Github within
my account, and sets the `origin` remote to that newly created repo.

From there, I can start work on my new project in its own repo, and easily pull in any
changes made to the original template from the `source` remote.
