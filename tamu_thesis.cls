%+
% Name:
%   tamu_thesis
% Purpose:
%   This is a class file for Texas A&M Theses and Dissertations. This file will 
%   set up all margins, spacing, chapters, title, etc. This is adapted from 
%   tamuconfig.sty Version 1.7 from Wendy Lynn Turner. This class extends the 
%   report class.
% Dependencies:
%   etoolbox    - https://www.ctan.org/pkg/etoolbox?lang=en
%    amsmath     - https://www.ctan.org/pkg/amsmath
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
%   Modified 18 Jan. 2018 by Kyle R. Wodzicki
%     Updated some spacing in the ToC and around figures
%     to better match the  v3.17.09 version
%     Also added ability to place reference section
%     at end of each chapter using the bibunits
%     package. This added the 'chapref' option
%     to the class
%
%   Modified 31 Oct. 2016 by Kyle R. Wodzicki
%     Added 'times' package requirement
%     Changed title page 'Major Dept:' to 'Major Subject:'
%     Rearranged and optimized formatting of ToC, LoF, and LoT
%     Fixed spacings to better match that of Sean Zachary Roberson's V3.16.10 
%     release. To the best of my knowledge, this class file should meet the
%     requirements outlined by the 2016 Thesis Manual. This class file has NOT
%     been thoroughly tested!!! DOCUMENT ALL CHANGES!!!!
%
%   Modified 03 Nov. 2016 by Kyle R. Wodzicki
%     Changed the spacing in the table on contents section to fix an issue.
%     There is now only a before chapter skip and the \perto command from the
%     etoolbox package is used to add a space before the first section of a
%     chapter.
%
%  Modified 04 Nov. 2016 by Kyle R. Wodzicki
%    Modified the appendices environment to remove extraneous files. 
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
%
%   Modified 30 Nov. 2016 by Kyle R. Wodzicki
%     Changed the construction of the committee from a tabular set up to
%     minipages. Changed user input fields such as \Title and \FullName from
%     commands to tokens. Not sure exactly how they work, but they make if
%     statements much easier to work with and allows for changing of spacings
%     much easier. This makes the code for and auto-spacing of the title page
%     much cleaner.
%
%   Modified 30 Nov. 2016 by Kyle R. Wodzicki
%     Redefine \chapter command to make chapters all upper case.
%     Redefine \makeToC command to contain the options in the deprecated 
%     'Chapter' command responsible for setting up page numbering in main
%     text of thesis.
%     Changed \makenomencalture command to \makeNomenclature
%
%   Modified 14 Dec. 2016 by Kyle R. Wodzicki
%     Replaced \baselineskip commands with the \singleSpace command
%   Modified 06 May 2017 by Kyle R. Wodzicki
%
%     Updated the spacing in the TOCLOTF so that the spacing matched the
%     TAMU LaTeX (Jan2017) template. Updated section number depth for
%     TOC
%   Modified 11 May 2018 by Kyle R. Wodzicki
%     Updated to ensure matches the Spring 2018 LaTeX Template
%   Modified 15 May 2018 by Kyle R. Wodzicki
%     Changed loading of natbib package to be an option of the class.
%     If natbib was loaded and not required for the bibliography style,
%     an error was produced on compile. Thus, if one needs natbib for their
%     citation style, they just have to add the natbib option in the
%     \documentclass{} command.
%   Modified Aug. 2018 by Kyle R. Wodzicki
%     Must update to meet requirements of fall 2018 manual
%-
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tamu_thesis}[2018/08/01 v0.18.08 Texas A&M Thesis class]


%%% Prohibited report Class Options
% Disallow two options of the "report" document class because they are
% incompatible with TAMU's formatting guidelines.
\DeclareOption{twocolumn}{\ClassWarning{tamu_thesis}{
  The tamu_thesis class does NOT support the twocolumn option.}}
\DeclareOption{notitlepage}{\ClassWarning{tamu_thesis}{
  The tamu_thesis class does NOT support the notitlepage option.}}

%%% Prohibited report Class Page Size Options
% Disallow all page size options of the "report" document class other than 
% letterpaper
\DeclareOption{a4paper}{\ClassWarning{tamu_thesis}{
  The tamu_thesis class only supports the letterpaper page size.}}
\DeclareOption{a5paper}{\ClassWarning{tamu_thesis}{
  The tamu_thesis class only supports the letterpaper page size.}}
\DeclareOption{b5paper}{\ClassWarning{tamu_thesis}{
  The tamu_thesis class only supports the letterpaper page size.}}
\DeclareOption{legalpaper}{\ClassWarning{tamu_thesis}{
  The tamu_thesis class only supports the letterpaper page size.}}
\DeclareOption{executivepaper}{\ClassWarning{tamu_thesis}{
  The tamu_thesis class only supports the letterpaper page size.}}
\DeclareOption{landscape}{\ClassWarning{tamu_thesis}{
  The tamu_thesis class only supports the portrait page orientation.}}

% Pass any options into the report class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% Declare some if,else variables
\newif\if@chapter\@chapterfalse                                                 % Set up new if variable for using the chapter method; default is section method
\newif\if@arial\@arialfalse                                                     % Set up new if variable for arial option; default is Times New Roman
\newif\if@onehalfspacing\@onehalfspacingfalse                                   % Set up new if variable for one half spacing; default is double spacing
\newif\if@binding\@bindingfalse                                                 % Set up new if variable for binding (changes left margin); default is no binding
\newif\if@natbib\@natbibfalse                                                   % Set up new if variable for natbib (loads natbib package); default is to NOT load natbib
\newif\ifchapref\chapreffalse                                                   % Set up new if variable for chapref (references at end of chapter); default is references at end of document
\newif\if@acroall\@acroallfalse                                                 % Set up new if variable for all
\newif\if@acrohover\@acrohoverfalse                                             % Set up new if variable for hover

% There is no @ in the \chapref because it is used in the main document

% Declare the class options
\DeclareOption{chapter}{\@chaptertrue}                                          % Declare option for `chapter', set true if used
\DeclareOption{arial}{\@arialtrue}                                              % Declare option for `arial', set true if used
\DeclareOption{onehalfspacing}{\@onehalfspacingtrue}                            % Declare option for `onehalfspacing', set true if used
\DeclareOption{binding}{\@bindingtrue}                                          % Declare option for `binding', set true if used
\DeclareOption{natbib}{\@natbibtrue}                                            % Declare option for `natbib', set true if used
\DeclareOption{chapref}{\chapreftrue}                                           % Declare option for `chapref', set true if used
\DeclareOption{acroall}{\@acroalltrue}                                          % Declare option for `all', set true if used
\DeclareOption{acrohover}{\@acrohovertrue}                                      % Declare option for `hover', set true if used

% Class structure: declaration of options part
\ProcessOptions \relax
\LoadClass[letterpaper,onecolumn,titlepage]{report}

% Package requirements
% Adjust left margin if binding is set
\if@binding                                                                     % If binding is true
	\RequirePackage[letterpaper, verbose,
		tmargin=1in, bmargin=1in, lmargin=1.4in, rmargin=1in]{geometry}             % set left margin to 1.4 inches and all others to 1 inch
\else                                                                           % Binding is false
	\RequirePackage[letterpaper, verbose, margin=1in]{geometry}                   % Set all margins to 1 inch
\fi


\RequirePackage{etoolbox}
\RequirePackage{amsmath}
\RequirePackage{setspace}
\RequirePackage{float}
\RequirePackage[rm, tiny, center, compact]{titlesec}
\RequirePackage{tocloft}
\RequirePackage{indentfirst}
\RequirePackage[titletoc]{appendix}
\RequirePackage{graphicx}
\RequirePackage[font=small]{caption}
\RequirePackage{fontspec}
\RequirePackage[T1]{fontenc}
\RequirePackage{acro}			                                                      % Load acro package
\RequirePackage{longtable,tabu}                                                 % Load table packages

%%% Set the document font based on the arial option; default to Times New Roman
\if@arial
  \setmainfont{Arial}
\else
  \setmainfont{Times New Roman}
\fi

\ifchapref\RequirePackage{bibunits}\fi                                          % If chap references requested, require the bibunits package
\if@natbib\RequirePackage{natbib}\fi

\newlength{\singleSpace}                                                        % Define a new length for the single spacing
\setlength{\singleSpace}{\baselineskip}                                         % Set single line spacing to the size of the font
\doublespacing
\newlength{\doubleSpace}                                                        % Define a new length for the single spacing
\setlength{\doubleSpace}{\baselineskip}                                         % Set single line spacing to the size of the font

\newlength{\titleSpacing}                                                       % Define a new length for spacing at bottom of title page
\setlength{\titleSpacing}{2\doubleSpace}                                        % Set the length to 3 single spaces

\if@onehalfspacing\onehalfspacing\else\doublespacing\fi                         % Set document spacing


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fix spacing in front of figures
\setlength{\textfloatsep}{40pt plus 8.0pt minus 4.0pt}
\setlength{\floatsep}{40pt plus 8.0pt minus 4.0pt}
\setlength{\intextsep}{40pt plus 8.0pt minus 4.0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         DEFINE SOME COMMANDS FOR THE TITLE PAGE         %
\newtoks{\Title}                                                                % Title
\newtoks{\PaperType}                                                            % Paper Type
\newtoks{\FullName}                                                             % Full Name
\newtoks{\Degree}                                                               % Degree
\newtoks{\Chair}                                                                % Committee Chair
\newtoks{\CoChair}                                                              % Committee Co-Chair
\newtoks{\MemberOne}                                                            % Committee member one
\newtoks{\MemberTwo}                                                            % Committee member two
\newtoks{\MemberThree}                                                          % Committee member three
\newtoks{\MemberFour}                                                           % Committee member four
\newtoks{\DeptHead}                                                             % Department Head
\newtoks{\GradMonth}                                                            % Graduation Month
\newtoks{\GradYear}                                                             % Graduation Year
\newtoks{\Dept}                                                                 % Graduation Dept


\def\biblioStyle{plain}                                                         % Define default bibliography style
\def\biblioFile{myReferences}                                                   % Define default bibliography file
\newcommand{\bibStyle}[1]{\def\biblioStyle{#1}}                                 % Command to set the bibliography style
\newcommand{\bibFile}[1]{\def\biblioFile{#1}}                                   % Command to set the bibliography file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         DEFINE SOME COMMANDS FOR ENVIRONMENTS           %
\newcommand{\abstractName}{ABSTRACT}
\newcommand{\dedicationName}{DEDICATION}
\newcommand{\acknowledgeName}{ACKNOWLEDGEMENTS}
\newcommand{\nomenclatureName}{NOMENCLATURE}
\newcommand{\contribName}{CONTRIBUTORS AND FUNDING SOURCES}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         REDEFINE SOME COMMANDS FOR TOCLOFT and BIB      %
\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\listfigurename}{LIST OF FIGURES}
\renewcommand{\listtablename}{LIST OF TABLES}
\renewcommand{\bibname}{References}                                             % Change name of the bibiligraphy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    TITLE CUSTOMATIONS      TITLE CUSTOMATIONS      TITLE CUSTOMATIONS   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@chapter                                                                     % If chapter method is requested
	\renewcommand{\thechapter}{\Roman{chapter}}
	\titleformat{\chapter}{\centering\normalsize\uppercase}{CHAPTER \thechapter}{1em}{}
\else
	\titleformat{\chapter}{\centering\normalsize\uppercase}{\thechapter.}{1em}{}
\fi

\titleformat{\section}{\bf\normalsize}{\thesection}{1em}{}
\titleformat{\subsection}{\bf\normalsize}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\centering\normalsize\it}{\thesubsubsection}{1em}{}

\titlespacing{\chapter}{0pt}{0pt}{2\singleSpace}
\titlespacing{\section}{0pt}{0.5\singleSpace}{0.5\singleSpace}
\titlespacing{\subsection}{0pt}{0.5\singleSpace}{0.5\singleSpace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   NOMENCLATURE SETUP        NOMENCLATURE SETUP       NOMENCLATURE SETUP    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareAcroListStyle{acros}{table}{                                            % Set up the style of the table
  table = longtabu,                                                             % Set table type to longtabu
  before = \singlespacing\vskip-\singleSpace\renewcommand\arraystretch{2},      % Set to single space within acronym and double between
  table-spec = @{}>{\setlength\hsize{0.6\hsize}}X>{\setlength\hsize{1.4\hsize}}X@{}             % Set the table specifications
}
% In the table-spec, not sure where that @{} does, but the rest
% sets up tabularx style columns that will adjust to the text width
% with the first column being about 1/3 the width and the second about 2/3
\acsetup{list-style=acros,list-heading=none}                                    % Set the acronym `list-style', and `list-heading'
\if@acroall\acsetup{only-used=false}\fi                                         % Set the acronym `only-used' option to false
\if@acrohover\acsetup{tooltip=true}\fi                                          % Set the acronym 'tooltip' option to true
\input{./Data/nomenclature}										                                  % Acronyms are defined in the nomenclature.tex file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     ENVIRONMENTS              ENVIRONMENTS                 ENVIRONMENTS    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Abstract environment
\renewenvironment{abstract}{
  \chapter*{\abstractName}
  \phantomsection
  \addcontentsline{toc}{chapter}{\abstractName}                                 % Add to table of contents
  \pagestyle{plain}                                                             % Set page style to plain
}{
  \clearpage                                                                    % Page break after text
}                          
                          
% -- Dedication environment                          
\newenvironment{dedication}{                          
  \chapter*{\dedicationName}
  \phantomsection
  \addcontentsline{toc}{chapter}{\dedicationName}                               % Add to table of contents
  \pagestyle{plain}\vskip\fill\begin{center}                                    % Set page style to plain, center text, and add vertical fill before text
}{
  \end{center}\vskip\fill\pagebreak{}                                           % Page break after text
}

% -- Acknowledgements environment
\newenvironment{acknowledgements}{
  \chapter*{\acknowledgeName}
  \phantomsection
  \addcontentsline{toc}{chapter}{\acknowledgeName}                              % Add to table of contents
  \pagestyle{plain}                                                             % Set page style to plain
}{
  \clearpage                                                                    % Page break after text
}

% -- Nomenclature Command  
\newcommand{\makeNomenclature}{
  \chapter*{\nomenclatureName}
  \phantomsection
  \addcontentsline{toc}{chapter}{\nomenclatureName}                             % Add to table of contents
  \vspace{\singleSpace}                                                         % Move start of nomenclature up
  \printacronyms                                                                % Print the nomenclature/acronyms
}

% -- Contributors and Funding
\newenvironment{contributors}{
  \chapter*{\contribName}
  \phantomsection
  \addcontentsline{toc}{chapter}{\contribName}                                  % Add to table of contents
  \pagestyle{plain}                                                             % Set page style to plain
}{
  \clearpage                                                                    % Page break after text
}

% -- Appendices environment
\let\myappendices\appendices                                                    % Store default settings of \begin{appendice}
\let\endmyappendices\endappendices                                              % Store default settings of \end{appendices}
\renewenvironment{appendices}{                                                  % Define new appendices environment
  \myappendices                                                                 % Load default appendices settings
  \renewcommand{\appendixname}{APPENDIX}                                        % Set new appendix name
  \titleformat{\chapter}                                                        % Edit chapter title format for appendices
    {\centering\normalsize\uppercase}                                           % Set title to be centered and normal size
    {\appendixname{} \thechapter}                                               % Set the new title name to APPENDIX `chap'
    {0em}                                                                       % Set marign before the title
    {\vskip\singleSpace\centering}                                              % Set margin after the title
}{                       
  \endmyappendices                                                              % End the appendix
}

% --- Redefine bibliography to exclude empty
\renewcommand{\bibname}{{\normalsize\rm REFERENCES}}                            % Change name of the bibiligraphy
\let\origthebibliography\thebibliography                                        % Store default \begin{thebibliography}
\let\origendthebibliography\endthebibliography                                  % Store default \end{thebibliography}
\newif\ifemptybibliography\emptybibliographyfalse                               % Create new if
\renewenvironment{thebibliography}[1]{
  \ifnum0#1=0                                                                   % If there are zero (0) references
    \emptybibliographytrue                                                      % Set the emptybibliography variable to true
  \else                                                                         % Else, the macro was NOT empty
    \ifchapref                                                                  % If references at the end of each chapter requested
      \renewcommand{\chapter}[2]{}                                              % Redefine the chapter command to be empty; removes bib heading
      \section{References}                                                      % Create a References section
    \fi                                                  
    \origthebibliography{#1}                                                    % Run the old bibliography
  \fi                                                
}{                                                
  \ifemptybibliography\else                                                     % If emptybibliography is true, do nothing, else
	  \origendthebibliography                                                     % End the bibliography
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       TABLE OF CONTENTS FORMAT         TABLE OF CONTENTS FORMAT          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- This puts \subsubsection[]{×} in your List of Tables.  The default is 3
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{4}

\renewcommand{\cftdotsep}{1.00}                                                 % Adjusts the size of the leader dot separation.
\addtocontents{toc}{                                                            % Puts leader dots on chapters.
  \protect\renewcommand{\protect\cftchapleader}{
    \protect\cftdotfill{\cftsecdotsep}
  }
}

%%% ToC Font specifications
\renewcommand{\cfttoctitlefont}{\hfill\normalsize}                              % Font for ToC Title
\renewcommand{\cftloftitlefont}{\hfill\normalfont}                              % Font for LoF Title
\renewcommand{\cftlottitlefont}{\hfill\normalfont}                              % Font for LoT Title
\renewcommand{\cftchapfont}{\normalsize}                                        % Font for chapter names
\renewcommand{\cftsecfont}{\normalfont}                                         % Font for section names
\renewcommand{\cftpartfont}{\normalfont}                                        % Font for part names

%%% ToC Page number fonts
\renewcommand{\cftchappagefont}{\normalsize\rm}                                 % Set chapter page font
\renewcommand{\cftsecpagefont}{\normalfont}                                     % Set section page font
\renewcommand{\cftpartpagefont}{\normalfont}                                    % Set part page font

%%% ToC Leaders to page numbers
\renewcommand{\cftchapleader}{\normalsize\rm\cftdotfill{\cftdotsep}}            % Set chapter leader
\renewcommand{\cftchapaftersnum}{.}                                             % Add a period after chapter numbers.
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}                          % Add leader dots for parts

%%% ToC Spacing before titles
\setlength{\cftbeforetoctitleskip}{-\singleSpace}                               % Set spacing before the ToC Title
\setlength{\cftbeforeloftitleskip}{-\singleSpace}                               % Set spacing before the LoF Title
\setlength{\cftbeforelottitleskip}{-\singleSpace}                               % Set spacing before the LoT Title

%%% ToC Spacing after titles
\setlength{\cftaftertoctitleskip}{2ex}                                          % Set spacing after the LoF Title
\setlength{\cftafterloftitleskip}{3ex}                                          % Set spacing after the LoF Title
\setlength{\cftafterlottitleskip}{3ex}                                          % Set spacing after the LoT Title

%%% ToC After title information
\renewcommand{\cftaftertoctitle}{                                               % Adds 'Page' above the page number in TOC
  \hfill\mbox{}\vskip2\doubleSpace
  \hfill\normalfont{Page}
}
\renewcommand{\cftafterloftitle}{                                               % Add 'FIGURE' (left justified) and 'Page' (right justified) after LoF Title
  \hfill\mbox{}\vskip2\doubleSpace
  {\normalfont FIGURE}\hfill{\normalfont Page}
} 
\renewcommand{\cftafterlottitle}{                                               % Add 'TABLE' (left justified) and 'Page' (right justified) after LoT Title
  \hfill\mbox{}\vskip2\doubleSpace
  \normalfont{TABLE}\hfill{\normalfont Page} 
}

%%% ToC What to do before figure/table entires
\renewcommand{\cftbeforefigskip}{\singleSpace}
\renewcommand{\cftbeforetabskip}{\singleSpace}

%%% ToC Fix some spacing
\preto\section{                                                                 % Double space between chapter and first section
  \ifnum\value{section}=0
    \addtocontents{toc}{\vskip10pt}%\singleSpace}
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%    COMMAND DEFINITIONS           COMMAND DEFINITIONS                     %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Update include command
\let\oldInclude\include
\renewcommand{\include}[1]{
  \ifchapref                                                                    % If chapref is set to true
    \begin{bibunit}[\biblioStyle]                                              % Start bibunit environ and se the bibliography style
     \input{#1}                                                                 % Input the tex file into the document; use input because include does clear page
      \putbib[\biblioFile]                                                     % Generate the bibliography
    \end{bibunit}                                                               % End bibunit environ
    \clearpage                                                                  % Clear the page at end of chapter/section
  \else                                                                         % If chapref is false
    \oldInclude{#1}                                                             % Just include the tex file
  \fi
}

% --- Figure reference command
\newcommand{\figref}[1]{\figurename\ \ref{#1}}
% --- Table reference command
\newcommand{\tabref}[1]{\tablename\ \ref{#1}}

% --- Redefine the maketitle command
% Adjust spacing of the title page based on how large the committee is.
% The first command takes off 20 percent of a single space width if
% the CoChair token is used. The second takes off another 20 percent
% if the MemberFour token is used.
\renewcommand{\maketitle}{
  \if\relax\the\CoChair\relax\else                                              % Check if coChair not set
    \addtolength{\titleSpacing}{-0.2\singleSpace}                               % Else, coChair is set and shorten title spacing
  \fi
  \if\relax\the\MemberFour\relax\else                                           % Check if MemberFour not set
    \addtolength{\titleSpacing}{-0.2\singleSpace}                               % Else, MemberFour is set and shorten title spacing
  \fi
  \thispagestyle{empty}
  \begin{center}                                                                % Begin center
    \MakeUppercase{\the\Title}                                                  % Print the title in all upper case
    \vskip\titleSpacing
    A \the\PaperType{}\\by\\\MakeUppercase{\the\FullName}                       % Paper type and name
    \vskip\titleSpacing
    \begin{singlespace}                                                         % Print the next section in single space
      Submitted to the Office of Graduate and Professional Studies of \\
      Texas A\&M University \\
      in partial fulfillment of the requirements for the degree of \\
    \end{singlespace}                                                           % End single spacing
                                    
    \MakeUppercase{\the\Degree{}}                                               % Degree in all upper case
  \end{center}                                                                  % End center
  \vskip\titleSpacing
  \begin{singlespace}\makeCommittee\end{singlespace}                            % Create the committee using routine and single space
  \vskip\titleSpacing
  \begin{center}                                                                % Begin center
    \the\GradMonth{} \the\GradYear{}                                            % Print graduation month and year
    \vskip\titleSpacing
    Major Subject: \the\Dept{}                                                  % Print the major subject
    \vskip\titleSpacing
    Copyright \the\GradYear{} \the\FullName{}                                   % Print copyright grad year and name
  \end{center}                                                                  % End center
  \pagebreak{}                                                                  % Make any text following title on new page
  \pagestyle{plain}                                                             % No headers, just page numbers
  \pagenumbering{roman}                                                         % Roman numerals
  \setcounter{page}{2}                                                          % Set page counter to 2
}

% --- Define makeCommittee command
\newcommand{\makeCommittee}{                                                    % Create the \makeCommittee command
  \hspace{1em}                                                                  % Single space to indent table slighlty
  \begin{tabular}{l l l}                                                        % Start a tabular environment
    \if\relax\the\CoChair\relax                                                 % IF CoChair is not set
      Chair of Committee, & \quad & \the\Chair\\                                % Add 'Chair of Committee' to first column and the value of \Chair to third column
    \else                                                                       % ELSE, i.e., CoChair is set
      Co-Chairs of Committee, & \quad & \the\Chair\\                            % Add 'Co-Chair of Committee' to first column and the value of \Chair to third column
      & & \the\CoChair\\                                                        % Add value of \CoChair to second row, third column
    \fi                                                                         % END if
    % Set up the committee members
    \if\relax\the\MemberOne\relax                                               % If \MemberOne is not set, do nothing
    \else                                                                       % Else, at least MemberOne is set
      \if\relax\the\MemberTwo\relax                                             % If MemberTwo is NOT set
        Committee Member, & & \the\MemberOne\\                                  % Add Committee Member in first column and value of MemberOne to third column
      \else                                                                     % Else, MemberOne and MemberTwo are set
        \if\relax\the\MemberThree\relax                                         % If MemberThree is NOT set
          Committee Members, & & \the\MemberOne\\                               % Add Committee Members in first column and value of MemberOne to third column
          & & \the\MemberTwo\\                                                  % Add value of MemberTwo to third column of next row
        \else                                                                   % Else MemberThree IS set
          \if\relax\the\MemberFour\relax                                        % If MemberFour is NOT set
            Committee Members, & & \the\MemberOne\\                             % Add Committee Members in first column and value of MemberOne to third column
            & & \the\MemberTwo\\                                                % Add value of MemberTwo to third column of next row
            & & \the\MemberThree\\                                              % Add value of MemberThree to third column of next row
          \else                                                                 % Else, MemberFour IS set
            Committee Members, & & \the\MemberOne\\                             % Add Committee Members in first column and value of MemberOne to third column
            & & \the\MemberTwo\\                                                % Add value of MemberTwo to third column of next row
            & & \the\MemberThree\\                                              % Add value of MemberThree to third column of next row
            & & \the\MemberFour\\                                               % Add value of MemberFour to third column of next row
          \fi                                                                   % ENDIF MemberFour
        \fi                                                                     % ENDIF MemberThree
      \fi                                                                       % ENDIF MemberTwo
    \fi                                                                         % ENDIF MemberOne
    Head of Department, & & \the\DeptHead                                       % Write Head of Department in first column and value of DeptHead in third column
  \end{tabular}                                                                 % Exit the tabular environment
}                                                                               % End the command
% Old way of creating the committee
%\newlength{\commitLengthA}\newlength{\commitLengthB}                            % Define the new lengths
%\newcommand{\makeCommitteeOld}{                                                    % Create the \makeCommittee command
%  \hspace{1em}
%  \begin{minipage}{\textwidth}
%  \if\relax\the\CoChair\relax                                                   % IF CoChair is not set
%    \setlength{\commitLengthA}{0.25\textwidth}                                  % Set width for first minipage
%    \setlength{\commitLengthB}{0.75\textwidth}                                  % Set width for second minipage
%    \begin{minipage}[t][\singleSpace][t]{\commitLengthA}                        % Begin minipage on left side of page
%      Chair of Committee,                                                       % Write in minipage
%    \end{minipage}\hspace{1em}                                                  % End minipage on left side of page
%    \begin{minipage}[t][\singleSpace][t]{\commitLengthB}                        % Begin minipage on right side of page
%      \the\Chair                                                                % Write in minipage
%    \end{minipage}                                                              % End minipage on right side of page
%  \else                                                                         % ELSE, i.e., CoChair is set
%    \setlength{\commitLengthA}{0.3\textwidth}                                   % Set width for first minipage
%    \setlength{\commitLengthB}{0.7\textwidth}                                   % Set width for second minipage
%    \begin{minipage}[t][2\singleSpace][t]{\commitLengthA}                       % Begin minipage on left side of page
%      Co-Chairs of Committee,                                                   % Write in minipage
%    \end{minipage}\hspace{1em}                                                  % End minipage on left side of page
%    \begin{minipage}[t][2\singleSpace][t]{\commitLengthB}                       % Begin minipage on right side of page
%      \the\Chair\\\the\CoChair                                                  % Write in minipage
%    \end{minipage}                                                              % End minipage on right side of page
%  \fi                                                                           % END if
%  % Set up the committee members
%  \if\relax\the\MemberOne\relax
%    % Do nothing
%  \else
%    \if\relax\the\MemberTwo\relax                                               % If ONE members present
%      \noindent\begin{minipage}[t][\singleSpace][t]{\commitLengthA}
%        Committee Members,
%      \end{minipage}\hspace{1em}
%      \begin{minipage}[t][\singleSpace][t]{\commitLengthB}
%        \the\MemberOne
%      \end{minipage}
%    \else
%      \if\relax\the\MemberThree\relax                                           % If TWO members present
%        \noindent\begin{minipage}[t][2\singleSpace][t]{\commitLengthA}
%          Committee Members,
%        \end{minipage}\hspace{1em}
%        \begin{minipage}[t][2\singleSpace][t]{\commitLengthB}
%          \the\MemberOne\\\the\MemberTwo
%        \end{minipage}  
%      \else
%        \if\relax\the\MemberFour\relax                                          % If THREE members present
%          \noindent\begin{minipage}[t][3\singleSpace][t]{\commitLengthA}
%            Committee Members,
%          \end{minipage}\hspace{1em}
%          \begin{minipage}[t][3\singleSpace][t]{\commitLengthB}
%            \the\MemberOne\\\the\MemberTwo\\\the\MemberThree
%          \end{minipage}
%        \else                                                                   % If FOUR members present
%          \noindent\begin{minipage}[t][4\singleSpace][t]{\commitLengthA}
%            Committee Members,
%          \end{minipage}\hspace{1em}
%          \begin{minipage}[t][4\singleSpace][t]{\commitLengthB}
%            \the\MemberOne\\\the\MemberTwo\\\the\MemberThree\\\the\MemberFour
%          \end{minipage}
%        \fi
%      \fi
%    \fi
%  \fi
%  % Print the Department Head
%  \noindent\begin{minipage}[t][\singleSpace][t]{\commitLengthA}                 % Begin minipage on left side of page
%    Head of Department,                                                         % Write in minipage
%  \end{minipage}\hspace{1em}                                                    % End minipage on left side of page
%  \begin{minipage}[t][\singleSpace][t]{\commitLengthB}                          % Begin minipage on right side of page
%    \the\DeptHead                                                               % Write the department head in the minipage
%  \end{minipage}                                                                % End minipage on left side of page
%  \end{minipage}
%}

% --- Set up the \makeToC command
\newcommand{\makeToC}{
  \newpage
  %%  TABLE OF CONTENTS
  \phantomsection                                                               % Phantom section for proper hyperref links
  \addcontentsline{toc}{chapter}{\contentsname}                                 % Add table of contents to ToC
  \begin{singlespace}\tableofcontents\end{singlespace}\clearpage                % Generate ToC in single space environment and insert a page break  
  %%  LIST OF FIGURES
  \phantomsection                                                               % Phantom section for proper hyperref links
  \addcontentsline{toc}{chapter}{\listfigurename}                               % Add list of figures to ToC
  \begin{singlespace}\listoffigures\end{singlespace}\clearpage                  % Generate LoF in single space environment and insert a page break
  %%  LIST OF TABLES
  \phantomsection                                                               % Phantom section for proper hyperref links
  \addcontentsline{toc}{chapter}{\listtablename}                                % Add list of tables to ToC
  \begin{singlespace}\listoftables\end{singlespace}\clearpage                   %  Generate LoT in single space environment and insert page break 
  \pagestyle{plain}                                                             % Set the page style to plain
  \pagenumbering{arabic}                                                        % Set the page numbering to arabic
  \setcounter{page}{1}                                                          % Set the page counter to 1
}                                                                               % END of makeToC command


% --- Define makebibliography command
\newcommand{\makebibliography}{                                                 % Set up the new command; no inputs
  \phantomsection                                                               % Generate a phantom section
  \addcontentsline{toc}{chapter}{REFERENCES}                                    % Add References to table of contents
  \bibliographystyle{\biblioStyle}	                                            % Set the bibliography style
  \bibliography{\biblioFile}			                                              % Set path to bibliography .bib file
}


%--- Redefine the chapter commands so that the titles will be capitalized in ToC
% Same as in the report class, but adds capitalization of chapter titles
% in the ToC
\newcommand{\chapterUpCase}[1]{\texorpdfstring{\MakeUppercase{#1}}{#1}}         % Command for handling titles with mathmode/uppercase with hyperref
\def\@chapter[#1]#2{
 \ifnum \c@secnumdepth >\m@ne
   \refstepcounter{chapter}%
   \typeout{\@chapapp\space\thechapter.}%
   \addcontentsline{toc}{chapter}%
   {\protect\numberline{\thechapter}\chapterUpCase{#1}}%
 \else
   \addcontentsline{toc}{chapter}{\chapterUpCase{#1}}%
 \fi
 \chaptermark{#1}%
  % In the report class, there are two lines here that add a little extra space
  % the last figure/table of Chapter N and the first figure/table of 
  % Chapter N+1. They have been removed here so that the spacing between
  % all entries in the LoF/LoT is the same
 \if@twocolumn
   \@topnewpage[\@makechapterhead{\#2}]%
 \else
   \@makechapterhead{#2}%
   \@afterheading
 \fi
}

%%%  Remove the extra vertical space before chapter titles when using report class
\def\ttl@mkchap@i#1#2#3#4#5#6#7{%
    \ttl@assign\@tempskipa#3\relax\beforetitleunit
    \vspace{\@tempskipa}%<<<<<< REMOVE THE * AFTER \vspace
    \global\@afterindenttrue
    \ifcase#5 \global\@afterindentfalse\fi
    \ttl@assign\@tempskipb#4\relax\aftertitleunit
    \ttl@topmode{\@tempskipb}{%
        \ttl@select{#6}{#1}{#2}{#7}}%
    \ttl@finmarks  % Outside the box!
    \@ifundefined{ttlp@#6}{}{\ttlp@write{#6}}}
    
\endinput
