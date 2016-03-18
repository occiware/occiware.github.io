---
layout: page
title: Using the OCCI Extension Designer
menu: user-guides
cat: OCCIware Studio
version: 1.0
released: false
---

When [you create a new OCCI extension](studio-new-occi-extension.html), it is directly
open in a graphical editor.

This modeler allows you to create new elements for your extension.  
For instance to attach a kind to its parent you can use the *parent edge tool*.  
You can also set the parent in the property view, in the **Semantic tab**.

![Extension](/resources/images/Extension.png "Extension") 


There is also a textual syntax for OCCI, which can be useful for quick editing like search and replace.  
To view an OCCI model as text, simply double click on it (both .occic & .occie are recognized).

![Textual edition](/resources/images/ExtText.png "Textual edition") 


When the extension is ready to use, you can check its correctness by validating it.
To achieve it, right-click in the background of the diagram and select **Validate**.
Then you can register the .occie file in order to use the extension in other models like configurations.

![Register Extension](/resources/images/RegisterExtension.png "Register Extension") 
