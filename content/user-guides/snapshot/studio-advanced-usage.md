---
layout: page
title: Advanced Usage
menu: user-guides
cat: OCCIware Studio
version: 1.0
released: false
---

A brief mention of other interesting features...

* To add constraints, specify them in OCL.  
They will remain in the EMF context and will not be exported in OCCI. You can define them textually
as .ocl files (you will have to load them every time with `OCL » load`) or within your *.ecore* file.

* To edit the modeler: edit occi.design/ OCCIware.odesign.
* To add custom behaviors (computed attributes...): generate EMF Java and code in it (this is the EMF way to do it).
