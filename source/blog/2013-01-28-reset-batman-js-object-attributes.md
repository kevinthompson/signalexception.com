---
title: Reset Batman.js Object Attributes
---

Today I was trying to find a way to reset the attributes of an object in [Batman.js](http://batmanjs.org) if, for example, the object was being edited in a model window and the user clicked a "cancel" button.

Since Batman.js already stores the modified keys and their original values in a hash accessible through the `dirtyKeys` method, I simply needed to iterate over that hash, setting each key equal to its original value:

``` coffeescript
class App.Model extends Batman.Model
  # ...
  reset: ->
    @get('dirtyKeys').forEach (key, val) => @set(key,val)
```

This method works great for resetting a single object, but I quickly realized that I often edit related objects within the same modal as their parent (an example being multiple email address objects belonging to a person object). To expand the reset functionality, I started looking into how I might crawl the tree of relationships for a given model.

After a bit of tinkering, [Jeff Berg](https://twitter.com/theberg) and I eventually came up with the following solution:

``` coffeescript
class App.Model extends Batman.Model
  # ...
  reset: ->
    @get('dirtyKeys').forEach (key, val) => @set(key,val)
    associations = @constructor._batman.associations
    associations.forEach (associationName) =>
      association = associations.get(associationName)
      if association instanceof Batman.HasManyAssociation
        className = association.options.name
        relatedModel = Batman.currentApp?[className]
        objects = relatedModel.get('loaded').indexedBy(association.foreignKey).get(@get('id'))
        objects.forEach (object) => object.reset()
```

The additional block of code here starts by grabbing all associations on the object, then iterating over them looking for any `HasManyAssociation`. For each relevant association found, we then get all loaded objects for that association's model (as to avoid loading objects that have not yet been retrieved or modified) and reset those child objects as well.

Once our reset method is in place, we simply need to call the method on a loaded object:

``` coffeescript
person = App.Person.find(1)
person.get('name')              #=> 'Sterling Archer'
person.set('name', 'Dutchess')  #=> 'Dutchess'
person.get('name')              #=> 'Dutchess'
person.reset()
person.get('name')              #=> 'Sterling Archer'
```