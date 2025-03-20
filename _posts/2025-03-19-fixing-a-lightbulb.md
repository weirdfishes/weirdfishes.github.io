---
layout: post
title:  "Fixing a lightbulb"
tags: "blog web"
---

When I set out to make this site, I was excited that I could get it up and running pretty quickly with [Jekyll](https://jekyllrb.com/) & [GitHub Pages](https://pages.github.com/). There were numerous docs and guides, and it was all markdown files at the end of the day. How hard could it be?

The quickstart docs looked really simple. All I needed was:
- Ruby version 2.7.0 or higher
- RubyGems
- GCC and Make

Great! Ruby is in at least 3.something now, let's check what my M2 Macbook Air has

-- 
```bash
$ ruby -v
ruby 2.6.10p210
```
--

Not a great start, but how hard could it be to update ruby? After some googling, I found this relatively recent [StackOverflow post](https://stackoverflow.com/questions/77590792/upgrading-default-ruby-install-on-mac) titled "Upgrading default Ruby install on Mac". The helpful answers in here told the OP to never use, let alone upgrade, the system managed Ruby installation, and to instead manage your own installation separately. In hindsight, this was probably the first warning sign that setting this site up would not in fact be simple.

After some more googling, I learned that to make life easier for future Sharat, I should not simply install Ruby, but I should use a verion manager tool to manage and install different versions of Ruby. Having worked with JavaScript & Node for the better part of a decade, this sounded like the right thing to do. But I just wanted something to install a relatively newer version of Ruby so I can get my site up and running. I ended up installing ruby directly from brew: `brew install ruby`.

Now, of course, this failed because I had to update brew itself, but that wasn't too big of a deal. Now, with ruby installed, I could start with the first step of setting up my site -- installing jekyll. Unfortunatley, installing the jekyll gem just would not work due to one dependency or another that was broken on my machine. After over an hour of googling and nearly giving up, I decided to just start over with a ruby manager and installed rbenv. While rbenv itself was easy to install, I just could not get ruby installed at all due to issues with openssl and other basic dependencies like c/c++ on my machine. It was at this point that I started to feel like [Hal fixing a lightbulb](https://www.youtube.com/watch?v=AbSehcT19u0) in this amazing cold open of Malcolm in the Middle.

Just when I was about to give up, I came across a [GitHub issue](https://github.com/rbenv/ruby-build/discussions/2494) that was oddly similar to what I was seeing. Unrelated to ruby, it turned out that my real issue was that I migrated my machine from an Intel Mac to an Apple Silicon Mac, and this migration included tooling like homebrew. As soon as I deleted my old homebrew installation and replaced it with a fresh install for Apple Silicon, I was able to breeze through the setup for ruby, gems, and jekyll. Within minutes, my site was up and running 🚀.

It then dawned on me that I've had this machine for two and a half years and have done basically no development or side projects. Putting that aside, my real lesson here is that if something is broken and it hasn't been touched in over a year, zoom out as much as possible and just do a clean install.