---
layout: page
title: The jOCCI Connector
menu: user-guides
cat: OCCIware Connectors
version: 1.0
released: false
---

This connector allows one to interact with OCCI servers:

* Import OCCI entities from an OCCI server.
* Create / Retrieve / Update / Delete OCCI entities hosted by an OCCI server.
* Execute OCCI actions on OCCI entities.

Current supported OCCI servers are [erocci](http://erocci.ow2.org) and [rOCCI](https://github.com/EGI-FCTF/rOCCI).  
This connector is based on [jOCCI](https://github.com/EGI-FCTF/jOCCI-api), an open source Java-based OCCI client library.


## Usage

To create a new OCCI configuration with the jOCCI connector, select **New** » **Cloud Designer** » **OCCI Configuration File with jOCCI connector**.

![Create a new OCCI Configuration File with jOCCI connector - step 1](/resources/images/jocci/New-OCCI-Configuration-File-with-jOCCI-connector-1.png "Create a new OCCI Configuration File with jOCCI connector - step 1")


Give the OCCI configuration file a name and specify the URL of an OCCI server.

![Create a new OCCI Configuration File with jOCCI connector - step 2](/resources/images/jocci/New-OCCI-Configuration-File-with-jOCCI-connector-2.png "Create a new OCCI Configuration File with jOCCI connector - step 2")


A new OCCI configuration file is then created.  
It contains all the OCCI entities hosted by the OCCI server.

![Create a new OCCI Configuration File with jOCCI connector - step 3](/resources/images/jocci/New-OCCI-Configuration-File-with-jOCCI-connector-3.png "Create a new OCCI Configuration File with jOCCI connector - step 3")


Select **Entity** » **Resource** in the palette to create a new compute instance.

![Create an OCCI Entity - step 1](/resources/images/jocci/Create-OCCI-Entity-1.png "Create an OCCI Entity - step 1")


Select **CRUD** » **Create** in the palette to create this compute into the OCCI server.

![Create an OCCI Entity - step 2](/resources/images/jocci/Create-OCCI-Entity-2.png "Create an OCCI Entity - step 2")


Update the attributes of the compute instance.

![Update an OCCI Entity - step 1](/resources/images/jocci/Update-OCCI-Entity-1.png "Update an OCCI Entity - step 1")


Select **CRUD** » **Update** in the palette to update this compute into the OCCI server.

![Update an OCCI Entity - step 2](/resources/images/jocci/Update-OCCI-Entity-2.png "Update an OCCI Entity - step 2")


Select **CRUD** » **Execute action** in the palette to execute an OCCI action of an OCCI entity into the OCCI server.

![Execute an OCCI Action - step 1](/resources/images/jocci/Execute-OCCI-Action-1.png "Execute an OCCI Action - step 1")


The OCCI action is executed.

![Execute an OCCI Action - step 2](/resources/images/jocci/Execute-OCCI-Action-2.png "Execute an OCCI Action - step 2")


Select **CRUD** » **Retrieve** in the palette to retrieve this compute from the OCCI server.

![Retrieve an OCCI Entity - step 1](/resources/images/jocci/Retrieve-OCCI-Entity-1.png "Retrieve an OCCI Entity - step 1")


The OCCI attributes are updated (i.e. `occi.compute.state` is `active`).

![Retrieve an OCCI Entity - step 2](/resources/images/jocci/Retrieve-OCCI-Entity-2.png "Retrieve an OCCI Entity - step 2")


Select **CRUD** » **Delete** in the palette to delete this compute into the OCCI server.

![Delete an OCCI Entity - step 1](/resources/images/jocci/Delete-OCCI-Entity-1.png "Delete an OCCI Entity - step 1")


As a result, the compute is also deleted from the diagram.

![Delete an OCCI Entity - step 2](/resources/images/jocci/Delete-OCCI-Entity-2.png "Delete an OCCI Entity - step 2")


## TODO

* Complete retrieving OCCI entities from an OCCI server (changed kind/mixins/attributes)
* Deal with parameters of OCCI actions to execute
* Deal with OCCI server authentication

