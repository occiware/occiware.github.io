---
layout: page
title: Linked Data as a Service Demonstrator
menu: dev-guides
version: 1.0
cat: Use Cases
released: false
---


### Other projects

#### [Ozwillo Datacore](https://github.com/ozwillo/ozwillo-datacore)

The Datacore is a project that isn't directly linked to Occiware, though it brings powerful concepts and ideas that nourish the demos.

### Demonstrations

#### [Connector Analytics - Linked Data server on Docker optimized for analytics](https://github.com/occiware/occiware-ozwillo/blob/master/connector-analytics/)

_Presentation Excerpt_ :

// TODO : Make it more clear - What does this app do actually ?

"This demo showcases OCCIware Studio deploying a complete, working Ozwillo Datacore cluster (one Java and 3 mongo replica nodes) on Docker both locally and on a remote Open Stack VM, and developing a custom OCCI extension (including designer and connector) for Linked Data that allows to publish data projects and let them use a specific mongo secondary rather than the whole cluster (typically for read-heavy queries such as for analytics). This last point is achieved by visually linking OCCI Resources across Cloud layers : from Linked Data as a Service (LDaaS) to Infrastructure as a Service (IaaS)."

##### Executing the Linked Data Demo

Once you have CloudDesigner up and running, be it as a standalone application or within another Eclipse instance, let's test it with a demo.

First off, clone the demo repository : [https://github.com/occiware/occiware-ozwillo.git](https://github.com/occiware/occiware-ozwillo.git).

Then, follow the instructions written in the [README.md file](https://github.com/occiware/occiware-ozwillo/blob/master/connector-analytics/README.md).

> NDLR : Missing demo screenshots start slide number in "Prerequisites" section. Isn't it the slide n°39 ?

> NDLR : Add command to first shell script to install virtualbox, because at this point, the user only is supposed to have installed Occi-Studio (and therefore java and maven too).

> NDLR : As for Docker the Docker install, the instructions are outdated because the versioning and installation process have completely changed since march 2017 ! It is better to follow the recommended steps in the [Docker Documentation - Installation for Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntu/).

##### Questions about the demo :

[Marc Dutoo's presentation on Youtube - Demonstration](https://youtu.be/HuDEbpC0eSw?t=713).

+ In the Erocci repo, why is the LinkedData.occie file not in the same format in the video and in the repository (currently, this is XML).

+ Do you have a video of a complete demonstration (with launch of Ozwillo Datacore Playground and Ozwillo OzEnergy) ?

+ Do you know of [Rancher](http://rancher.com/rancher/) ?

#### [Ozwillo Ozenergy](https://github.com/ozwillo/ozwillo-ozenergy)

OzEnergy is an energy consumption monitoring application meant to use the capabilities provided by OCCI to scale way up and offer data monitoring capabilities ranging from the very consumers, to providers and territories alike.

##### Executing the Ozenergy Demo

Simply follow the instructions available on the [Github repository](https://github.com/ozwillo/ozwillo-ozenergy), keeping in mind the few following details that are not so clear :

> + For the node installation, it is highly recommended to use NVM, just like it's the OCCInterface proposes.

> + A priori, it is not necessary to install Scala separately, since sbt can install the most appropriate version itself.

> + Maven and MongoDB are to be installed through command line (sudo apt-get install maven mongodb).

> + You can extract the Spark archive in your home directory or anywhere, for that matter, but don't forget to add the $SPARK_HOME environment variable by adding at the end of your ~/.bashrc file : "export SPARK_HOME=<YOUR PATH TO THE EXTRACTED SPARK DIRECTORY>", for example in the demo VM : "export SPARK_HOME=/home/occidemo/Bureau/Demo/Softs/spark-1.6.1-bin-hadoop2.6".

> + The command "git clone git@github.com:ozwillo/ozwillo-java-spring-integration.git" is not working, use "git clone https://github.com/ozwillo/ozwillo-java-spring-integration.git" instead.

> + The "First open the build.sbt file in the and replace oz-energy-aggregations subproject '/home/charge' by your own home directory." is deprecated.

> + Same with the "then adapt it as needed, notably set spark.home if you haven't set the SPARK_HOME environment variable." line if you have set the SPARK_HOME environment variable as told above.

> + In the end "mvn clean package" fails because many tests are failing. What might cause this ?

> + And finally, even though "mvn clean package" fails, we are able to successully run "mvn spring-boot:run" and open the webapp in the browser, but no graph nor data is displayed, probably because of the previous command's failure.

#### [OCCInterface](https://github.com/occiware/OCCInterface)

OCCInterface is a generic application that lets you explore and modify the resources of an OCCI server, regardless of what OCCI information we are talking about.

_[Demo en live sur Heroku](http://occinterface.herokuapp.com/)_

##### Executing the Occinterface Demo

Simply follow the instructions available on the [Github repository](https://github.com/occiware/OCCInterface).

## How to contribute ?

### <a name="getting_started"></a>Getting started with the Occiware framework

The reference documentation for Occiware is hosted separately from the main website, [on Github.io](http://occiware.github.io/).

For starters, let's get our dev environment set up and ready to go. For that, go to [the setup page](http://occiware.github.io/content/developer-guides/snapshot/studio-setting-up-the-environment.html).

You can either choose to install the project's Eclipse distribution, CloudDesigner (Cf. the page's first section), or if you already have a preinstalled version of Eclipse you might prefer to set it up by hand (Cf. sections 2 to 4).

> NDLR : it would probably be more appropriate to reorganize these sections into subsections according to the description above.

> NDLR : About package installation
Go to Help > Install New packages
Choose "http://download.eclipse.org/releases/neon" in the proposed list of package sources.
To find the exact packages you need for Eclipse Neon, type in the search tab :

> - EMF - Eclipse Modeling Framework SDK
> - Model Comparison (EMF Compare)
> - Acceleo
> - Xtext Complete SDK
> - OCL Examples and Editors SDK
> - Sirius Specifier Environment

> NDLR : Actually, importing the necessary stuff by hand in Eclipse takes loads of time because of the many errors. Even with the steps given, the project still gives off errors, however we are able to launch Eclipse from Eclipse.

> NDLR : The documentation could use some extra screenshots : it would be really helpful for people that are not yet extra familiar with Eclipse. It would also help to remove a few ambiguities.

> NDLR : This sentence : "in order to download all connector dependencies using Maven, either build it all (see below), or quicker : do mvn clean install in all the .connector.dependencies projects, then refresh them all (CTRL-A then F5). Their lib/ directories should now be filled with dependency jars." could be replaced by "select all the projects, right-click and click on Maven > Update Project".
