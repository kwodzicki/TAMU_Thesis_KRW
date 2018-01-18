%+
% Name:
%   tamu_thesis
% Purpose:
%   This is a class file for Texas A&M Theses and Dissertations. This file will set up all
%   margins, spacing, chapters, title, etc. This is adapted from tamuconfig.sty Version 1.7
%   from Wendy Lynn Turner. This class extends the report class.
% Dependencies:
%   etoolbox    - https://www.ctan.org/pkg/etoolbox?lang=en
%	amsmath     - https://www.ctan.org/pkg/amsmath
%   setspace    - https://www.ctan.org/pkg/setspace
%   tocloft     - https://www.ctan.org/pkg/tocloft
%   titlesec    - https://www.ctan.org/pkg/titlesec
%   indentfirst - https://www.ctan.org/pkg/indentfirst
%   tocvsec2    - https://www.ctan.org/pkg/tocvsec2
%   appendix    - https://www.ctan.org/pkg/appendix
%   graphicx    - https://www.ctan.org/pkg/graphicx
%   float       - https://www.ctan.org/pkg/float
%   caption     - https://www.ctan.org/pkg/caption
%   times       - https://www.ctan.org/pkg/times
% Author and History:
%   Kyle R. Wodzicki     Created 30 Mar. 2016
%
%   Modified 31 Oct. 2016 by Kyle R. Wodzicki
%     Added 'times' package requirement
%     Changed title page 'Major Dept:' to 'Major Subject:'
%     Rearranged and optimized formatting of ToC, LoF, and LoT
%     Fixed spacings to better match that of Sean Zachary Roberson's V3.16.10 release.
%     To the best of my knowledge, this class file should meet the requirements outlined by the 
%     2016 Thesis Manual. This class file has NOT been thoroughly tested!!! DOCUMENT ALL CHANGES!!!!
%
%   Modified 03 Nov. 2016 by Kyle R. Wodzicki
%     Changed the spacing in the table on contents section to fix an issue. There is now only a
%     before chapter skip and the \perto command from the etoolbox package is used to add a space
%     before the first section of a chapter.
%
%	Modified 04 Nov. 2016 by Kyle R. Wodzicki
%	  Modified the appendices environment to remove extraneous files. 
%     These files included and `appendices.tex' file that subsequently
%     referenced `appendix1.tex' and `appendix2.tex'. By redefining the
%     appendices class to include the default behavior and a changed title,
%     now the `appendix1.tex' and `appendix2.tex' files can be included
%     directly from the main .tex file AS LONG AS they are within the
%     appendices environment.
%
%   Modified 07 Nov. 2016 by Kyle R. Wodzicki
%     Changed the \Chapter command definition by removing the \uppercase{}
%     command that was contained in it and moving the uppercase option
%     into the \titleformat{} command. The \titleformat{} command in the 
%     re-defined appendices environment was also updated to reflect the
%     change. This change was performed to remove a waring produced by
%     the hyperref package that was due to the use of the \uppercase{}
%     command within the \chapter{} command.
%-
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tamu_thesis}[2016/03/30 TAMU Thesis Class]


%%% Prohibited report Class Options
%
% Disallow two options of the "report" document class because they are incompatible with TAMU's formatting guidelines.
%
\DeclareOption{twocolumn}{\ClassWarning{tamu_thesis}{The tamu_thesis class does not support the twocolumn option.}}
\DeclareOption{notitlepage}{\ClassWarning{tamu_thesis}{The tamu_thesis class does not support the notitlepage option.}}

%%% Prohibited report Class Page Size Options
%
% Disallow all page size options of the "report" document class other than letterpaper
%
\DeclareOption{a4paper}{\ClassWarning{tamu_thesis}{The tamu_thesis class only supports the letterpaper page size.}}
\DeclareOption{a5paper}{\ClassWarning{tamu_thesis}{The tamu_thesis class only supports the letterpaper page size.}}
\DeclareOption{b5paper}{\ClassWarning{tamu_thesis}{The tamu_thesis class only supports the letterpaper page size.}}
\DeclareOption{legalpaper}{\ClassWarning{tamu_thesis}{The tamu_thesis class only supports the letterpaper page size.}}
\DeclareOption{executivepaper}{\ClassWarning{tamu_thesis}{The tamu_thesis class only supports the letterpaper page size.}}
\DeclareOption{landscape}{\ClassWarning{tamu_thesis}{The tamu_thesis class only supports the portrait page orientation.}}

% Pass any options into the report class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}


% --- Class structure: declaration of options part
\ProcessOptions \relax
\LoadClass[letterpaper,onecolumn,titlepage]{report}

% --- Package requirements
\RequirePackage[
	letterpaper,
	verbose,
	tmargin=1.25in,
	bmargin=1.25in,
	lmargin=1.4in,
	rmargin=1.15in]{geometry}
\RequirePackage{etoolbox}
\RequirePackage{amsmath, amsthm}
\RequirePackage{setspace}
\RequirePackage{tocloft}
\RequirePackage[rm, tiny, center, compact]{titlesec}
\RequirePackage{indentfirst}
\RequirePackage[titletoc]{appendix}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{times}


% --- Fix spacing in captions
\captionsetup[table]{skip=10pt}
\captionsetup[figure]{skip=14pt}	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fix spacing in front of figures
\setlength{\textfloatsep}{3\baselineskip plus 8.0pt minus 4.0pt}
\setlength{\floatsep}{3\baselineskip plus 8.0pt minus 4.0pt}
\setlength{\intextsep}{3\baselineskip plus 8.0pt minus 4.0pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         DEFINE SOME COMMANDS FOR THE TITLE PAGE         %
% --- Title
\newcommand{\Title}[1]{\renewcommand{\@Title}{#1}}				% Setup Title command
\newcommand{\@Title}{Default Title}								% Set the default title
% --- Paper Type
\newcommand{\PaperType}[1]{\renewcommand{\@PaperType}{#1}}		% Setup paper type command
\newcommand{\@PaperType}{(Thesis or Dissertation)}				% Set default paper type
% --- Full Name
\newcommand{\FullName}[1]{\renewcommand{\@FullName}{#1}}		% Setup FullName command
\newcommand{\@FullName}{Full Name}								% Set default full name
% --- Degree
\newcommand{\Degree}[1]{\renewcommand{\@Degree}{#1}}			% Setup Degree command
\newcommand{\@Degree}{Master of Science}						% Set default degree type
% --- Committee Chair
\newcommand{\Chair}[1]{\renewcommand{\@Chair}{#1}}				% Setup Chair command
\newcommand{\@Chair}{Committee Chair}							% Set default chair
% --- Committee Co-Chair
\newcommand{\CoChair}[1]{\renewcommand{\@CoChair}{#1}}			% Setup Chair command
\newcommand{\@CoChair}{default}									% Set default co-chair
% --- Committee member one
\newcommand{\MemberOne}[1]{\renewcommand{\@MemberOne}{#1}}		% Setup MemberOne command
\newcommand{\@MemberOne}{default}								% Set MemberTwo default
% --- Committee member one
\newcommand{\MemberTwo}[1]{\renewcommand{\@MemberTwo}{#1}}		% Setup MemberTwo command
\newcommand{\@MemberTwo}{default}								% Set MemberTwo default
% --- Committee member one
\newcommand{\MemberThree}[1]{\renewcommand{\@MemberThree}{#1}}	% Setup MemberThree command
\newcommand{\@MemberThree}{default}								% Set MemberThree default
% --- Committee member one
\newcommand{\MemberFour}[1]{\renewcommand{\@MemberFour}{#1}}	% Setup MemberFour command
\newcommand{\@MemberFour}{default}								% Set MemberFour default
% --- Department Head
\newcommand{\DeptHead}[1]{\renewcommand{\@DeptHead}{#1}}		% Setup DeptHead command
\newcommand{\@DeptHead}{Department Head}						% Set default department head
% --- Graduation Month
\newcommand{\GradMonth}[1]{\renewcommand{\@GradMonth}{#1}}		% Setup GradMonth command
\newcommand{\@GradMonth}{May}									% Set default GradMonth
% --- Graduation Year
\newcommand{\GradYear}[1]{\renewcommand{\@GradYear}{#1}}		% Setup GradYear command
\newcommand{\@GradYear}{2015}									% Set default Grad Year
% --- Graduation Dept
\newcommand{\Dept}[1]{\renewcommand{\@Dept}{#1}}				% Setup Dept command
\newcommand{\@Dept}{Atmospheric Sciences}						% Set default subject

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determine how many committee members there are and if there is a co-chair. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeCommittee}{
	\ifcase\pdf@strcmp{\@CoChair}{default}						% If there is NO co-chair
    	\ifcase\pdf@strcmp{\@MemberOne}{default}				% If NO members present
			\begin{tabular}{ll}
				Chair of Committee, & \@Chair \\
				Head of Department, & \@DeptHead
			\end{tabular}
		\else
			\ifcase\pdf@strcmp{\@MemberTwo}{default}			% If ONE members present
				\begin{tabular}{ll}
					Chair of Committee, & \@Chair \\
					Committee Members,  & \@MemberOne \\
					Head of Department, & \@DeptHead
				\end{tabular}
			\else
				\ifcase\pdf@strcmp{\@MemberThree}{default}		% If TWO members present
					\begin{tabular}{ll}
						Chair of Committee, & \@Chair \\
						Committee Members,  & \@MemberOne \\
       	 									& \@MemberTwo \\
						Head of Department, & \@DeptHead
					\end{tabular}		
				\else
					\ifcase\pdf@strcmp{\@MemberFour}{default}	% If THREE members present
						\begin{tabular}{ll}
							Chair of Committee, & \@Chair \\
							Committee Members,  & \@MemberOne \\
       	 										& \@MemberTwo \\
                             					& \@MemberThree \\
							Head of Department, & \@DeptHead
						\end{tabular}
					\else										% If ALL the members are present
						\begin{tabular}{ll}
							Chair of Committee, & \@Chair \\
							Committee Members,  & \@MemberOne \\
       	 										& \@MemberTwo \\
                             					& \@MemberThree \\
												& \@MemberFour \\
							Head of Department, & \@DeptHead
						\end{tabular}
					\fi
				\fi
			\fi
		\fi
	\else
		\ifcase\pdf@strcmp{\@MemberOne}{default}				% If NO members present
			\begin{tabular}{ll}
				Chair of Committee, 	& \@Chair \\
				Co-Chair of Committee,	& \@CoChair \\
				Head of Department, 	& \@DeptHead
			\end{tabular}
		\else
			\ifcase\pdf@strcmp{\@MemberTwo}{default}			% If ONE members present
				\begin{tabular}{ll}
					Chair of Committee, 	& \@Chair \\
					Co-Chair of Committee,	& \@CoChair \\
					Committee Members,  	& \@MemberOne \\
					Head of Department, 	& \@DeptHead
				\end{tabular}
			\else
				\ifcase\pdf@strcmp{\@MemberThree}{default}		% If TWO members present
					\begin{tabular}{ll}
						Chair of Committee, 	& \@Chair \\
						Co-Chair of Committee,	& \@CoChair \\
						Committee Members,  	& \@MemberOne \\
       	 										& \@MemberTwo \\
						Head of Department, 	& \@DeptHead
					\end{tabular}		
				\else
					\ifcase\pdf@strcmp{\@MemberFour}{default}	% If THREE members present
						\begin{tabular}{ll}
							Chair of Committee, 	& \@Chair \\
							Co-Chair of Committee,	& \@CoChair \\
							Committee Members,  	& \@MemberOne \\
       	 											& \@MemberTwo \\
                             						& \@MemberThree \\
							Head of Department, 	& \@DeptHead
						\end{tabular}
					\else										% If ALL the members are present
						\begin{tabular}{ll}
							Chair of Committee, 	& \@Chair \\
							Co-Chair of Committee,	& \@CoChair \\
							Committee Members,  	& \@MemberOne \\
       	 											& \@MemberTwo \\
                             						& \@MemberThree \\
													& \@MemberFour \\
							Head of Department, 	& \@DeptHead
						\end{tabular}
					\fi
				\fi
			\fi
		\fi
	\fi
}	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Make Title command (formatting from LaTeX User group title template.)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\titleSpacing}
\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\begin{center}
		\MakeUppercase{\@Title}
		\vspace{3\titleSpacing}

		A \@PaperType{}
      
		by
      
		\MakeUppercase{\@FullName}
		\vspace{4\titleSpacing}  
		   
		\begin{singlespace}
			Submitted to the Office of Graduate and Professional Studies of \\
			Texas A\&M University \\
			in partial fulfillment of the requirements for the degree of \\
		\end{singlespace}
       
       
		\MakeUppercase{\@Degree{}}	
	\end{center}
	\vspace{2\titleSpacing}
	\begin{singlespace}
	      \makeCommittee 								%Create the committee using routine
	\end{singlespace}
	\vspace{3\titleSpacing}

	\begin{center}
		\@GradMonth{} \@GradYear{}

		\vspace{3\titleSpacing}

		Major Subject: \@Dept{}\\
		\vspace{3\titleSpacing}
		Copyright \@GradYear{} \@FullName{}
	\end{center}
	\pagebreak{} 										% Make any text following title on new page
	\pagestyle{plain}									% No headers, just page numbers
	\pagenumbering{roman} 								% Roman numerals
	\setcounter{page}{2}								% Set page counter to 2
}

%%%%%%%%  Remove the extra vertical space before chapter titles when using report class %%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Set up environments for abstract, dedication, etc. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Set up new chapter command with no number; chapter is overwritten later
%\titlespacing*{\chapter}{0pt}{-60pt}{40pt}
\newcommand*{\myChapter}[1]{\chapter*{#1}}
% -- Abstract environment
\renewenvironment{abstract}{
	\myChapter{ABSTRACT}							% Generate chapter title
	\addcontentsline{toc}{chapter}{ABSTRACT}		% Add to table of contents
	\pagestyle{plain}								% Set page style to plain
}{
	\pagebreak{}									% Page break after text
}

% -- Dedication environment
\newenvironment{dedication}{
	\myChapter{DEDICATION}							% Generate chapter title
	\addcontentsline{toc}{chapter}{DEDICATION}		% Add to table of contents
	\pagestyle{plain}\begin{center}\vspace*{\fill}	% Set page style to plain
}{
	\vspace*{\fill}
	\end{center}
	\pagebreak{}									% Page break after text
}

% -- Acknowledgements environment
\newenvironment{acknowledgements}{
	\myChapter{ACKNOWLEDGEMENTS}					% Generate chapter title
	\addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}% Add to table of contents
	\pagestyle{plain}								% Set page style to plain
}{
	\pagebreak{}									% Page break after text
}

% -- Nomenclature Command	
\newcommand{\makenomenclature}{
	\myChapter{NOMENCLATURE}						% Generate chapter title
	\addcontentsline{toc}{chapter}{NOMENCLATURE}	% Add to table of contents
	\vskip-\baselineskip							% Move start of nomenclature up
	\printacronyms									% Print the nomenclature/acronyms
}

% -- Contributors and Funding
\newenvironment{contributors}{
	\myChapter{CONTRIBUTORS AND FUNDING SOURCES}
	\addcontentsline{toc}{chapter}{CONTRIBUTORS AND FUNDING SOURCES} 
	\pagestyle{plain}
}{
	\pagebreak{}									% Page break after text
}

% -- References environment
\newenvironment{references}{
	\phantomsection
	\addcontentsline{toc}{chapter}{REFERENCES}
	\renewcommand{\bibname}{{\normalsize\rm REFERENCES}}
}{}

% -- Appendices environment
\let\myappendices\appendices				% Store default settings of \begin{appendice}
\let\endmyappendices\endappendices			% Store default settings of \end{appendices}
\renewenvironment{appendices}{				% Define new appendices environment
	\myappendices							% Load default appendices settings
	\renewcommand{\appendixname}{APPENDIX}	% Set new appendix name
	\titleformat{\chapter}					% Edit chapter title format for appendices
		{\centering\normalsize\uppercase}	% Set title to be centered and normal size
		{\appendixname{} \thechapter}		% Set the new title name to APPENDIX `chap'
		{0em}								% Set marign before the title
		{\vskip0.5\baselineskip\centering}	% Set margin after the title
}{
	\endmyappendices
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- TABLE OF CONTENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- This puts \subsubsection[]{×} in your List of Tables.  The default is 3
%\setcounter{tocdepth}{4}

%%% Customizations for fonts/leaders in ToC
\renewcommand{\cftchapfont}{\normalsize\rm}				% Set chapter font
\renewcommand{\cftchappagefont}{\normalsize\rm}			% Set chapter page font
\renewcommand{\cftchapleader}{
	\normalsize\rm\cftdotfill{\cftdotsep}
}														% Set chapter leader
\renewcommand{\cftchapaftersnum}{.} 					% Add a period after chapter numbers.

\renewcommand\cftsecfont{\normalfont}					% Set section font
\renewcommand\cftsecpagefont{\normalfont}				% Set section page font

\renewcommand\cftpartfont{\normalfont}					% Set part page font
\renewcommand\cftpartpagefont{\normalfont}				% Set part page font
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}	% Add leader dots for parts

%%% Spacing for the chapters/sections/parts
\renewcommand{\cftaftertoctitleskip}{0pt}				% Set spacing after TOC Title
\renewcommand{\cftaftertoctitle}{						% Adds Page above the page number in TOC
	\vskip-\baselineskip\hfill{\normalfont{Page}}		% The negative baselineskip moves `Page' up to match old templates
}
\renewcommand{\cftbeforepartskip}{\baselineskip}		% Set spacing before parts in TOC
\renewcommand{\cftbeforechapskip}{\baselineskip}		% Set spacing before chapters in TOC
\preto\section{											% Double space between chapter and first section
	\ifnum\value{section}=0
		\addtocontents{toc}{\vskip\baselineskip}
	\fi
 }
 
%%% Formatting for List of Figures
\renewcommand{\cftbeforeloftitleskip}{-\baselineskip} 				% Position LOF title to match chapter titles
\renewcommand{\cftafterloftitleskip}{\baselineskip}					% Set after title skip
\renewcommand{\cftloftitlefont}{\hfill\normalfont\MakeUppercase}	% Format list of figures title
\renewcommand{\cftafterloftitle}{
	\hfill\mbox{}\vskip3\baselineskip FIGURE\hfill{\normalfont Page}% Add FIGURE Page after LoF Title
}
\renewcommand{\cftfigafterpnum}{\vskip\f@size pt}					% Set vertical skip after page numbers to font size
\renewcommand{\cftbeforefigskip}{0pt}								% Set vertical skip before entries to 0pt

%%% Spacing for List of Tables
\renewcommand{\cftbeforelottitleskip}{-\baselineskip} 				% Position LOT title vertically - match chapter titles
\renewcommand{\cftafterlottitleskip}{\baselineskip}
\renewcommand{\cftlottitlefont}{\hfill\normalfont\MakeUppercase}	% Format list of tables title

\renewcommand{\cftafterlottitle}{%
	\hfill\mbox{}\vskip3\baselineskip TABLE\hfill{\normalfont Page}	% Add TABLE Page after LoT Title
}
\renewcommand{\cfttabafterpnum}{\vskip\f@size pt}					% Set vertical skip after page numbers to font size
\renewcommand{\cftbeforetabskip}{0pt}								% Set vertical skip before entries to 0pt

%%% Set up the \makeToC command
\newcommand{\makeToC}{
	%%	TABLE OF CONTENTS
    \phantomsection											% Phantom section for proper hyperref links
    \addcontentsline{toc}{chapter}{TABLE OF CONTENTS}		% Add table of contents to ToC
	\renewcommand\contentsname{\normalfont}{				% Format table of contents title
		\centerline{TABLE OF CONTENTS}
	}
	
   	\begin{singlespace}\tableofcontents\end{singlespace}	% Generate ToC in single space environment
    \pagebreak{}											% Insert a page break
    
    %%	LIST OF FIGURES
    \phantomsection											% Phantom section for proper hyperref links
    \addcontentsline{toc}{chapter}{LIST OF FIGURES}			% Add list of figures to ToC

    \begin{singlespace}\listoffigures\end{singlespace}		% Generate LoF in single space environment
    \pagebreak{}											% Insert a page break
    
    %%	LIST OF TABLES
	\phantomsection											% Phantom section for proper hyperref links
	\addcontentsline{toc}{chapter}{LIST OF TABLES} 			% Add list of tables to ToC

	\begin{singlespace}\listoftables\end{singlespace}		%	Generate LoF in single space environment
    \pagebreak{}  											% Insert page break 
}															% END of makeToC command

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Set new page numbering at beginning of first chapter. All others don't matter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IF it is, clear the page
% No headers, just page numbers
% Change page numbers to arabic numerals
% Set the page counter to one (1)
% Generate the chapter header in all uppercase
\newcommand{\Chapter}[1]{							% Redefine chapter command
	\lowercase{\ifcase\pdf@strcmp{#1}{introduction}}% Do lowercase string comparison to check for first chapter
		\makeToC									% Make the table of contents
		\pagestyle{plain}							% Set the page style to plain
		\pagenumbering{arabic}						% Set the page numbering to arabic
		\setcounter{page}{1}						% Set the page counter to 1
	\fi
	\chapter{#1}			            			% Use chapter command 
	\acresetall										% Reset all acronym usages for the document
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Titlesec Customations 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\chapter}{\centering\normalsize\uppercase}{\thechapter.}{1em}{}
\titleformat{\section}{\bf\normalsize}{\thesection}{1em}{}
\titleformat{\subsection}{\bf\normalsize}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\centering\normalsize\it}{\thesubsubsection}{1em}{}

\titlespacing{\chapter}{0pt}{-18pt}{\baselineskip}
\titlespacing{\section}{0pt}{0.25\baselineskip}{0.25\baselineskip}
\titlespacing{\subsection}{0pt}{0.25\baselineskip}{0.25\baselineskip}

\setcounter{secnumdepth}{5}

\addtocontents{toc}{\protect\renewcommand{\protect\cftchapleader}
        {\protect\cftdotfill{\cftsecdotsep}}}  % puts leader dots on chapters.

\endinput