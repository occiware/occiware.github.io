---
layout: page
title: The Docker Connector
menu: user-guides
cat: OCCIware Connectors
version: 1.0
released: false
---

This sub project aims at providing the required tools to execute the OCCIWARE model in real execution environment.

## Prerequisites

Supports Docker client version: 1.11.x.  
docker-machine version: 0.82.
Be sure the Docker daemon is running.
You should have an account or register yourself on: https://hub.docker.com/account/signup/.
To use the **vmwarevsphere** driver, you should install `govc` CLI as described [here](https://github.com/vmware/govmomi/tree/master/govc).

```bash
# Setting the govc command.
ln -s /path/to-file/govc /usr/bin/govc
```


## Using the Docker Modeler

Install and start [OCCIware's studio](studio-installation.html).  
Preferences are available under **Window » Preferences** (Windows and Linux) or **eclipse » Preferences** (Mac OS X).

![Preferences](/resources/images/docker/preferences.png "Docker preferences")

Select **Docker Preferences**.  
Change the configuration below according to your requirements in the Docker modeler.

![Preferences](/resources/images/docker/docker_preferences.png "Docker preferences")
		

Create new project.
 
![Viewpoint Selections](/resources/images/docker/new_projet.png "New project")


Create the docker configuration.
 
![Viewpoint Selections](/resources/images/docker/set_config.png "Create the configuration")


Set the configuration name in the wizard.

![Viewpoint Selections](/resources/images/docker/set_configuration_name.png "Select the appropriate configuration")



You should get something like this.

![Viewpoint Selections](/resources/images/docker/rendering_docker_modeler.png "Select the docker reference extension")


Create a new machine and one container inside the machine.

![Viewpoint Selections](/resources/images/docker/ex_design.png "create a new machine")


Select **Start all** in the **Execute** context menu to start both the machine and Docker.    
You can also import all the machines deployed in the execution environment.

![Viewpoint Selections](/resources/images/docker/after_import.png "create a new machine")


## Demonstration

This video shows how to launch the modeler and its different features.
  
<iframe width="420" height="315" src="https://www.youtube.com/embed/2SZXi71L0qQ" frameborder="0" allowfullscreen></iframe>

## The new Docker Studio GUI
The new Docker studio supports the multi-host network, swarm, volume management.

![Viewpoint Selections](/resources/images/docker/Docker-Studio.png "Overview")