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

1. Download [Eclipse Neon](http://www.eclipse.org/downloads/packages/eclipse-ide-java-developers/neon1).   
2. Launch Eclipse.  
3. In Eclipse, install the following tools from http://download.eclipse.org/releases/neon.

   * Eclipse Modeling Framework (EMF SDK & EMF Compare).
   * Acceleo Core SDK.
   * Xtext Complete SDK.
   * OCL Examples and Editors SDK.
   * Sirius Specificier Environment (normally Sirius Runtime is included).
   * (Mylyn WikiText - for Wiki syntax support - is pre-installed/in-built since Eclipse Mars)

## Notes

With MACOS, you must launch eclipse with the following options:  

	./Eclipse.app/Contents/MacOS/eclipse --launcher.ini ./Eclipse.app/Contents/MacOS/eclipse.ini
   
Otherwise this will lead to memory issues.


## Cloning the Project

1. In the workspace directory, clone the Git repository hosted on [Github](https://github.com/occiware/ecore).  
2. In Eclipse, import the all the projects from the cloned Git (**File » Import » Existing Project into Workspace**).  
3. Verify that there are no error on compiled projects. If errors are marked and the projects cannot compile :

    - check the Java (JRE) version (right-click on **Project » Properties**).
    - in order to download all connector dependencies using Maven, either build it all (see below), or quicker : do ```mvn clean install``` in all the [*.connector.dependencies](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.linkeddata.connector.dependencies) projects, then refresh them all (CTRL-A then F5). Their lib/ directories should now be filled with dependency jars.
    - if there are M2E "Plugin execution not covered by lifecycle configuration" errors triggered by the Tycho plugin in the Maven build, select them all in the **Problems** view (Window > Show View > Other... then in General), right-click on them, choose "Quick fix" and "Discover new M2E plugins".

4. To now run the Cloud Designer from source within Eclips, do: Run > Run configurations... then create a new Eclipse Application (if none yet) and run it.


## Build your own Cloud Designer from sources
1. Clone the sources from the project ecore (https://github.com/occiware/ecore) in your local directory
2. cd ecore/clouddesigner/org.occiware.clouddesigner.parent
3. mvn clean verify

**Warning**
It takes half an hour to build


## How the build works
The build of all Cloud Designer plugins / subprojects is configured [META-INF/MANIFEST.MF](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.linkeddata.connector/META-INF/MANIFEST.MF) file, as for any regular Eclipse plugin.

The automated build of sources within Eclipse gets its information directly from those manifests.

The Maven build, on the other side, gets this information through the [Tycho](http://www.vogella.com/tutorials/EclipseTycho/article.html) plugin and its ```eclipse-plugin``` Maven artifact packaging. This means that Maven pom.xml files are almost empty.

In the Cloud Designer codebase, the only exception to this rule are [*.connector.dependencies](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.linkeddata.connector.dependencies) projects ([see why](studio-creating-a-java-connector.html)).

