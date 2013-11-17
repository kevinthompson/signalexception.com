require 'rubygems'
require 'rack'
require 'middleman/rack'
require 'rack/rewrite'
require 'rack/contrib/try_static'

# Redirects
use ::Rack::Rewrite do
  r301 %r{^\/blog\/iphone-and-ipad-browser-testing-using-the-ios-simulator\/?$}, '/blog/2011/07/24/iphone-and-ipad-browser-testing-using-the-ios-simulator.html'
  r301 %r{^\/blog\/completely-remove-index-php-from-expressionengine-urls\/?$}, '/blog/2011/03/04/completely-remove-index-php-from-expressionengine-urls.html'
  r301 %r{^\/blog\/securing-your-staging-environment\/?$}, '/blog/2011/03/09/securing-your-staging-environment.html'
  r301 %r{^\/blog\/hiding-javascript-dependent-content\/?$}, '/blog/2011/07/15/hiding-javascript-dependent-content.html'
  r301 %r{^\/blog\/using-placeholder-images-for-lightning-fast-wireframes-and-mockups\/?$}, '/blog/2011/03/10/placeholder-image-services.html'
  r301 %r{^\/blog\/placeholder-image-services\/?$}, '/blog/2011/03/10/placeholder-image-services.html'
  r301 %r{^\/blog\/start-required-processes-on-pow-application-boot\/?$}, '/blog/2012/04/29/start-required-processes-on-pow-application-boot.html'
  r301 %r{^\/blog\/introduction\/?$}, '/blog/2011/03/01/init.html'
  r301 %r{^\/blog(\/\d+){0,3}\/?$}, '/'
end

use Rack::Head
use Rack::TryStatic, root: 'tmp', urls: %w[/], try: ['.html', 'index.html', '/index.html']
run Rack::NotFound.new 'tmp/404.html'
