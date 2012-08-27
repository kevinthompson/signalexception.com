---
layout: post
title: Placeholder Image Services
---
From time to time, I find myself needing to create a quick HTML document to exemplify a concept, or to explore and alternative layouts in an existing project. When these quick and dirty prototypes need to include some form of imagery, I turn to one of my favorite placeholder image services.

<!-- more -->

Depending on the type of page I'm creating (wireframe, mockup, whimsical tomfoolery), I typically choose from one of three services.

## Placehold.it

[Placehold.it](http://placehold.it) is a simple, yet versatile, solution that I often use when creating wireframes. When wireframing, I typically do not want to portray any particular visual aesthetic, so the bare, monochromatic images from Placehold.it are ideal.

These images can be passed as little as the image width, or as much as the width, height, format, color, and text:
	
	<img src="http://placehold.it/300" />
	<img src="http://placehold.it/400x200.png" />
	<img src="http://placehold.it/200/09f/&text=Ad Unit" />
	<img src="http://placehold.it/600x100/09f/fff.png&text=Big Blue Image!" />

<div class="img"><img src="http://placehold.it/600x100/09f/fff.png&text=Big Blue Image!" alt="Placehold.it Example" /></div>

## FlickHoldr.com

When I need images with a bit more substance, such as when I'm mocking up a new layout for an existing site, I'll often use [FlickHoldr.com](http://flickholdr.com), which can pull images based on a set of tags from [Flickr](http://flickr.com), to find images that suit the project. 

FlickHoldr.com requires you send at least the width an height parameters of your image, but unlike Placehold.it, you can also specify tags, whether or not an image is black and white, and also an offset, which allows you to pull different images for the same size and tags:

	<img src="http://flickholdr.com/300/300/" />
	<img src="http://flickholdr.com/300/300/2/" />
	<img src="http://flickholdr.com/200/300/sea,sun/1/" />
	<img src="http://flickholdr.com/400/200/kenny meyers,fetish/2/" />

<div class="img"><img src="http://flickholdr.com/400/200/abstract,object/2/" /></div>

## Placekitten.com

Of the three, [Placekitten.com](http://placekitten.com) tends to get the least use, but there's still that rare occasion where you just need pictures of kittens. Placekitten.com doesn't accept many parameters, in fact all they accept is width, height, and an option for black and white images:

	<img src="http://placekitten.com/300/" />
	<img src="http://placekitten.com/300/100" />
	<img src="http://placekitten.com/g/600/100" />
	
<div class="img"><img src="http://placekitten.com/g/600/100" /></div>

----------

All three of these are great services that can help expedite your workflow, and while I've given you a few examples here, I'd recommend clicking through to each of them and reviewing their options. Figure out what works for you and have fun. If you know of any other placeholder image services, let me know in comments below!