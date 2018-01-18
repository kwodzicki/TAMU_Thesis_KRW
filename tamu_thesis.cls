%+
% Name:
%   tamu_thesis
% Purpose:
%   This is a class file for Texas A&M Theses and Dissertations. This file will set up all
%   margins, spacing, chapters, title, etc. This is adapted from tamuconfig.sty Version 1.7
%   from Wendy Lynn Turner. This class extends the report class.
% Author and History:
%   Kyle R. Wodzicki     Created 30 Mar. 2016
%
%   Modified 31 Oct. 2016 by Kyle R. Wodzicki
%     Added 'times' package requirement
%     Changed title page 'Major Dept:' to 'Major Subject:'
%     Rearranged and optimized formatting of ToC, LoF, and LoT
%     To the best of my knowledge, this class file should meet the requirements outlined by the 
%     2016 Thesis Manual. This class file has NOT been thoroughly tested!!! DOCUMENT ALL CHANGES!!!!
%-
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tamu_thesis}[2016/03/30 TAMU Thesis Class]


% Pass any options into the report class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}


% --- Class structure: declaration of options part
\ProcessOptions \relax
\LoadClass{report}

% --- Package requirements
\RequirePackage[letterpaper,verbose,tmargin=1.25in,bmargin=1.25in,lmargin=1.4in,rmargin=1.15in]{geometry}
%\RequirePackage{etoolbox}
%\RequirePackage{pdftexcmds}
\RequirePackage{setspace}
\RequirePackage{tocloft}
\RequirePackage[rm, tiny, center, compact]{titlesec}
\RequirePackage{indentfirst}
\RequirePackage{tocvsec2}
\RequirePackage[titletoc]{appendix}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{rotating}
\RequirePackage{natbib}
\RequirePackage{times}

% --- Fix spacing in captions
\RequirePackage{caption} 
\captionsetup[table]{skip=10pt}
\captionsetup[figure]{skip=14pt}	

\usepackage{lipsum}
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
\newcommand{\Dept}[1]{\renewcommand{\@Dept}{#1}}			% Setup Dept command
\newcommand{\@Dept}{Atmospheric Sciences}					% Set default subject

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
		\vspace{4\titleSpacing}

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
	\pagenumbering{roman} 							% Roman numerals
	\setcounter{page}{2}								% Set page counter to 2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Set up environments for abstract, dedication, etc. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Set up new chapter command with no number; chapter is overwritten later
\newcommand*{\myChapter}[1]{\chapter*{#1}}
% -- Abstract environment
\renewenvironment{abstract}{
	\myChapter{ABSTRACT}						% Generate chapter title
	\addcontentsline{toc}{part}{ABSTRACT}	% Add to table of contents
	\pagestyle{plain}							% Set page style to plain
}{
	\pagebreak{}								% Page break after text
}

% -- Dedication environment
\newenvironment{dedication}{
	\myChapter{DEDICATION}						% Generate chapter title
	\addcontentsline{toc}{part}{DEDICATION}	% Add to table of contents
	\pagestyle{plain}							% Set page style to plain
}{
	\pagebreak{}								% Page break after text
}

% -- Acknowledgements environment
\newenvironment{acknowledgements}{
	\myChapter{ACKNOWLEDGEMENTS}						% Generate chapter title
	\addcontentsline{toc}{part}{ACKNOWLEDGEMENTS}	% Add to table of contents
	\pagestyle{plain}									% Set page style to plain
}{
	\pagebreak{}										% Page break after text
}

% -- Nomenclature environment
\newenvironment{nomenclature}{
	\myChapter{NOMENCLATURE}						% Generate chapter title
	\addcontentsline{toc}{part}{NOMENCLATURE}	% Add to table of contents
	\pagestyle{plain}								% Set page style to plain
}{
	\pagebreak{}									% Page break after text
}

% -- References environment
\newenvironment{references}{
	\phantomsection
	\addcontentsline{toc}{part}{REFERENCES}
	\renewcommand{\bibname}{{\normalsize\rm REFERENCES}}
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- TABLE OF CONTENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- This puts \subsubsection[]{×} in your List of Tables.  The default is 3
%\setcounter{tocdepth}{4}

%%% Customizations for fonts/leaders in ToC
\renewcommand{\cftchapfont}{\normalsize\rm}						% Set chapter font
\renewcommand{\cftchappagefont}{\normalsize\rm}					% Set chapter page font
\renewcommand{\cftchapleader}{
	\normalsize\rm\cftdotfill{\cftdotsep}
}																% Set chapter leader
\renewcommand{\cftchapaftersnum}{.} 							% Add a period after chapter numbers.

\renewcommand\cftsecfont{\normalfont}							% Set section font
\renewcommand\cftsecpagefont{\normalfont}						% Set section page font

\renewcommand\cftpartfont{\normalfont}							% Set part page font
\renewcommand\cftpartpagefont{\normalfont}						% Set part page font
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}} 			% Add leader dots for parts

%%% Spacing for the chapters/sections/parts
\renewcommand{\cftaftertoctitleskip}{0pt}					% Set spacing after TOC Title
\renewcommand{\cftaftertoctitle}{\hfill{\normalfont{Page}}}	% Adds Page above the page number in TOC
\renewcommand{\cftbeforepartskip}{\baselineskip}			% Set spacing before parts in TOC
\renewcommand{\cftbeforechapskip}{\baselineskip}			% Set spacing before chapters in TOC
\renewcommand{\cftchapafterpnum}{\vskip\baselineskip}		% Set spacing after chapters in TOC

%%% Formatting for List of Figures
\renewcommand{\cftbeforeloftitleskip}{-12pt} 					% Position LOF title to match chapter titles
\renewcommand{\cftafterloftitleskip}{0pt}						% Set after title skip
\renewcommand{\cftloftitlefont}{\hfill\normalfont\MakeUppercase}% Format list of figures title
\renewcommand{\cftafterloftitle}{
	\hfill\mbox{}\vskip4\baselineskip FIGURE\hfill{\normalfont Page}	% Add FIGURE Page after LoF Title
}
\renewcommand{\cftfigafterpnum}{\vskip\baselineskip}
\renewcommand{\cftbeforefigskip}{0pt}

%%% Spacing for List of Tables
\renewcommand{\cftbeforelottitleskip}{-12pt} %% Position LOT title vertically - match chapter titles
\renewcommand{\cftafterlottitleskip}{0pt}
\renewcommand{\cftlottitlefont}{\hfill\normalfont\MakeUppercase}% Format list of tables title

\renewcommand{\cftafterlottitle}{%
	\hfill\mbox{}\vskip4\baselineskip TABLE\hfill{\normalfont Page}		% Add TABLE Page after LoT Title
}
\renewcommand{\cfttabafterpnum}{\vskip\baselineskip}
\renewcommand{\cftbeforetabskip}{0pt}

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
    \addcontentsline{toc}{part}{LIST OF FIGURES}			% Add list of figures to ToC

    \begin{singlespace}\listoffigures\end{singlespace}		% Generate LoF in single space environment
    \pagebreak{}											% Insert a page break
    
    %%	LIST OF TABLES
	\phantomsection											% Phantom section for proper hyperref links
	\addcontentsline{toc}{part}{LIST OF TABLES} 			% Add list of tables to ToC

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
% Generate the chapter header in all uppercase
\newcommand{\Chapter}[1]{							% Redefine chapter command
	\lowercase{\ifcase\pdf@strcmp{#1}{introduction}}% Do lowercase string comparison
		\makeToC
		\pagestyle{plain}
		\pagenumbering{arabic}
		\setcounter{page}{1}
	\fi
	\chapter{\uppercase{#1}}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Titlesec Customations 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand{\thechapter}{\Roman{chapter}}
\titleformat{\chapter}{\centering\normalsize}{\thechapter.}{1em}{}
\titleformat{\section}{\centering\normalsize}{\thesection}{1em}{}
\titleformat{\subsection}{\centering\normalsize\it}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\centering\normalsize\it}{\thesubsubsection}{1em}{}

\titlespacing{\chapter}{0pt}{0pt}{\baselineskip}
\titlespacing{\section}{0pt}{0.25\baselineskip}{0.25\baselineskip}
\titlespacing{\subsection}{0pt}{0.25\baselineskip}{0.25\baselineskip}

\setcounter{secnumdepth}{5}

\addtocontents{toc}{\protect\renewcommand{\protect\cftchapleader}
        {\protect\cftdotfill{\cftsecdotsep}}}  % puts leader dots on chapters.

%%%% Old code, Not sure what it does!
%\preto\figure{%  Removes the extra space added before new chapters
%  \ifnum\value{figure}=0\addtocontents{lof}{\vskip-10pt}\fi
%}
%\preto\table{%  Removes the extra space added before new chapters
%  \ifnum\value{table}=0\addtocontents{lot}{\vskip-10pt}\fi
%}
%
% \preto\section{%  Removes the extra space added before new chapters
%  \ifnum\value{section}=0\addtocontents{toc}{\vskip+10pt}\fi
% }