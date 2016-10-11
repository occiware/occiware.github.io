---
layout: page
title: Expose a connector as an OCCI HTTP API
menu: user-guides
version: 1.0
cat: OCCIware Runtime
released: false
---


## Expose a connector as an OCCI HTTP API :
NB. implementing a connector's (**TODO** at least ?) occiRetrieve is required in order for it to run inside erocci-dbus-java.

Follow [steps described in the Linked Data demo](https://github.com/occiware/occiware-ozwillo/blob/master/connector-analytics/README.md) in order to:

- create your own runtime project extending erocci-dbus-java and including your connector, then start it,
- expose it by building erocci, then starting it with DBus for erocci-dbus-java,
- check it by cloning, building, starting and using OCCInterface (generic OCCI playground).


