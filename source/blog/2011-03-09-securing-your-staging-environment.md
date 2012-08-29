---
title: Securing Your Staging Environment
---
While working as a part of a team or with a remote client, it's often beneficial to have a staging environment accessible outside of your local office or VPN for quality assurance, editorial review, or client approval. However, when configuring your staging environment, there are several precautions you should take in order to guarantee the security and privacy of your work.

## Restrict Search Engine Access
In order to stop users from finding your staging environment in search engines, and also to avoid any [duplicate content issues](http://www.google.com/support/webmasters/bin/answer.py?hl=en&answer=66359) that could negatively impact the rankings of your production site, you'll want add a restriction to the `robots.txt` file at the public root of our sites:

```
User-agent: *
Disallow: /
```

These two lines alone, when added to our `robots.txt` file, will tell search engines to ignore all content on the site beginning at the root URL.

_**Note:** Be sure to remove these rules from the robots.txt file on your production site, otherwise it will not be indexed by search engines._

## Require User Login
While adding a rule to your `robots.txt` file will stop search engines from indexing your staging environment, it will still be possible for users to access it unless you implement some form of user authentication. If you're using an editorial platform or content management system such as Wordpress or ExpressionEngine, there is typically an option available in the site's configuration, or a plugin that can be installed that will disable access to all unauthorized users.

For example, in ExpressionEngine, this option can be found in Admin > General Configuration > Is system on?. Once this option is changed to "no", only member groups who've been allowed to view the site in offline mode will be able to access it.

## HTTP Authentication
If you're not using a platform that's already capable of restricting user access, or you've yet to build user authentication into your site and you're hosting the project on Apache, you can use basic HTTP authentication to limit access.

To create your HTTP authentication files, first create a file named `.htpasswd` and place it in your site root (take note of the full server path to this file as you'll need it in the next step). Next, use the [htaccesstools.com htpassword generator](http://www.htaccesstools.com/htpasswd-generator/) to create username and password pairs that will be added to your `.htpasswd` file. After adding each username and password pair to your `.htpasswd` file, use the [htaccess authentication generator](http://www.htaccesstools.com/htaccess-authentication/) to create the authentication rules that will be added to your website's `.htaccess` file.

Once these steps have been completed, when accessing a secure area of your site, you should be prompted to enter your username and password.

What steps do you take to secure your staging or beta environments? Share your tips in the comments below!