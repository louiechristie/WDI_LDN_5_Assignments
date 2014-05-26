Snippet.delete_all unless ENV['APPEND']

if ENV['SOLUTION']

  Snippet.create!([
    {title: "Variables", haml_input: "%h1 Main Heading\r\n%h2 Sub-Heading", scss_input: "$font-stack: Helvetica, sans-serif;\r\n$main-color: #f35;\r\n\r\nh1 {\r\n  font: 16px $font-stack;\r\n  color: $main-color;\r\n}\r\n\r\nh2 {\r\n  font: 12px $font-stack;\r\n  color: $main-color;\r\n}", description: "Think of variables as a way to store information that you want to reuse throughout your stylesheet. You can store things like colors, font stacks, or any CSS value you think you'll want to reuse. SCSS uses the `$` symbol to make something a variable."},
    {title: "Nesting", haml_input: "%nav\r\n  %a(href=\"#\")\r\n    %h1 Awesome Shop\r\n  %ul\r\n    %li\r\n      %a(href=\"#\") Products\r\n      \\|\r\n    %li\r\n      %a(href=\"#\") Stores\r\n      \\|\r\n    %li\r\n      %a(href=\"#\") Contact\r\n%section\r\n  %h3 Top Products\r\n  %ul\r\n    %li\r\n      %a(href=\"#\") MacBook Pro\r\n    %li\r\n      %a(href=\"#\") Kindle Fire\r\n    %li\r\n      %a(href=\"#\") Wool (Silo Trilogy 1)", scss_input: "nav {\r\n  \r\n  background-color: lightgrey;\r\n  \r\n  h1 {display: inline-block;}\r\n  \r\n  ul {\r\n    display: inline-block;\r\n    margin: 0;\r\n    padding: 0;\r\n    list-style: none;\r\n    \r\n    li {\r\n      display: inline-block;\r\n   \t}\r\n  }\r\n\r\n  a {\r\n    display: inline-block;\r\n    padding: 6px 12px;\r\n    text-decoration: none;\r\n  }\r\n}\r\n\r\nsection {\r\n\tpadding: 10px; \r\n}", description: "When you write HTML you've probably noticed that it has a fairly clear nested, visual hierarchy. CSS, on the other hand, doesn't. Sass will let you nest your CSS selectors in a way that **follows the same visual hierarchy of your HTML**.\r\n\r\nThe SCSS:\r\n\r\n```scss\r\n.foo {\r\n\t.bar {color: red;}\r\n}\r\n```\r\n\r\nGives the CSS:\r\n\r\n```css\r\n.foo .bar {color: red;}\r\n```"},
    {title: "Parent referencing with &<some-selector>", haml_input: "%ul\r\n\t%li item 1\r\n\t%li item 2\r\n\t%li item 3\r\n\t%li item 4\r\n\t%li item 5", scss_input: "ul {\r\n\tli {\r\n  \tfont-weight: bold;\r\n  \t&:nth-child(odd) {color: red};\r\n\t\t&:nth-child(even) {color: green;}\r\n    &:last-child {color: magenta;} \r\n } \r\n}", description: "The `&` operator is used to refer to the parent selector when nesting. We can use it to specify more specific cases affecting a given selector.\r\n\r\nThe SCSS:\r\n\r\n```scss\r\n.foo {\r\n\tpadding: 10px;\r\n\t&.bar {color: red;}\r\n}\r\n```\r\n\r\ngenerates the CSS:\r\n\r\n```css\r\n.foo {\r\n\tpadding: 10px;\r\n}\r\n\r\n.foo .bar {\r\n\tcolor: red;\r\n}\r\n```\r\n\r\nThis can make for _much_ more readable styling, as it is possible to keep all the styling for a selector, e.g. `.foo`, in one place."},
    {title: "Parent referencing with <some-selector> &", haml_input: ".notice\r\n\t.msg all is well\r\n  \r\n.alert\r\n\t.msg all is NOT well\r\n  \r\n.warn\r\n\t.msg all is meh", scss_input: ".msg {\r\n\tfont-weight: bold;\r\n  border: 1px solid;\r\n  padding: 10px;\r\n  margin: 5px;\r\n  .notice & { color: green; border-color: green;}\r\n  .alert & { color: red; border-color: red;}\r\n  .warn & { color: orange; border-color: orange;}\r\n}", description: "We can use the `&` operator to specify how the parent selector should be styled differently when it is preceeded with different selectors.\r\n\r\nThe SCSS:\r\n\r\n```scss\r\n.baz {\r\n\tfont-size: 10px;\r\n\t.foo & {color: red;}\r\n\t.bar & {color: green;}\r\n}\r\n```\r\n\r\nGives the CSS:\r\n\r\n```css\r\n.baz {font-size: 10px;}\r\n.foo .baz {color: red;}\r\n.bar .baz {color: red;}\r\n```"},
    {title: "Inheriting styling with @extend", haml_input: ".notice all is well\r\n.alert all is NOT well\r\n.warn all is meh", scss_input: ".msg {\r\n\tfont-weight: bold;\r\n  border: 1px solid;\r\n  padding: 10px;\r\n  margin: 5px;\r\n}\r\n\r\n.notice {\r\n  @extend .msg;\r\n  color: green;\r\n  border-color: green;\r\n}\r\n\r\n.alert {\r\n  @extend .msg;\r\n  color: red;\r\n  border-color: red;\r\n}\r\n\r\n.warn {\r\n  @extend .msg;\r\n  color: orange;\r\n  border-color: orange;\r\n}", description: "`@extend` lets you share a set of CSS properties from one selector to another. It helps keep your SCSS nice and DRY.\r\n\r\nThe SCSS:\r\n\r\n```scss\r\n.foo {color: red;}\r\n.bar {\r\n\t@extend foo;\r\n\tfont-size: 10px;\r\n}\r\n```\r\n\r\nGives the CSS:\r\n\r\n```css\r\n.foo {color: red;}\r\n.bar {\r\n\tcolor: red;\r\n\tfont-size: 10px;\r\n}\r\n```"},
    {title: "Mixins", haml_input: "#box-A.box BOX A\r\n#box-B.box BOX B", scss_input: "@mixin rounded-corners($radius: 5px) {\r\n  -webkit-border-radius: $radius;\r\n     -moz-border-radius: $radius;\r\n      -ms-border-radius: $radius;\r\n          border-radius: $radius;\r\n}\r\n\r\n\r\n.box {\r\n\twidth: 100px;\r\n  height: 50px;\r\n  padding: 20px;\r\n  margin: 10px;\r\n}\r\n\r\n#box-A {\r\n\tbackground-color: red;\r\n  @include rounded-corners;\r\n}\r\n\r\n#box-B {\r\n\tbackground-color: green;\r\n  @include rounded-corners(20px);\r\n}", description: "Some things in CSS are a bit tedious to write, especially with CSS3 and the many vendor prefixes that exist. A mixin lets you make groups of CSS declarations that you want to reuse throughout your site. You can even pass in values to make your mixin more flexible. A good use of a mixin is for vendor prefixes.\r\n\r\nFor hundreds of useful mixins, consider using [Compass](http://compass-style.org/), which can be easily added to a rails project using the [compass-rails gem](https://github.com/Compass/compass-rails)."},
    {title: "Calculating Dimensions", haml_input: ".article-container\r\n  %article.clearfix\r\n    %h1 Dimension Mathematics with SCSS\r\n    .main-content\r\n      %section\r\n        %h2 SCSS Dimension Datatypes\r\n        %p SCSS can do maths with CSS datatypes, i.e.:\r\n        %ul\r\n          %li px\r\n          %li %\r\n          %li em\r\n          %li etc...\r\n      %section\r\n        %h2 Addition & Subtraction\r\n        %p we can add and subtract like this:\r\n        %pre\r\n          :preserve\r\n            $val-a: 2px + 2px; //=> 4px\r\n            $val-b: 50% - 20%; //=> 30%\r\n      %section\r\n        %h2 Multiplication & Division\r\n        %p we can multiply and divide like this:\r\n        %pre\r\n          :preserve\r\n            $val-a: 2px * 2; //=> 4px\r\n            $val-b: (50% / 2); //=> 25% - NOTE PARENTHESES!\r\n        %p we can cast un-typed results using multiplication too:\r\n        %pre\r\n          :preserve\r\n            $val-a: (100 + 200) * 1px; //=> 300px\r\n            $val-b: (1/3) * 100%; //=> 33.3333%\r\n    %asside.clearfix\r\n      %h2 Interactive SCSS\r\n      %p we can practice SCSS maths in an interactive REPL:\r\n      %pre\r\n        :preserve\r\n          > sass -i\r\n    %asside.clearfix\r\n      %h2 Care with division\r\n      %p Always surround division with parentheses:\r\n      %pre\r\n        :preserve\r\n          $good: (10px / 2); //=> 5px\r\n          $bad: 10px / 2; //=> 10px/2", scss_input: "// calculations\r\n\r\n$article-width: 700px;\r\n$default-padding: 10px;\r\n$main-content-width: 2/3 * $article-width;\r\n$asside-width: $article-width - $main-content-width - 2 * $default-padding;\r\n\r\n// styling\r\n\r\n.article-container {\r\n\tarticle {\r\n  \twidth: $article-width;\r\n    background-color: pink;\r\n    margin: auto;\r\n    padding: $default-padding;\r\n    .main-content {\r\n      width: $main-content-width;\r\n      float: left;\r\n      background-color: white;\r\n      section {\r\n        padding: $default-padding;\r\n      }\r\n    }\r\n    asside {\r\n      width: $asside-width;\r\n      background-color: lightgreen;\r\n      float: right;\r\n      padding: $default-padding;\r\n    }\r\n\t}\r\n}", description: "we can calculate dimensions rather than hard-coding them."},
    {title: "Darken and Lighten", haml_input: "#original.box Original\r\n#darker.box Darker\r\n#lighter.box Lighter", scss_input: "$base-color: #AD141E;\r\n$dark-color: darken( $base-color, 20% );\r\n$light-color: lighten( $base-color, 20% );\r\n\r\n.box {\r\n\twidth: 33.33333%;\r\n  float: left;\r\n  padding: 10px;\r\n  color: black;\r\n}\r\n\r\n#original {\r\n\tbackground-color: $base-color;\r\n}\r\n\r\n#darker {\r\n\tbackground-color: $dark-color;\r\n}\r\n\r\n#lighter {\r\n\tbackground-color: $light-color;\r\n}", description: ""},
    {title: "Saturate and Desaturate", haml_input: "#original.box Original\r\n#saturated.box Saturated\r\n#desaturated.box Desaturated", scss_input: "$base-color: #AD141E;\r\n$saturated-color: saturate( $base-color, 30% );\r\n$desaturated-color: desaturate( $base-color, 30% );\r\n\r\n.box {\r\n\twidth: 33.33333%;\r\n  float: left;\r\n  padding: 10px;\r\n  color: black;\r\n}\r\n\r\n#original {\r\n\tbackground-color: $base-color;\r\n}\r\n\r\n#saturated {\r\n\tbackground-color: $saturated-color;\r\n}\r\n\r\n#desaturated {\r\n\tbackground-color: $desaturated-color;\r\n}", description: ""},
    {title: "Transparency with RGBA", haml_input: ".box Hello World!", scss_input: "$base-color: red;\r\n$semi-transparent-red: rgba( $base-color, .5 );\r\n  \r\n.box {\r\n  padding: 20px;\r\n  color: $base-color;\r\n  background-color: $semi-transparent-red;\r\n}", description: "CSS3 added the ability to specify the opacity of a color. More specifically, in addition to specifying colors with `rgb()`, you can now also use `rgba()`. The \"a\" in `rgba` stands for \"alpha\".\r\n\r\nSCSS has native support for `rgba`:\r\n\r\n```scss\r\n$base-color = red;\r\n$semi-transparent-red: rgba( $base-color, .7 )\r\n```\r\n\r\n"},
    {title: "Adjust-Hue", haml_input: "#anti-clockwise.box Anti-Clockwise\r\n#original.box Original\r\n#clockwise.box Clockwise", scss_input: "$base-color: #AD141E;\r\n$clockwise-color: adjust-hue( $base-color, 90deg );\r\n$anti-clockwise-color: adjust-hue( $base-color, -90deg );\r\n\r\n.box {\r\n\twidth: 33.33333%;\r\n  float: left;\r\n  padding: 10px;\r\n  color: black;\r\n}\r\n\r\n#original {\r\n\tbackground-color: $base-color;\r\n}\r\n\r\n#clockwise {\r\n\tbackground-color: $clockwise-color;\r\n}\r\n\r\n#anti-clockwise {\r\n\tbackground-color: $anti-clockwise-color;\r\n}", description: "rotate around the color-wheel by a given number of degrees:\r\n\r\n![Color Wheel](http://www.chainstyle.com/tutorials/images/colorscheme_wheel-hue.jpg)\r\n\r\nSee [docs](http://sass-lang.com/documentation/Sass/Script/Functions.html) for this and other color functions."},
    {title: "Complement", haml_input: "#box-1.box Base Color 1\r\n#box-2.box Comp Color 1\r\n#box-3.box Base Color 2\r\n#box-4.box Comp Color 1\r\n", scss_input: "$base-color-1: #AD141E;\r\n$base-color-2: #6556F7;\r\n$comp-color-1: complement( $base-color-1 );\r\n$comp-color-2: complement( $base-color-2 );\r\n\r\n.box {\r\n\twidth: 50%;\r\n  float: left;\r\n  padding: 10px;\r\n  color: black;\r\n}\r\n\r\n#box-1 {\r\n\tbackground-color: $base-color-1;\r\n}\r\n\r\n#box-2 {\r\n\tbackground-color: $comp-color-1;\r\n}\r\n\r\n#box-3 {\r\n\tbackground-color: $base-color-2;\r\n}\r\n\r\n#box-4 {\r\n\tbackground-color: $comp-color-2;\r\n}", description: "SCSS can help us find the `complement` of a color, i.e., the opposite color on the color wheel:\r\n\r\n![Color Wheel](http://www.chainstyle.com/tutorials/images/colorscheme_comp.jpg)\r\n\r\nSee [docs](http://sass-lang.com/documentation/Sass/Script/Functions.html) for this and other color functions."},
    {title: "Modularity through partials and @import", haml_input: "", scss_input: "", description: "SCSS has a mechanism that lets us break large projects up into smaller files.\r\n\r\n### CSS @import vs. SCSS @import\r\n\r\nPlain old CSS has an `@import` directive that lets you split your CSS into smaller, more maintainable files. The only drawback is that each time you use `@import` in CSS it creates another HTTP request.\r\n\r\nSCSS improves upon this by embeddeding imported CSS on the server side, in much the same way that rails views embed partials.\r\n\r\n### Problems with the rails asset pipeline \r\n\r\nThe rails asset pipeline provides an alternative way to break up our SCSS files, but we can run into problems if we are using SCSS variables and mixins.\r\n\r\nThe problem is that every SCSS file included in the manifest (in `application.css`) is compiled separately into a CSS file before the files are combined, so variables and mixins aren’t shared between files.\r\n\r\nThis can lead to SCSS compilation errors about missing variables and mixins.\r\n\r\n### Fixing application.css\r\n\r\nTo get this working we need to:\r\n\r\n* rename `application.css` to `application.css.scss`\r\n* remove `require_tree .`\r\n* add `@import` directives for each file we need\r\n\r\nFor example, the app you are reading this on has the following `application.css.scss` file:\r\n\r\n```scss\r\n/*\r\n * This is a manifest file that'll be compiled into application.css, which will include all the files\r\n * listed below.\r\n *\r\n * Any CSS and SCSS file within this directory, lib/assets/stylesheets, vendor/assets/stylesheets,\r\n * or vendor/assets/stylesheets of plugins, if any, can be referenced here using a relative path.\r\n *\r\n * You're free to add application-wide styles to this file and they'll appear at the top of the\r\n * compiled file, but it's generally better to create a new file per style scope.\r\n *\r\n *= require codemirror\r\n *= require codemirror/themes/night\r\n *= require_self\r\n */\r\n\r\n@import \"params.css.scss\";\r\n@import \"mixins.css.scss\";\r\n@import \"site_wide.css.scss\";\r\n@import \"snippets.css.scss\";\r\n```"},
    {title: "if, @if, @for, @each and @while", haml_input: "", scss_input: "", description: "SCSS supports basic control directives and expressions for including styles only under some conditions or including the same style several times with variations.\r\n\r\n**Note: Control directives are an advanced feature, and are uncommon in day-to-day styling. They exist mainly for use in mixins, particularly those that are part of libraries like [Compass](http://compass-style.org/).**\r\n\r\nSee the [docs](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#control_directives__expressions) for more details."}
  ])

else

  Snippet.create!([
    {title: "Variables", haml_input: "%h1 Main Heading\r\n%h2 Sub-Heading", scss_input: "h1 {\r\n  font: 16px Helvetica, sans-serif;\r\n  color: #ff3355; }\r\n\r\nh2 {\r\n  font: 12px Helvetica, sans-serif;\r\n  color: #ff3355; }", description: "Think of variables as a way to store information that you want to reuse throughout your stylesheet. You can store things like colors, font stacks, or any CSS value you think you'll want to reuse. SCSS uses the `$` symbol to make something a variable."},
    {title: "Nesting", haml_input: "%nav\r\n  %a(href=\"#\")\r\n    %h1 Awesome Shop\r\n  %ul\r\n    %li\r\n      %a(href=\"#\") Products\r\n      \\|\r\n    %li\r\n      %a(href=\"#\") Stores\r\n      \\|\r\n    %li\r\n      %a(href=\"#\") Contact\r\n%section\r\n  %h3 Top Products\r\n  %ul\r\n    %li\r\n      %a(href=\"#\") MacBook Pro\r\n    %li\r\n      %a(href=\"#\") Kindle Fire\r\n    %li\r\n      %a(href=\"#\") Wool (Silo Trilogy 1)", scss_input: "nav {\r\n  background-color: lightgrey; }\r\n  nav h1 {\r\n    display: inline-block; }\r\n  nav ul {\r\n    display: inline-block;\r\n    margin: 0;\r\n    padding: 0;\r\n    list-style: none; }\r\n    nav ul li {\r\n      display: inline-block; }\r\n  nav a {\r\n    display: inline-block;\r\n    padding: 6px 12px;\r\n    text-decoration: none; }\r\n\r\nsection {\r\n  padding: 10px; }", description: "When you write HTML you've probably noticed that it has a fairly clear nested, visual hierarchy. CSS, on the other hand, doesn't. Sass will let you nest your CSS selectors in a way that **follows the same visual hierarchy of your HTML**.\r\n\r\nThe SCSS:\r\n\r\n```scss\r\n.foo {\r\n\t.bar {color: red;}\r\n}\r\n```\r\n\r\nGives the CSS:\r\n\r\n```css\r\n.foo .bar {color: red;}\r\n```"},
    {title: "Parent referencing with &<some-selector>", haml_input: "%ul\r\n\t%li item 1\r\n\t%li item 2\r\n\t%li item 3\r\n\t%li item 4\r\n\t%li item 5", scss_input: "ul li {\r\n  font-weight: bold; }\r\n  ul li:nth-child(odd) {\r\n    color: red; }\r\n  ul li:nth-child(even) {\r\n    color: green; }\r\n  ul li:last-child {\r\n    color: magenta; }", description: "The `&` operator is used to refer to the parent selector when nesting. We can use it to specify more specific cases affecting a given selector.\r\n\r\nThe SCSS:\r\n\r\n```scss\r\n.foo {\r\n\tpadding: 10px;\r\n\t&.bar {color: red;}\r\n}\r\n```\r\n\r\ngenerates the CSS:\r\n\r\n```css\r\n.foo {\r\n\tpadding: 10px;\r\n}\r\n\r\n.foo .bar {\r\n\tcolor: red;\r\n}\r\n```\r\n\r\nThis can make for _much_ more readable styling, as it is possible to keep all the styling for a selector, e.g. `.foo`, in one place."},
    {title: "Parent referencing with <some-selector> &", haml_input: ".notice\r\n\t.msg all is well\r\n  \r\n.alert\r\n\t.msg all is NOT well\r\n  \r\n.warn\r\n\t.msg all is meh", scss_input: ".msg {\r\n  font-weight: bold;\r\n  border: 1px solid;\r\n  padding: 10px;\r\n  margin: 5px; }\r\n  .notice .msg {\r\n    color: green;\r\n    border-color: green; }\r\n  .alert .msg {\r\n    color: red;\r\n    border-color: red; }\r\n  .warn .msg {\r\n    color: orange;\r\n    border-color: orange; }", description: "We can use the `&` operator to specify how the parent selector should be styled differently when it is preceeded with different selectors.\r\n\r\nThe SCSS:\r\n\r\n```scss\r\n.baz {\r\n\tfont-size: 10px;\r\n\t.foo & {color: red;}\r\n\t.bar & {color: green;}\r\n}\r\n```\r\n\r\nGives the CSS:\r\n\r\n```css\r\n.baz {font-size: 10px;}\r\n.foo .baz {color: red;}\r\n.bar .baz {color: red;}\r\n```"},
    {title: "Inheriting styling with @extend", haml_input: ".notice all is well\r\n.alert all is NOT well\r\n.warn all is meh", scss_input: ".msg, .notice, .alert, .warn {\r\n  font-weight: bold;\r\n  border: 1px solid;\r\n  padding: 10px;\r\n  margin: 5px; }\r\n\r\n.notice {\r\n  color: green;\r\n  border-color: green; }\r\n\r\n.alert {\r\n  color: red;\r\n  border-color: red; }\r\n\r\n.warn {\r\n  color: orange;\r\n  border-color: orange; }", description: "`@extend` lets you share a set of CSS properties from one selector to another. It helps keep your SCSS nice and DRY.\r\n\r\nThe SCSS:\r\n\r\n```scss\r\n.foo {color: red;}\r\n.bar {\r\n\t@extend foo;\r\n\tfont-size: 10px;\r\n}\r\n```\r\n\r\nGives the CSS:\r\n\r\n```css\r\n.foo {color: red;}\r\n.bar {\r\n\tcolor: red;\r\n\tfont-size: 10px;\r\n}\r\n```"},
    {title: "Mixins", haml_input: "#box-A.box BOX A\r\n#box-B.box BOX B", scss_input: ".box {\r\n  width: 100px;\r\n  height: 50px;\r\n  padding: 20px;\r\n  margin: 10px; }\r\n\r\n#box-A {\r\n  background-color: red;\r\n  -webkit-border-radius: 5px;\r\n  -moz-border-radius: 5px;\r\n  -ms-border-radius: 5px;\r\n  border-radius: 5px; }\r\n\r\n#box-B {\r\n  background-color: green;\r\n  -webkit-border-radius: 20px;\r\n  -moz-border-radius: 20px;\r\n  -ms-border-radius: 20px;\r\n  border-radius: 20px; }", description: "Some things in CSS are a bit tedious to write, especially with CSS3 and the many vendor prefixes that exist. A mixin lets you make groups of CSS declarations that you want to reuse throughout your site. You can even pass in values to make your mixin more flexible. A good use of a mixin is for vendor prefixes.\r\n\r\nFor hundreds of useful mixins, consider using [Compass](http://compass-style.org/), which can be easily added to a rails project using the [compass-rails gem](https://github.com/Compass/compass-rails)."},
    {title: "Calculating Dimensions", haml_input: ".article-container\r\n  %article.clearfix\r\n    %h1 Dimension Mathematics with SCSS\r\n    .main-content\r\n      %section\r\n        %h2 SCSS Dimension Datatypes\r\n        %p SCSS can do maths with CSS datatypes, i.e.:\r\n        %ul\r\n          %li px\r\n          %li %\r\n          %li em\r\n          %li etc...\r\n      %section\r\n        %h2 Addition & Subtraction\r\n        %p we can add and subtract like this:\r\n        %pre\r\n          :preserve\r\n            $val-a: 2px + 2px; //=> 4px\r\n            $val-b: 50% - 20%; //=> 30%\r\n      %section\r\n        %h2 Multiplication & Division\r\n        %p we can multiply and divide like this:\r\n        %pre\r\n          :preserve\r\n            $val-a: 2px * 2; //=> 4px\r\n            $val-b: (50% / 2); //=> 25% - NOTE PARENTHESES!\r\n        %p we can cast un-typed results using multiplication too:\r\n        %pre\r\n          :preserve\r\n            $val-a: (100 + 200) * 1px; //=> 300px\r\n            $val-b: (1/3) * 100%; //=> 33.3333%\r\n    %asside.clearfix\r\n      %h2 Interactive SCSS\r\n      %p we can practice SCSS maths in an interactive REPL:\r\n      %pre\r\n        :preserve\r\n          > sass -i\r\n    %asside.clearfix\r\n      %h2 Care with division\r\n      %p Always surround division with parentheses:\r\n      %pre\r\n        :preserve\r\n          $good: (10px / 2); //=> 5px\r\n          $bad: 10px / 2; //=> 10px/2", scss_input: ".article-container article {\r\n  width: 700px;\r\n  background-color: pink;\r\n  margin: auto;\r\n  padding: 10px; }\r\n  .article-container article .main-content {\r\n    width: 466.66667px;\r\n    float: left;\r\n    background-color: white; }\r\n    .article-container article .main-content section {\r\n      padding: 10px; }\r\n  .article-container article asside {\r\n    width: 213.33333px;\r\n    background-color: lightgreen;\r\n    float: right;\r\n    padding: 10px; }", description: "we can calculate dimensions rather than hard-coding them."},
    {title: "Darken and Lighten", haml_input: "#original.box Original\r\n#darker.box Darker\r\n#lighter.box Lighter", scss_input: ".box {\r\n  width: 33.33333%;\r\n  float: left;\r\n  padding: 10px;\r\n  color: black; }\r\n\r\n#original {\r\n  background-color: #ad141e; }\r\n\r\n#darker {\r\n  background-color: #52090e; }\r\n\r\n#lighter {\r\n  background-color: #e93e49; }", description: ""},
    {title: "Saturate and Desaturate", haml_input: "#original.box Original\r\n#saturated.box Saturated\r\n#desaturated.box Desaturated", scss_input: ".box {\r\n  width: 33.33333%;\r\n  float: left;\r\n  padding: 10px;\r\n  color: black; }\r\n\r\n#original {\r\n  background-color: #ad141e; }\r\n\r\n#saturated {\r\n  background-color: #c1000d; }\r\n\r\n#desaturated {\r\n  background-color: #903137; }", description: ""},
    {title: "Transparency with RGBA", haml_input: ".box Hello World!", scss_input: ".box {\r\n  padding: 20px;\r\n  color: red;\r\n  background-color: rgba(255, 0, 0, 0.5); }", description: "CSS3 added the ability to specify the opacity of a color. More specifically, in addition to specifying colors with `rgb()`, you can now also use `rgba()`. The \"a\" in `rgba` stands for \"alpha\".\r\n\r\nSCSS has native support for `rgba`:\r\n\r\n```scss\r\n$base-color = red;\r\n$semi-transparent-red: rgba( $base-color, .7 )\r\n```\r\n\r\n"},
    {title: "Adjust-Hue", haml_input: "#anti-clockwise.box Anti-Clockwise\r\n#original.box Original\r\n#clockwise.box Clockwise", scss_input: ".box {\r\n  width: 33.33333%;\r\n  float: left;\r\n  padding: 10px;\r\n  color: black; }\r\n\r\n#original {\r\n  background-color: #ad141e; }\r\n\r\n#clockwise {\r\n  background-color: #6bad14; }\r\n\r\n#anti-clockwise {\r\n  background-color: #5614ad; }", description: "rotate around the color-wheel by a given number of degrees:\r\n\r\n![Color Wheel](http://www.chainstyle.com/tutorials/images/colorscheme_wheel-hue.jpg)\r\n\r\nSee [docs](http://sass-lang.com/documentation/Sass/Script/Functions.html) for this and other color functions."},
    {title: "Complement", haml_input: "#box-1.box Base Color 1\r\n#box-2.box Comp Color 1\r\n#box-3.box Base Color 2\r\n#box-4.box Comp Color 1\r\n", scss_input: ".box {\r\n  width: 50%;\r\n  float: left;\r\n  padding: 10px;\r\n  color: black; }\r\n\r\n#box-1 {\r\n  background-color: #ad141e; }\r\n\r\n#box-2 {\r\n  background-color: #14ada3; }\r\n\r\n#box-3 {\r\n  background-color: #6556f7; }\r\n\r\n#box-4 {\r\n  background-color: #e8f756; }", description: "SCSS can help us find the `complement` of a color, i.e., the opposite color on the color wheel:\r\n\r\n![Color Wheel](http://www.chainstyle.com/tutorials/images/colorscheme_comp.jpg)\r\n\r\nSee [docs](http://sass-lang.com/documentation/Sass/Script/Functions.html) for this and other color functions."},
    {title: "Modularity through partials and @import", haml_input: "", scss_input: "", description: "SCSS has a mechanism that lets us break large projects up into smaller files.\r\n\r\n### CSS @import vs. SCSS @import\r\n\r\nPlain old CSS has an `@import` directive that lets you split your CSS into smaller, more maintainable files. The only drawback is that each time you use `@import` in CSS it creates another HTTP request.\r\n\r\nSCSS improves upon this by embeddeding imported CSS on the server side, in much the same way that rails views embed partials.\r\n\r\n### Problems with the rails asset pipeline \r\n\r\nThe rails asset pipeline provides an alternative way to break up our SCSS files, but we can run into problems if we are using SCSS variables and mixins.\r\n\r\nThe problem is that every SCSS file included in the manifest (in `application.css`) is compiled separately into a CSS file before the files are combined, so variables and mixins aren’t shared between files.\r\n\r\nThis can lead to SCSS compilation errors about missing variables and mixins.\r\n\r\n### Fixing application.css\r\n\r\nTo get this working we need to:\r\n\r\n* rename `application.css` to `application.css.scss`\r\n* remove `require_tree .`\r\n* add `@import` directives for each file we need\r\n\r\nFor example, the app you are reading this on has the following `application.css.scss` file:\r\n\r\n```scss\r\n/*\r\n * This is a manifest file that'll be compiled into application.css, which will include all the files\r\n * listed below.\r\n *\r\n * Any CSS and SCSS file within this directory, lib/assets/stylesheets, vendor/assets/stylesheets,\r\n * or vendor/assets/stylesheets of plugins, if any, can be referenced here using a relative path.\r\n *\r\n * You're free to add application-wide styles to this file and they'll appear at the top of the\r\n * compiled file, but it's generally better to create a new file per style scope.\r\n *\r\n *= require codemirror\r\n *= require codemirror/themes/night\r\n *= require_self\r\n */\r\n\r\n@import \"params.css.scss\";\r\n@import \"mixins.css.scss\";\r\n@import \"site_wide.css.scss\";\r\n@import \"snippets.css.scss\";\r\n```"},
    {title: "if, @if, @for, @each and @while", haml_input: "", scss_input: "", description: "SCSS supports basic control directives and expressions for including styles only under some conditions or including the same style several times with variations.\r\n\r\n**Note: Control directives are an advanced feature, and are uncommon in day-to-day styling. They exist mainly for use in mixins, particularly those that are part of libraries like [Compass](http://compass-style.org/).**\r\n\r\nSee the [docs](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#control_directives__expressions) for more details."}
  ])

end