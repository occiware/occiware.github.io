---
layout: page
title: User Guide
menu: user-guides
version: 1.0
released: false
---

## Studio

The studio is based on Eclipse.

* [Installing OCCIware's studio](studio-installation.html)
* [Browsing and Installing OCCIware's studio example projects](studio-examples.html)
* [Designing a new OCCI extension](studio-new-occi-extension.html)
* [Using the OCCI extension designer](studio-extension-designer.html)
* [Using the OCCI configuration designer](studio-configuration-designer.html)
* [Using OCCIware's generators](studio-generators.html)
* [Advanced usage](studio-advanced-usage.html)
* [Howtos / best practices](howtos.html)

## Connectors

* [Docker](connector-docker.html)
* [jOCCI](connector-jocci.html)

## Runtime

* [MartServer](https://github.com/occiware/MartServer) : pure java, multi protocol, OCCI runtime platform. It can be understood as a headless implementation of the Occi-Studio in Java, roughly equivalent to Erocci.
* [Erocci](http://erocci.ow2.org) : scalable, multi protocol, multi backend OCCI runtime platform. Its [erocci-dbus-java](http://github.com/occiware/erocci-dbus-java) Java backend makes it a runtime server for Studio connectors, allowing to expose them as OCCI through erocci.
* [OCCInterface (OCCI playground)](runtime-occinterface.html) : OCCInterface is a generic application that lets you explore and modify the resources of an OCCI server.
* [Exposing a connector as an OCCI HTTP API](runtime-expose-a-connector-as-OCCI-HTTP.html) : Explication based on the Linked Data demo.

## Use cases

* ["LinkedData as a Service" Demonstrator](use-cases-ldaas-demonstrator.html)
