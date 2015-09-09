# Decision Matrix Calculator

A web app to help people make decisions, written in Angular.js.

I am writing this because I want to enable people to use decision matrices easily, without having to set up a spreadsheet or open a separate app like Excel. Writing this also helps me learn the client-side JavaScript framework I am writing it in – Angular in this case.

## Status

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/0.1.0/wip.svg)](http://www.repostatus.org/#wip)

Still in development. You can edit the list of choices and attributes, and edit the relative weights of attributes, but you can’t yet edit the matrix of ratings and have the best choice calculated for you.

My next step is learning which features of Angular I can use to most naturally implement editing of the same data in a different part of the page, when one of the views edits the data abstractly instead of directly. I will need this to allow editing relative weights by dragging the percentage sliders, not just by editing the text field.

## How to run it

* Run `npm install` to install modules
* Run `broccoli serve` to start a server that automatically compiles files
