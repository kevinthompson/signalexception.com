---
title: Passing Arbitrary Route Parameters to Controller Actions in Batman.js
---

This morning I was trying find a way to use the same controller action to create an object with one of two different types. For the same of simplicity, let's say I'm creating list items through a controller named `ListItemsController` and my list items can either be an "item" or a "heading". 

In my interface I had two different links, "Add New List Item" and "Add New List Heading", and wanted to handle both type instances using the `ListItemsController#new` action, so I needed a way to pass the "type" attribute through my route.

It turns out Batman.js allows you to pass a hash of parameters to your routes, which can include arbitrary key value pairs, in addition to the common route attributes such as "controller" and "action". In my case, this meant adding a `@collection` route definintion for "heading", then passing it a hash including the action that I wanted the route to point to, and my "type" attribue.

``` coffeescript
@resources 'list_items' ->
  @collection 'heading', { action: 'new', type: 'heading' }
```

Once the additional route was defined, I was able to create my two list item creation links using the following route syntax:

``` html
<a data-route="routes.listItems.new">Add New List Item</a>
<a data-route="routes.listItems.heading">Add New List Heading</a>
```