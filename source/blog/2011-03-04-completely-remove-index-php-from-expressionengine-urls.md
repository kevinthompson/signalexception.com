---
title: Completely Remove index.php from ExpressionEngine URLs
---
While there are a [number of known solutions](http://expressionengine.com/wiki/Remove_index.php_From_URLs/) for removing `index.php` from ExpressionEngine URLs, few developers realize that although URLs now resolve without `index.php`, the previous URLs including `index.php` also still exist.

##The Example

At the time of this writing, if you were to visit [http://expressionengine.com/index.php/overview/](http://expressionengine.com/index.php/overview/) or [http://expressionengine.com/overview/](http://expressionengine.com/overview/), you'd be presented with the exact same page. Having the same content resolve at two distinct URLs can potentially harm [your search engine rankings](http://www.google.com/support/webmasters/bin/answer.py?hl=en&answer=66359) and disrupt your analytics.

##The Rules
``` bash
<IfModule mod_rewrite.c>

# Enable Rewrite Engine
# ------------------------------
RewriteEngine On
RewriteBase /

# Redirect index.php Requests
# ------------------------------
RewriteCond %{THE_REQUEST} ^GET.*index\.php [NC]
RewriteCond %{THE_REQUEST} !/system/.*
RewriteRule (.*?)index\.php/*(.*) /$1$2 [R=301,L]

# Standard ExpressionEngine Rewrite
# ------------------------------
RewriteCond $1 !\.(css|js|gif|jpe?g|png) [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ /index.php/$1 [L]

</IfModule>
```

##The Story

A few weeks ago, while optimizing an ExpressionEngine installation, I was working to ensure that all invalid URLs either redirected to the appropriate URL, or returned a 404 error as necessary. During this process, I realized that URLs beginning with `index.php` still resolved, even though I thought I had removed `index.php` completely from URLs. I struggled for a few hours with various mod_rewrite rules in my `.htaccess` file but they all lead me into redirect loops. I ultimately settled on adding a `<link rel="canonical" href="..." />` tag to all pages and added a rule to my `robots.txt` file that would stop spiders from crawling the additional URLs.

Although duplicate content was no longer a concern, as search engines should no longer see the `index.php` URLs, the fact that they existed, and that a user could potentially find the duplicate URL, still bothered me. I could have redirected users using PHP, but in this instance it seemed like a bit of a hack, and I couldn't shake the feeling that there had to be a way to solve this with a mod_rewrite rule. I happened to be working through this issue on a thursday evening, so I decided to pop into the weekly [ExpressionEngine Help Chat](https://eescreencasts.campfirenow.com/room/177927) to see if anyone else had come across it.

I asked my question and received a number of responses confirming the issue, but not offering much in the way of a solution. I left the chat open and continued tinkering with my `.htaccess` file. After a while I decided to check back in on the EE Help Chat, and to my surprise, [Erick Reagan](http://twitter.com/erikreagan) and [Nevin Lyne](http://twitter.com/nevinlyne) had worked out a potential solution:

	RewriteCond %{THE_REQUEST} ^[^/]*/index\.php [NC]
	RewriteRule ^index\.php(.+) $1 [R=301,L]

I quickly modified my .htaccess file and sure enough, this new rule was able to catch URL requests beginning with index.php and issue a 301 redirect to the correct URL. The trick to circumventing the redirect loops I was encountering was using `%{THE_REQUEST}` to match the request string as opposed to the actual URL.

Thanks to Erik and Nevin my OCD has been suppressed, for now.

##The Update

In the comments, [Manuel](http://kevinthompson.info/blog/completely-remove-index-php-from-expressionengine-urls/#comment-15) pointed out the fact that the rules suggested by Erik and Nevin would break any `POST` request sent to an `index.php` URL. To resolve this, he suggested adding the following condition to the rewrite (which has already been included in the example above) that would restrict it to only `GET` requests:

	RewriteCond %{THE_REQUEST} ^GET