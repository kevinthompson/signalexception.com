---
title: SASS Border Shorthand Mixin
---

A few months ago, [Dylan Hudson](https://twitter.com/dyln_hdsn) and myself realized that we were frequently needing to define multiple border values when styling various buttons and container modules in our web applications. To simplify the process of specifying multiple borders, we came up with the following mixin.

``` sass
// Border Shorthand
// -------------------------
=border($border: false, $border_horizontal: false, $border_bottom: false, $border_left: false)
  $args: length($border)

  // Reset Variables Based on Argument Count
  @if $args > 1 and length(nth($border,1)) > 1 or nth($border,1) == none

    @if $args == 4
      $border_left: nth($border, 4)
      $border_bottom: nth($border, 3)
      $border_horizontal: nth($border, 2)
      $border: nth($border, 1)
    @else if $args == 3
      $border_bottom: nth($border, 3)
      $border_horizontal: nth($border, 2)
      $border: nth($border, 1)
    @else if $args == 2
      $border_horizontal: nth($border, 2)
      $border: nth($border, 1)

  // Assign Attributes from Variables
  @if $border and $border_horizontal and $border_bottom and $border_left
    border-top: $border
    border-right: $border_horizontal
    border-bottom: $border_bottom
    border-left: $border_left
  @else if $border and $border_horizontal and $border_bottom
    border: $border_horizontal
    border-top: $border
    border-bottom: $border_bottom
  @else if $border and $border_horizontal
    border: $border
    border-right: $border_horizontal
    border-left: $border_horizontal
  @else
    border: $border
```

This mixin allows you to define multiple, unique borders in a single line. It follows the same convention as other shorthand methods such as margin and padding, accepting one to four parameters in the order: top, right, bottom, left.

## Examples

``` sass
// This SASS ...
.container
  +border(1px solid #fefefe, 1px solid #ccc, 1px solid #1d1d1d)

// Would produce this CSS:
.container {
  border: 1px solid #ccc
  border-top: 1px solid #fefefe
  border-bottom: 1px solid #1d1d1d
}
```

``` sass
// This SASS ...
.container
  +border(1px dashed red, 2px solid chartreuse)

// Would produce this CSS:
.container {
  border: 1px solid red
  border-right: 2px solid chartreuse
  border-left: 2px solid chartreuse
}
```