---
layout: page
title: Developer Guide
menu: dev-guides
version: 1.0
released: false
---

## OCCI-Studio

Before checking out any of the guides below, be sure to read : [Installing OCCI-Studio / Setting up the dev environment](studio-setting-up-the-environment.html)

* [Creating a Code Generator](studio-creating-a-code-generator.html)
* [Creating a Java Connector](studio-creating-a-java-connector.html)
* [Creating a Sirius Example](studio-creating-a-sirius-example.html)

## Runtimes

* [MartServer](https://github.com/occiware/MartServer) : pure java, multi protocol, OCCI runtime platform. It can be understood as a headless implementation of the Occi-Studio in Java, roughly equivalent to Erocci.
* [Erocci](http://erocci.ow2.org) : scalable, multi protocol, multi backend OCCI runtime platform. Its [erocci-dbus-java](http://github.com/occiware/erocci-dbus-java) Java backend makes it a runtime server for Studio connectors, allowing to expose them as OCCI through erocci.
