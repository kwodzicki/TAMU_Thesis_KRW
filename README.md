# TAMU_Thesis_KRW
LaTeX Thesis template for Texas A&amp;M. This template is NOT offically supported through OGAPS.
While comparison between this and the offical template show no major differences, I cannot guarantee
that documents prepared with this template will pass OGAPS quality assurance.

## Major features
* Places all formating in the tamu_thesis class for better end-user experience
  * Options for changing font, margins for binding, etc.
* Supports references at end of chapters OR as a section at the end of the document
* Nomencature/Acronym definitions with usage tracking through document using the [acro][acro] package
  * LaTeX will remember which acronyms have been defined so you don't have to
  * Hover over acronyms for long version can be enabled
* [natbib][natbib] support for bibliography styles that require it

## Thesis Style
This template is designed to meet the requirments outlined by the [Summer 2018 Thesis Manual][thesis manual].
While the thesis manual allows text to be divided into either chapters or major sections, this template currently
only supports the section method. Support for chapter layout may be added in the future

## Using the Template
Unless you are familiary with the LaTeX document preparation system, I highly recommend reading
through the TAMU_Thesis_Main.pdf document before using the template. After you have read through
the document, I suggest going through the TAMU_Thesis_Main.tex document, and all the other .tex
documents in the Data/ directory, one at a time to compare the LaTeX code to the PDF output.
This will help you to understand some of the LaTeX commands and what they do.

## Updates
Check back periodically to make sure that you have the latest version of the template. Unless otherwise stated, you should only need to download the updated tamu_thesis.cls file.

## Issues
If anyone runs into issues when using this template, please submit an issue to this page with your log file and the LaTeX code
that created the error. 

If OGAPS has issue with the formatting in this template, please submit an issue to let me know. That way I can update the 
template to meet their demands.

[thesis manual]: http://ogaps.tamu.edu/getattachment/New-Current-Students/Thesis-and-Dissertation-Services/Thesis_Manual_Summer-2018.pdf.aspx?lang=en-US
[acro]: https://ctan.org/pkg/acro?lang=en
[natbib]: https://ctan.org/pkg/natbib?lang=en
