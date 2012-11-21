---
title: Hiding JavaScript-Dependent Content
---

When implementing various JavaScript-dependent solutions such as image sliders and accordions, its easy to start throwing around `display:none;` attributes in your CSS to avoid seeing a flash of content before it's removed by your JavaScript, but there's another way to achieve the same result without alienating users that may have JavaScript disabled.

In order to ensure that your content remains visible when users happen to encounter it with JavaScript disabled, avoid hiding elements with CSS alone. Instead, apply a simple class to your `<html>` tag early during page rendering, then prefix JavaScript-dependent CSS with that class.

## Example

### HTML
``` html
<!DOCTYPE html>
<html>
<head>
<title>Hiding JavaScript-Dependent Content</title>
<script type="text/javascript">
var html = document.getElementsByTagName('html')[0];
html.className = (html.className != '' ? html.className + ' ' : '') + 'js';
</script>
</head>
```

### CSS
``` css
.js .slide { display:none; }
.js .slide:first-child { display:block; }
```

By using this method, you've first verified that JavaScript is enabled before hiding content that your user may otherwise be deprived of.