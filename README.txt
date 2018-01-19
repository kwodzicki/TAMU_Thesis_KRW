TAMU LaTeX Thesis Template version 0.17.9

Kyle R. Wodzicki

10 Sep. 2017

—————
About
—————
This version of the TAMU LaTeX template was designed to reduce the amount of end-user formatting required. The template uses the tamu_thesis class. All of the example code in the template is taken from the OGAPS template.

—————
Using the template.
—————



———————
Changes
——————-
V0.17.9
  Update spacing to match the OGAPS Spring 2018 template. Also add the option to have Reference sections at the end of each chapter.

V0.17.6
  Changed the spacing in the title page and the table of contents to better match that of the Jun2017 OGAPS template

V0.16.12b
  Removed the use of \baselineskip from the class file and replaced with the \singleSpace command.

V0.16.12a
  Change in how the formatting from the abstract, dedication, etc, ToC section to the main text of the thesis occurs. Changed the custom ‘Chapter’ command to only contain \chapter{\uppercase{}}

V0.16.12
 Changed the construction of the committee from a tabular set up to minipages.
 Changed user input fields such as \Title and \FullName from commands to tokens. Not sure exactly how they work, but they make if statements much easier to work with and allows for changing of spacings much easier. This makes the code for and auto-spacing of the title page much cleaner.

V0.16.10
  Updated spacings of chapter headings to better match that of the V3.16.10 release from OGAPS
  Changed sub/subsub section headings to match the V3.16.10 release
  Tested to ensure that appendixes work - they do.
  Fixed some spacing issues on the title page
  Added the Contributors and Funding section