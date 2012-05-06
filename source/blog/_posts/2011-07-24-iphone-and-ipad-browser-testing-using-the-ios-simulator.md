---
layout: post
title: iPhone & iPad Browser Testing Using the iOS Simulator
---
On more than one occasion I've had clients, as well as fellow designers and developers, ask me to assist them in building a mobile (or iPhone specific) version of their website, following their request immediately with something like, "You do have an iPhone, right?"

<!-- more -->

I do happen to have an iPhone (although no iPad), but I rarely need to pick it up when developing and testing websites for iOS devices. Instead, I use the iOS Simulator.

<div class="img"><img src="/images/blog/ios-browser-testing.jpg" /></div>

## Why Should You Use iOS Simulator?
Beyond simply being able to test websites on Mobile Safari without having a physical device, iOS Simulator has a few other advantages.

* **Local Development Sites** – Using the iOS simulator, you can easily access development sites on your local machine that might otherwise be difficult to do so.
* **Physical Keyboard** – Instead of pecking away at on onscreen keyboard, you can save yourself a bit of time using the real thing.
* **Multiple Environments** – Easily test iPhones and iPads of varying screen resolutions in both possible orientations.

## Getting Started
Getting up and running with the iOS Simulator is extremely simple and really takes just two quick steps:

1. [Install Xcode](https://developer.apple.com/xcode/)
2. Open Xcode, then click Preferences > Downloads, and install the iOS Simulator
3. Launch iOS Simulator

Once Xcode is in stalled, The iOS Simulator can be found at `/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone Simulator.app`

The iOS Simulator can also be found and launched through Spotlight,  `⌘ + space`, but it may take time for Spotlight to index the new files. If you're using an application launcher such [Alfred](http://alfredapp.com), you might need to add `/Developer` to the [applications scope](http://help.alfredapp.com/indexing/).

After opening the iOS Simulator, simply launch Mobile Safari and direct the browser to your website of choice.

## Tips
* Using the `⌘ + ←` and `⌘ + →` hotkeys you can quickly change the orientation of the iOS device.
* You can assign hotkeys to various iOS devices using the Keyboard  Shortcuts panel of the Keyboard Preferences pane in System Preferences (see [http://support.apple.com/kb/ht2490#l4](http://support.apple.com/kb/ht2490#l4))
* Script debugging can be enabled for Mobile Safari through the iOS Settings app under the Safari tab.