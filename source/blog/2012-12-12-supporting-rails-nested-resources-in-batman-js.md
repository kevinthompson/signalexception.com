---
title: Supporting Rails Nested Resources in Batman.js
---

I've recently begun working with [Batman.js](http://batmanjs.org), and while it goes a long way to be very Rails-like, there are a few instances which aren't yet accounted for. Once such instance is returning nested resources.

In Rails, when you'd like to persist the attributes for a nested resource through a form generated for its parent object, you simply need to use the `accepts_nested_attributes_for` class method to prepare the child relationship, then use a `fields_for` block in your form for your nested resource object(s) that will automatically append `_attributes` to the field names.

It's slightly more difficult to do the same in Batman.js because Batman  preserves the structure of the JSON originally returned from your application. This means that if your application returns an object such as the following for a store entry, and your application's store model accepts nested attributes for products, when the products are posted back it would expected the `products` key to be `products_attributes`.

``` javascript
{
  id: 14352
  title: 'Store Name'
  Products: [
    {
      title: 'Sterling Malory Archer Autographed Photo'
      price: 199.99
    }
  ]
}
```

Because Batman.js has no way of knowing what nested resources a model accepts nested attributes for, we need to add that functionality ourselves. This particular solution involves extending two core Batman.js classes, then adding a single method call to our Batman models which accept nested attributes.

## Solution

We first need to extend `Batman.Model` in order to create an array to store the keys for which nested resource attributes are accepted. In this file we also define a persistence class which I provide more detail about below.

``` coffeescript
class App.Model extends Batman.Model

  @persist App.Storage

  @encodeAttributesForKeys: []
  @encodeAttributesFor: ->
    for key in arguments
      if typeof key == 'string'
        @encodeAttributesForKeys.splice(index,1) if (index = @encodeAttributesForKeys.indexOf(key)) > 0
        @encodeAttributesForKeys.push key
```

Once we have a way to store the nested resource keys, we need a way to act on them. For this we'll tap into Batman's storage class callbacks. More specifically, we will add a before create and update call back that appends `_attributes` to each of the previously defined keys in our JSON output.

``` coffeescript
class App.Storage extends Batman.RailsStorage

  @::before 'create', 'update', (env, next) ->
    data = env.options.data
    if namespace = @recordJsonNamespace(env.subject)
      obj = data[namespace]
    else
      obj = data

    if env.subject.constructor.encodeAttributesForKeys?
      for key in env.subject.constructor.encodeAttributesForKeys
        if obj[key]
          obj["#{key}_attributes"] = obj[key]
          delete obj[key]
    next()
```

With the key array and storage mechanisms in place, the final step is to simply define which fields the `_attributes` suffix should be applied to.

``` coffeescript
class App.Store extends App.Model

  @hasMany 'products'
  @encodeAttributesFor 'products'
```
