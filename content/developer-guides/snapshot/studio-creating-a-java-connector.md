---
layout: page
title: Creating a Java connector
menu: dev-guides
version: 1.0
cat: OCCIware Studio
released: false
---

## Creating a Java Connector
**TODO** move to its own page.

Here is how to create a Java connector that will be able to manage the Cloud of your choice and expose its capabilities as OCCI.

See also slides 71-73 in the [One Cloud API to rule them all](http://fr.slideshare.net/mdutoo/eclipsecon-2016-occiware-a-cloud-api-to-rule-them-all) talk given at EclipseCon France 2016.

**TODO** put its screenshots here.

1\. In Eclipse, **create a connector project** by choosing File > New > Other... then Cloud Designer > Java Connector Project, and filling its name and extension dependencies (usually with [one you've created](/content/user-guides/snapshot/studio-new-occi-extension.html) for your own needs). This notably generates [.../connector/YourOCCIResourceConnector.java](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.linkeddata.connector/src/org/occiware/clouddesigner/occi/linkeddata/connector/LdprojectConnector.java) files in the src/ directory, with empty connector methods (occiRetrieve, occiUpdate... as well as defined OCCI actions).

2\. Creating a connector with an existing Cloud (IaaS, PaaS...) implies **adding all dependencies** that are required to talk to said Cloud's management APIs, such as a REST client if those are REST APIs, or a dedicated client library provided by said Cloud. To this end :

- in Eclipse, create a ...connector.dependencies project using [an existing one](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.linkeddata.connector.dependencies) as a template and define all these dependencies in [its pom.xml file](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.linkeddata.connector.dependencies/pom.xml).
- run ```mvn clean install``` in this project, which will make maven download all dependencies in the ...connector/lib folder.
- in Eclipse, complete the ...connector project's [META-INF/MANIFEST.MF](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.linkeddata.connector/META-INF/MANIFEST.MF) by adding library dependencies on all ...connector/lib/*jar files (refresh the project if you can't see them).

NB. ...connector.dependencies projects are the only case in the Studio were dependencies are declared in the pom.xml file. Otherwise they must be declared in a project's META-INF/MANIFEST.MF file, as for any regular Eclipse plugin, where Maven will be able to find them thanks to using [Tycho](http://www.vogella.com/tutorials/EclipseTycho/article.html)'s ```eclipse-plugin``` packaging.

3\. You can now **fill those connector methods** by writing code that takes the current state of your OCCI resource (at execution time, those generated connector objects will be automatically filled with it : all attributes and links) and applies it to the management of the Cloud that your are creating a connector for by using said dependency libraries.

4\. You can then **test it** by running it from source within Eclipse : Run > Run configurations... then create a new Eclipse Application (if none yet) and run it.

Next step is to [expose this connector as an OCCI HTTP API](/content/user-guides/snapshot/runtime-expose-a-connector-as-OCCI-HTTP.html).


