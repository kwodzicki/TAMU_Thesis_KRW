TAMU LaTeX Thesis Template version 1.0.

This is the first version of the TAMU LaTeX Thesis template created by Kyle R. Wodzicki to use the tamu_thesis document class. The tamu_thesis class was created from a modified version of the TAMU LaTeX Template version 1.7 available at http://howdy.me.

For questions/issues with this template, please email Kyle Wodzicki: wodzicki@tamu.edu. I hope to get the bugs worked out of this template and eventually submit it to the TAMU LaTeX Users’ group

This new version of the template attempts to shift away from using a style file and a large amount of formatting inside the TeX documents to a document class based system that `hides’ formatting from the end user for a more user friendly experience. 


Some of the changes that have been made are:

    -Defining information for the title page has been streamlined, with the committee list auto-filling based on the number of members; There can be up to one (1) chair, one (1) co-chair, and four (4) committee members. If more space is required, a rework of the class file will be required. Must have \maketitle command to generate title

    -Sections such as the abstract, dedication, etc., have been given their own environments.

    -Table of contents generation has been moved from a TeX file into the tamu_thesis class and is generated before the first chapter of the document automatically

    -Extra formatting for chapters has been removed and a \Chapter{} command should be used. This will auto-identify the Introduction chapter, which, per the TAMU Thesis manual MUST be the title of the first chapter

EXTRAS:
  Two bibliography style files for Atmospheric Sciences have been include; the AGU and AMS styles. Many other styles can be used, these are just included as examples

Please note that appendices have NOT been tested.