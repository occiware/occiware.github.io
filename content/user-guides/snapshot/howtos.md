---
layout: page
title: Howtos / best practices
menu: user-guides
cat: OCCIware Studio
version: 1.0
released: false
---

* model a **boolean attribute** : [for now not supported in erocci](https://github.com/erocci/erocci/issues/85), rather use an Enum. Which is actually a good practice from a semantic point of view (example : having a VM.isStarted attribute and later discovering that there are additional lifecycle states besides started and stopped).

* model **complex types** : for now not supported [in OCCI](https://github.com/erocci/erocci/issues/45) nor [in the Cloud Designer](https://github.com/occiware/ecore/issues/130), instead design additional resource kinds.

* [link / drag and drop between configurations](https://github.com/occiware/ecore/issues/128), ex. to link a platform component to the infrastructure Compute whose host / IP it has
