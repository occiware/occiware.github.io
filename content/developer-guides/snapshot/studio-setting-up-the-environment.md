---
layout: page
title: Setting up the Environment
menu: dev-guides
version: 1.0
cat: OCCIware Studio
released: false
---

## Using Obeo's CloudDesigner

The most simple solution is to install [OCCIware' Studio](/content/links.html).  
This Eclipse distribution contains all the required dependencies.

1. Unzip the bundle, then launch the eclipse application (./eclipse).  
2. Select the workspace (you can type "./workspace" to put the data under the CloudDesigner installation directory.)


## Using a raw Eclipse

It is also possible to configure a standard Eclipse distribution to run the OCCIware project.

1. Download [Eclipse Mars](http://www.eclipse.org/downloads/packages/eclipse-ide-java-developers/mars).   
2. Launch Eclipse.  
3. In Eclipse, install the following tools from http://download.eclipse.org/releases/mars.

   * Mylyn WikiText (for Wiki syntax support, normally pre-installed/in-built with Eclipse Mars).
   * Eclipse Modeling Framework (EMF SDK & EMF Compare).
   * Acceleo Core SDK.
   * Xtext Complete SDK.
   * Sirius Specification Environment (check that Sirius Runtime is included).
   * OCL Examples and Editors SDK.


## Notes

With MACOS, you must launch eclipse with the following options:  

	./Eclipse.app/Contents/MacOS/eclipse --launcher.ini ./Eclipse.app/Contents/MacOS/eclipse.ini
   
Otherwise this will lead to memory issues.


## Cloning the Project

1. In the workspace directory, clone the Git repository hosted on [Github](https://github.com/occiware/ecore).  
2. In Eclipse, import the all the projects from the cloned Git (**File » Import » Existing Project into Workspace**).  
3. Verify that there are no error on compiled projects. If errors are marked and the projects cannot compile, check the Java (JRE) version
(right-click on **Project » Properties**).

## Build your own Cloud Designer from sources
1. Clone the sources from the project ecore (https://github.com/occiware/ecore) in your local directory
2. cd ecore/clouddesigner/org.occiware.clouddesigner.parent
3. mvn clean verify

**Warning**
It takes half an hour to build
