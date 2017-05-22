---
layout: page
title: OCCIware
menu: home
---

# A dev intro to Occiware

## What is it about ?

### The OCCIware project

You will find a clear and short explanation of the goals and inner workings of Occiware on the [Occinterface Demo app page](http://occinterface.herokuapp.com/), in the "The OCCIware project" section.

> Useful note for what follows : to download Slideshare presentations as .pdfs without an account, you may want to use something like [Slidegrubber](http://grub.cballenar.me/).

If you want to know more, the latest presentation on Occiware made by Marc Dutoo gives a good overview about what this is all about : [Occiwareposs 2016 - An extensible standard xaas cloud consumer platform](https://fr.slideshare.net/mdutoo/occiwareposs-2016-an-extensible-standard-xaas-cloud-consumer-platform). In order to better understand the slides, you may want to watch the [video of the presentation on Youtube](https://www.youtube.com/watch?v=HuDEbpC0eSw).

You might also want to read the overall presentation by Marc Dutoo : [Eclipsecon 2016 - Occiware, a cloud api to rule them all](https://fr.slideshare.net/mdutoo/eclipsecon-2016-occiware-a-cloud-api-to-rule-them-all).

Watching the [presentation's video of Erocci](https://www.youtube.com/watch?v=cJszIZP7_N8) that followed Marc Dutoo's talk might help you to understand more about OCCI.

To better understand what OCCI is, the best thing to do would be to take a quick look at the [specification of the norm](http://occi-wg.org/about/specification/).

## What am I going to find on this website ?

This is the community website for OCCIware : it contains documentation for both users and developers, as well as other technical resources.

## What are the Occiware framework components ?

You will find the many components of the project in the [Github Organization](https://github.com/occiware). Below you will find a quick description for the core projects.

### [OCCI-Studio](https://github.com/occiware/OCCI-Studio)

Throughout the documentation, you will see references to either CloudDesigner, Occiware Studio or Occi-Studio. Actually, these three terms refer to the very same piece of software : the flavor of Eclipse that makes up the Occiware framework.

Actually, the [OCCI-Studio repository](https://github.com/occiware/OCCI-Studio) is for a future version of the studio, but for now all the current code is currently being held in the [Ecore repository](https://github.com/occiware/ecore). The OCCI-Studio will actually be separated into several different projects, including itself and others like Docker-Studio to separate capabilities that are not directly related.

See the ["Setting up the Environment"](/content/developer-guides/snapshot/studio-setting-up-the-environment.html)
 page to install it.

### [MartServer](https://github.com/occiware/MartServer)

To put it simply, the MartServer is a headless implementation of the Occi-Studio : no Eclipse tools or bindings here. It is a "for-prod" project. It is a simpler Java equivalent to the [Erocci](https://github.com/erocci/erocci) Erlang implementation, though Erocci is more scalable thanks to the very nature of the Erlang language.
