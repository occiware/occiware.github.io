---
layout: page
title: Linked Data as a Service Demonstrator
menu: dev-guides
version: 1.0
cat: Use Cases
released: false
---

# Demonstrations

Two projects have been developed for this demonstrator. What is presented here is their state as of May 5th, 2017, and how to use/execute them locally. The Datacore Playground and Ozwillo OzEnergy projects also rely on another project, the [Ozwillo Datacore](https://github.com/ozwillo/ozwillo-datacore).

We plan on dockerizing all this for easier local testing, but in the meantime, if you want to run them locally, we recommend that you use a Gnu/Linux system, especially an Ubuntu-based one, otherwise, you will have to adapt the commands to your own operating system.

## [Datacore Playground - Linked Data server on Docker optimized for analytics](https://github.com/occiware/occiware-ozwillo/blob/master/connector-analytics/)

_Presentation Excerpt_ :

This demo showcases OCCIware Studio deploying a complete, working Ozwillo Datacore cluster (one Java and 3 mongo replica nodes) on Docker both locally and on a remote Open Stack VM, and developing a custom OCCI extension (including designer and connector) for Linked Data that allows to publish data projects and let them use a specific mongo secondary rather than the whole cluster (typically for read-heavy queries such as for analytics). This last point is achieved by visually linking OCCI Resources across Cloud layers : from Linked Data as a Service (LDaaS) to Infrastructure as a Service (IaaS).

_[Live Demo on Ozwillo Preprod](https://data.ozwillo-preprod.eu/)_

You will need to contact the app maintainer, Marc Dutoo (mdutoo on Github), to get an access to it. It is rather recommended to execute it locally.

### Executing the Linked Data Demo

For starters, let's get our dev environment set up and ready to go. If you haven't already done that, go to [the setup page](http://occiware.github.io/content/developer-guides/snapshot/studio-setting-up-the-environment.html).

Make sure you have both installed a "Host Eclipse" and that you have a "Guest Eclipse" opened in it. For easier use, we recommend you use the Java Perspective in the "Host Eclipse", so that you can click on the debug button when launching, and then get the Debug Perspective. To do so go to the top menu > Window > Perspective > Open Perspective > Java.

First off, clone the demo repository : [https://github.com/occiware/occiware-ozwillo.git](https://github.com/occiware/occiware-ozwillo.git).

Then, follow the instructions written in this [README.md file](https://github.com/occiware/occiware-ozwillo/blob/master/connector-analytics/README.md).

## [Ozwillo Ozenergy](https://github.com/ozwillo/ozwillo-ozenergy)

_Presentation Excerpt_ :

OzEnergy is an energy consumption monitoring application meant to use the capabilities provided by OCCI to scale way up and offer data monitoring capabilities ranging from the very consumers, to providers and even entire countries/territories.

_Live Demo Unavailable_

### Executing the Ozenergy Demo

Simply follow the instructions available on the [Github repository](https://github.com/ozwillo/ozwillo-ozenergy).

Known problems :

+ In the end "mvn clean package" fails because many tests are failing. Cause : unknown.

+ And finally, even though "mvn clean package" fails, we are able to successully run "mvn spring-boot:run" and open the webapp in the browser, but no graph nor data is displayed, probably because of the previous command's failure.
