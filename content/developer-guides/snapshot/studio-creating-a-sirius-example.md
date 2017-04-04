---
layout: page
title: Creating a Sirius Example
menu: dev-guides
version: 1.0
cat: OCCIware Studio
released: false
---

The following steps allow to create an Sirius Example which will appear in the main Cloud Designer examples wizard.

First, you need to create a sample project which will be made installable as an example.

![Example Base](/resources/images/examples-wizard/ExampleBase.png)

An image will be required to integrate the example in the common wizard. You can export the current diagram as an image for instance.

![Export Image](/resources/images/examples-wizard/ExportImage.png)

You need to declare the sample project as an example, to do that first convert the project to a plug-in project:

![Convert to Plugin](/resources/images/examples-wizard/ConvertToPlugin.png)

Select your project and click **Finish**. Then open the **META-INF/MANIFEST.MF** file and make the following changes:
* in the "Dependencies" tab: add a dependency to **org.occiware.clouddesigner.occi.examples**

![Add Dependency](/resources/images/examples-wizard/AddDependency.png)

* in the "Extensions" tab: create a new extension for the **org.occiware.clouddesigner.occi.examples.example** extension-point

![Create Extension](/resources/images/examples-wizard/CreateExtension.png)

* Fill in the extension values: name, description. Then select an image, the aird (the representations model), the semantic model.

![Fill Extension](/resources/images/examples-wizard/FillExtension.png)

To test the new example, launch an Eclipse runtime from the workspace containing the example project, then use the new examples wizard.

To contribute the example to the Cloud Designer, integrate it to the build system:
* Add a pom.xml in your project (e.g. **org.occiware.clouddesigner.occi.my.example/pom.xml**)
* Add a module in **org.occiware.clouddesigner.parent/pom.xml**
