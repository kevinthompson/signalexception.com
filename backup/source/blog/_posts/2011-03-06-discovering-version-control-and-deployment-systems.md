---
layout: post
title: Discovering Version Control & Deployment Systems
---

For the last few years, I've managed and deployed my code using archaic, time consuming methods. Version control meant duplicating and renaming folders, and deployment was simply dragging and dropping files into an ftp client.

<!-- more -->

While I had worked with version control systems in the past, I had yet to reach a point where I felt particularly comfortable working with them and, at the time, they seemed to be more of an inconvenience than anything. I did however recognize the potential benefits of using a VCS, so I continued to follow the growth of systems such SVN and Git.

## Enter Github

Although [Github](http://github.com) has been around for several years, it was only recently that I found myself using the site on an almost daily basis, following links from various open source projects or for addons and applications being developed by my friends and colleagues. Once I realized how much I had come to enjoy following and exploring repositories on Github, I knew I needed to make a greater effort in adopting some sort of version control system myself.

I began researching [SVN](http://subversion.tigris.org/), [Git](http://git-scm.com/), and [Mercurial](http://mercurial.selenic.com/) in greater detail, but ultimately articles such as ["How I use Git"](http://thenerdary.net/articles/entry/how_i_use_git) and ["A successful Git branching model"](http://nvie.com/posts/a-successful-git-branching-model/), along with my new found affinity for Github, lead me to use Git over the alternatives. I breezed through a [few quick tutorials](http://learn.github.com/p/intro.html) on Git and before long I had created [a number of repositories on Github](http://github.com/kevinthompson) and was thoroughly enjoying every `branch`, `commit`, and `merge`. For whatever reason, where previous version control systems had been difficult to adopt, Git just clicked.

While this new found workflow made development a breeze, I was still fumbling my way through deployment. Since it was easy enough to clone a repository with Git, I decided to clone a repository on the production server, then shell into the server and issue a `git pull` when I needed to deploy. While this was simpler than manually transferring files via FTP, it still required a few too many steps to make deploying my code the casual process I wanted it to be. To further simplify things, I wrote a shell script and setup a dedicated user for deployment on each server so that I could easily issue a command on my local machine and off the code would go. This, again, was another degree simpler, but the maintenance and management of these scripts and users still stole time away from development.

##Enter Beanstalk

While researching Git, [Beanstalk](http://bnst.lk/e3HdOt) was also mentioned fairly frequently in more recent articles. Beanstalk is a service that, for a small fee, will quickly deploy code from a Git or SVN repository over FTP with little to no effort. I decided to give Beanstalk a shot and signed up for their trial account. If you're already familiar with Git or SVN, Beanstalk makes deployment a breeze. Once you've started your account, you'll need to define your servers and configure deployment for each.

In my case, I typically have a staging environment and a production environment (with development being done on my local machine). I configure Beanstalk to automatically deploy my `staging` branch to my staging server on each push, and my `master` branch to my production server manually from the Beanstalk interface, or when I append `[deploy:production]` to a commit message in my master branch (or on a commit message merged into the master branch). With this configuration, it's become trivial to deploy my code to either environment.

The addition of [Git](http://git-scm.com/) and [Beanstalk](http://bnst.lk/e3HdOt) to my workflow has not only simplified the management and deployment of code, but it's also allowed me to spend more time doing what I truly enjoy, developing web applications.