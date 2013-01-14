---
title: Testing An OAuth API Using cURL
---

I'm in the process of updating the API documentation over at [Planning Center Online](http://get.planningcenteronline.com) and I wanted to be sure that the sample JSON I was providing our users in the documentation matched the actual JSON returned. I didn't want to create an entire sample OAuth app to test this, so I did a little research into how I might test OAuth requests using cURL.

It turns our theres a nice OAuth Proxy server written by Seth Fitzsimmons called, surprisingly, [OAuth Proxy](https://github.com/mojodna/oauth-proxy).

To get started, you need to first install OAuth Proxy, preferrably using a package manager such as [pip](http://pypi.python.org/pypi/pip) using the following command:

``` bash
pip install oauth-proxy
```

Once you've got OAuth Proxy installed, you can run it in a terminal session using:

``` bash
oauth-proxy --consumer-key <consumer key> --consumer-secret <consumer secret>
```

While this was a great start, it still didn't get me where I wanted to be. For starters, I not only needed to create a consumer application to use our API, I also needed a user with a token and token secret so that my cURL requests were sent as an authenticated user. This meant that I needed also pass the `--token` and `--token-secret` parameters as well. 

Since I didn't yet have a token or token secret yet for my development users, I dove into the development database for our Rails application and added a record to our `oauth_tokens` table for a seeded user with simlpiefied values such as 'foo' and 'bar'. With values seeded in my database for the client application and oauth token, I was then able to invoke the OAuth Proxy with a command such as:

``` bash
oauth-proxy --consumer-key foo --consumer-secret bar --token foo --token-secret bar
```

Easy to remember, or better yet, create an alias for. With the OAuth Proxy running, I can then begin issuing curl requests to API enpoints:

``` bash
curl -x localhost:8001 localhost:3000/users.json
```

My next step is going to be to add the client application and oauth token records the seed for our Rails apps so that any developer can fire up OAuth Proxy using a simplified, common set of credentials, and begin firing off cURL requests to our API.

----------

Another library that I'd like to recommend with setup would be [HTTPie](https://github.com/jkbr/httpie). HTTPie simplifies cURLs CLI letting you easily specify HTTP verbs and post data. With HTTPie, the cURL request above would be written as:

``` bash
http --proxy=http:localhost:8001 localhost:3000/users.json
```

I strongly recommend you take a look at HTTPie if you use command line cURL at all.