---
layout: page
title: Setting up the Environment
menu: dev-guides
version: 1.0
cat: OCCIware Studio
released: false
---

## If you just want to use the CloudDesigner / OCCI-Studio

Simply download [OCCI-Studio](http://www.obeo.fr/download/occiware/).  
This Eclipse distribution contains all the required dependencies.

1. Unzip the bundle, then launch the eclipse application (./eclipse).  
2. Select the workspace (you can type "./workspace" to put the data under the CloudDesigner installation directory.)

## If you want to play around with the sources

You will basically run our modified Eclipse instance within another Eclipse instance of your choice.

The advantage of running the CloudDesigner within another Eclipse instance is that you will be able to see to console logs as you run the app : if you encounter any problem, you will be able to trace it back and fix it or create an issue on Github more easily.

### 1. The "host Eclipse"

> Preventive Note : With MacOS, you will have to launch eclipse with the following command, otherwise you will get memory issues :

	./Eclipse.app/Contents/MacOS/eclipse --launcher.ini ./Eclipse.app/Contents/MacOS/eclipse.ini

#### 1.1. The easy way : use the CloudDesigner / OCCI-Studio

Since the project relies on quite a few Eclipse plugins already embedded in the OCCI-Studio described above, you may prefer to simply download it following the above recommandations.

#### 1.2. The easy but long way : Build your own Cloud Designer from sources

Clone the sources from the project ecore somewhere that suits you (ex: your home directory) and build :

    git clone https://github.com/occiware/ecore.git
    cd ecore/clouddesigner/org.occiware.clouddesigner.parent
    mvn clean verify

**Warning**
The complete build option might take a while, from 5 to 30 minutes, depending on your computer and if you are running other apps on the side.

#### 1.3. The not so easy and long way : starting from an existing Eclipse installation

It is also possible to configure a standard Eclipse distribution to run the OCCIware project.

1. If you don't already have Eclipse installed but want to follow this procedure, download [Eclipse Neon](http://www.eclipse.org/downloads/packages/eclipse-ide-java-developers/neon1).   
2. Launch Eclipse.
3. In Eclipse, go to Help > Install New packages. Choose "http://download.eclipse.org/releases/neon" in the proposed list of package sources.
To find the exact packages you need for Eclipse Neon, type in the search tab :

    - EMF - Eclipse Modeling Framework SDK
    - Model Comparison (EMF Compare)
    - Acceleo
    - Xtext Complete SDK
    - OCL Examples and Editors SDK
    - Sirius Specifier Environment

Eventually, if your version of Eclipse is prior to Eclipse Mars, you may want to install Mylyn WikiText - for Wiki syntax support. Though it is pre-installed/built-in since Eclipse Mars.

### 2. The "guest" Eclipse : the OCCI-Studio Project

1. In the workspace directory of your Eclipse distribution you previously prepared, clone the Git repository hosted on [Github](https://github.com/occiware/ecore).  
2. In your host Eclipse, import all the projects from the cloned Git (**File » Import » Existing Project into Workspace**).
3. Delete the "ecore" project (do not tick the "delete from disk" option when asked) : it is an Eclipse bug when importing the project.
4. Verify that there are no error on compiled projects. If errors are marked and the projects cannot compile :

   - check the Java (JRE) version (right-click on **Project » Properties**).
   - in order to download all connector dependencies using Maven, either build it all (see below), or quicker : do ```mvn clean install``` in all the [*.connector.dependencies](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.linkeddata.connector.dependencies) projects, then refresh them all (CTRL-A then F5). If problems remain with the \*.connector.dependencies projects, right-click on them > Maven > Update Project...  Their lib/ directories should now be filled with dependency jars.
   - if there are M2E "Plugin execution not covered by lifecycle configuration" errors triggered by the Tycho plugin in the Maven build, select them all in the **Problems** view (Window > Show View > Other... then in General), right-click on them, choose "Quick fix" and "Discover new M2E plugins".

5. To now run the Cloud Designer from source within Eclipse, do: Run > Run configurations... then create a new Eclipse Application (if none yet), name it "Cloud designer" and run it. If some errors remain but don't affect whether the application is running or not, don't pay them attention.

### For your Info : How does the build work ?

The build of all Cloud Designer plugins / subprojects is configured in the  [META-INF/MANIFEST.MF](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.linkeddata.connector/META-INF/MANIFEST.MF) file, as for any regular Eclipse plugin.

The automated build of sources within Eclipse gets its information directly from these manifests.

The Maven build, on the other side, gets this information through the [Tycho](http://www.vogella.com/tutorials/EclipseTycho/article.html) plugin and its ```eclipse-plugin``` Maven artifact packaging. This means that Maven pom.xml files are almost empty.

In the Cloud Designer codebase, the only exception to this rule are [*.connector.dependencies](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.linkeddata.connector.dependencies) projects ([see why](studio-creating-a-java-connector.html)).
