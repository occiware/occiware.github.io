---
layout: page
title: Creating a Code Generator
menu: dev-guides
version: 1.0
cat: OCCIware Studio
released: false
---

The following steps allow to create an Acceleo generator based on the OCCI meta-model.  

Click **File** » **New** » **Acceleo Project**.  
Give your project a name and click **Next**.

![Acceleo Project](/resources/images/code-generators/generator1.png)


In the next window, set the generator options.

![Generator](/resources/images/code-generators/generator2.png)


Click **Finish**. This will open the Acceleo perspective.  
Modify the \*.mtl file with whatever you want to put in the file.

Then execute the generator by following these steps.

1. In the new project, open the **generate.mtl** file from the navigator view (left panel).  
This file is located under the **src** directory, in the project's.main package.

2. Set the generated file name.  
This can be a dynamic expression.

```bash
# Dynamic one
file (extension.name, false, 'UTF-8')

# Static one
file ('configuration.xml', false, 'UTF-8')
```

The static example is on purpose.  
Indeed, a configuration does not have any attribute usable to generate a distinct name.
 
3\. Inside the "file" mark-ups, write the generator: static text, dynamic text using ocl generation, templates calls, etc. 
Please refer to [Acceleo's documentation](http://help.eclipse.org/mars/index.jsp?topic=%2Forg.eclipse.acceleo.doc%2Fpages%2Freference%2Flanguage.html)
for more informations on how to write a generator.
The [extension that generates documentation](https://github.com/occiware/ecore/blob/master/clouddesigner/org.occiware.clouddesigner.occi.gen.doc/src/org/occiware/clouddesigner/occi/gen/doc/main/generate.mtl) can be used as an inspiration.

To test the generator, right-click on the **generate.mtl** file and select **Run as** » **Launch Acceleo application**.  
Add the OCCI meta-model URI: click on the `+` button and select `http://schemas.ogf.org/occi`.
Then, select the input model to use (delete the "xmi" filter in the dialog in order to display all files).
The input model is the root type of the generator (so, either an extension or a configuration, depending on whether you
want to generate from an occie or occic extension).

![Add the OCCI metamodel URI](/resources/images/code-generators/generator3.png)

![Select the root type of the generator](/resources/images/code-generators/generator4.png)


Select the Target (project) directory where the generated files are going to be stored.

![Select the root type of the generator](/resources/images/code-generators/generator5.png)

Eventually...

* Check the **Main template** and **Generate file** options.
* Configuration: Runner => Java Application
* Click **Run**.
* Open the generated file in the target directory to check the result.

![Select a](/resources/images/code-generators/generator6.png)

> To ease the generator's development, you can open both the generator and resulting file and drag one of them.  
> This way, you will view both of them at the same time (some sort of WYSIWYG).  
> To relaunch a generation, hit `CTRL + F11` when the focus is on the generate.mtl file. 
