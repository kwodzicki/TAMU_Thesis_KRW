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
%   Modified 02 May 2018 by Kyle R. Wodzicki
%
%     Updated to ensure matches the Spring 2018 LaTeX Template
%-
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tamu_thesis}[2018/04/01 TAMU Thesis Class]


%%% Prohibited report Class Options
% Disallow two options of the "report" document class because they are
% incompatible with TAMU's formatting guidelines.
\DeclareOption{twocolumn}{\ClassWarning{tamu_thesis}{
  The tamu_thesis class does not support the twocolumn option.}}
\DeclareOption{notitlepage}{\ClassWarning{tamu_thesis}{
  The tamu_thesis class does not support the notitlepage option.}}

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

% Declare arial option
\newif\if@arial\@arialfalse                   % Set up new if variable for all
\DeclareOption{arial}{\@arialtrue}            % Declare option for `onehalfspacing', set true if used

% Declare onehalfspacing option
\newif\if@onehalfspacing\@onehalfspacingfalse           % Set up new if variable for all
\DeclareOption{onehalfspacing}{\@onehalfspacingtrue}    % Declare option for `onehalfspacing', set true if used

% Declare binding option to adjust left margin
\newif\if@binding\@bindingfalse                         % Set up new if variable for binding
\DeclareOption{binding}{\@bindingtrue}                  % Declare option for `binding', set true if used

% Declare chapref option to place bibliography at end of each chapter
\newif\ifchapref\chapreffalse                          % Set up new if variable for chapref
\DeclareOption{chapref}{\chapreftrue}                  % Declare option for `chapref', set true if used

% Class structure: declaration of options part
\ProcessOptions \relax
\LoadClass[letterpaper,onecolumn,titlepage]{report}

% Package requirements
% Adjust left margin if binding is set
\if@binding% If binding is true
	\RequirePackage[letterpaper,
		verbose,
		tmargin=1in,
		bmargin=1in,
		lmargin=1.4in,
		rmargin=1in]{geometry} % set left margin to 1.4 inches and all others to 1 inch
\else% Binding is false
	\RequirePackage[letterpaper, verbose, margin=1in]{geometry}% Set all margins to 1 inch
\fi

\RequirePackage{etoolbox}
\RequirePackage{amsmath, amsthm}
\RequirePackage{setspace}
\RequirePackage{bibunits}
\RequirePackage{float}
\RequirePackage[rm, tiny, center, compact]{titlesec}
\RequirePackage{tocloft}
\RequirePackage{indentfirst}
\RequirePackage[titletoc]{appendix}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{fontspec}
\RequirePackage[T1]{fontenc}

%%% Set the document font based on the arial option; default to Times New Roman
\if@arial
  \setmainfont{Arial}
\else
  \setmainfont{Times New Roman}
\fi

\newlength{\singleSpace}                                                        % Define a new length for the single spacing
\setlength{\singleSpace}{\baselineskip}                                            % Set single line spacing to the size of the font
\doublespacing
\newlength{\doubleSpace}                                                        % Define a new length for the single spacing
\setlength{\doubleSpace}{\baselineskip}                                            % Set single line spacing to the size of the font

\newlength{\titleSpacing}                                                       % Define a new length for spacing at bottom of title page
\setlength{\titleSpacing}{2\doubleSpace}                                        % Set the length to 3 single spaces

\if@onehalfspacing\onehalfspacing\else\doublespacing\fi  % Set document spacing


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fix spacing in front of figures
\setlength{\textfloatsep}{40pt plus 8.0pt minus 4.0pt}
\setlength{\floatsep}{40pt plus 8.0pt minus 4.0pt}
\setlength{\intextsep}{40pt plus 8.0pt minus 4.0pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

\newtoks{\bibfile}
\newtoks{\bibstyle}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Redefine bibliography to exclude empty
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\bibname}{{\normalsize\rm REFERENCES}}                                      % Change name of the bibiligraphy
\let\origthebibliography\thebibliography                                                  % Store default \begin{thebibliography}
\let\origendthebibliography\endthebibliography                                            % Store default \end{thebibliography}
\newif\ifemptybibliography\emptybibliographyfalse                                         % Create new if
\renewenvironment{thebibliography}[1]{
	\def\nBib{#1}                                                                         % Define macro for number of bib entries
	\ifx\nBib\empty                                                                       % If the macro is empty
 		\emptybibliographytrue                                                            % Set the emptybibliography variable to true
	\else                                                                                 % Else, the macro was NOT empty
      \ifchapref                                                                          % If references at the end of each chapter requested
        \renewcommand{\chapter}[2]{}                                                      % Redefine the chapter command to be empty; removes bib heading
        \section{References}                                                              % Create a References section
      \fi                                                
      \origthebibliography{#1}                                                            % Run the old bibliography
	\fi                                                
}{                                                
	\ifemptybibliography\else                                                             % If emptybibliography is true, do nothing, else
		\origendthebibliography                                                           % End the bibliography
	\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Define makebibliography command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makebibliography}{                                                           % Set up the new command; no inputs
  \phantomsection                                                                         % Generate a phantom section
  \addcontentsline{toc}{chapter}{REFERENCES}                                              % Add References to table of contents
  \bibliographystyle{\the\bibstyle}	                                                      % Set the bibliography style
  \bibliography{\the\bibfile}			                                                  % Set path to bibliography .bib file
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Define includeChapter command to wrap files in bibunit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\includeChapter}[1]{                                                          % Redefine the include command
  \ifchapref                                                                              % If chapref is set to true
    \begin{bibunit}[\the\bibstyle]                                                        % Start bibunit environ and se the bibliography style
	  \input{#1}                                                                          % Input the tex file into the document
      \putbib[\the\bibfile]                                                               % Generate the bibliography
    \end{bibunit}                                                                         % End bibunit environ
  \else                                                                                   % If chapref is false
    \include{#1}                                                                          % Just include the tex file
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Make Title command (formatting from LaTeX User group title template.)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adjust spacing of the title page based on how large the committee is.
% The first command takes off 40 percent of a single space width if
% the CoChair token is used. The second takes off another 40 percent
% if the MemberFour token is used.

\renewcommand{\maketitle}{
  \if\relax\the\CoChair\relax\else\addtolength{\titleSpacing}{-0.2\singleSpace}\fi        % IF CoChair is not set
  \if\relax\the\MemberFour\relax\else\addtolength{\titleSpacing}{-0.2\singleSpace}\fi     % IF CoChair is not set
  \thispagestyle{empty}
  \begin{center}                                                                          % Begin center
    \MakeUppercase{\the\Title}                                                            % Print the title in all upper case
    \vskip\titleSpacing
    A \the\PaperType{}\\by\\\MakeUppercase{\the\FullName}                                 % Paper type and name
    \vskip\titleSpacing
    \begin{singlespace}                                                                   % Print the next section in single space
      Submitted to the Office of Graduate and Professional Studies of \\
      Texas A\&M University \\
      in partial fulfillment of the requirements for the degree of \\
    \end{singlespace}                                                                     % End single spacing
                                    
    \MakeUppercase{\the\Degree{}}                                                         % Degree in all upper case
  \end{center}                                                                            % End center
  \vskip\titleSpacing
  \begin{singlespace}\makeCommittee\end{singlespace}                                      % Create the committee using routine and single space
  \vskip\titleSpacing
  \begin{center}                                                                          % Begin center
    \the\GradMonth{} \the\GradYear{}                                                      % Print graduation month and year
    \vskip\titleSpacing
    Major Subject: \the\Dept{}                                                            % Print the major subject
    \vskip\titleSpacing
    Copyright \the\GradYear{} \the\FullName{}                                             % Print copyright grad year and name
  \end{center}                                                                            % End center
  \pagebreak{}                                                                            % Make any text following title on new page
  \pagestyle{plain}                                                                       % No headers, just page numbers
  \pagenumbering{roman}                                                                   % Roman numerals
  \setcounter{page}{2}                                                                    % Set page counter to 2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determine how many committee members there are and if there is a co-chair. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define two new lengths used to set the width of minipages in the committee
% section of the title page
\newlength{\commitLengthA}\newlength{\commitLengthB}                                      % Define the new lengths
\newcommand{\makeCommittee}{                                                              % Create the \makeCommittee command
  \hspace{1em}
  \begin{minipage}{\textwidth}
  \if\relax\the\CoChair\relax                                                             % IF CoChair is not set
    \setlength{\commitLengthA}{0.25\textwidth}                                            % Set width for first minipage
    \setlength{\commitLengthB}{0.75\textwidth}                                            % Set width for second minipage
    \begin{minipage}[t][\singleSpace][t]{\commitLengthA}                                  % Begin minipage on left side of page
      Chair of Committee,                                                                 % Write in minipage
    \end{minipage}\hspace{1em}                                                            % End minipage on left side of page
    \begin{minipage}[t][\singleSpace][t]{\commitLengthB}                                  % Begin minipage on right side of page
      \the\Chair                                                                          % Write in minipage
    \end{minipage}                                                                        % End minipage on right side of page
  \else                                                                                   % ELSE, i.e., CoChair is set
    \setlength{\commitLengthA}{0.3\textwidth}                                             % Set width for first minipage
    \setlength{\commitLengthB}{0.7\textwidth}                                             % Set width for second minipage
    \begin{minipage}[t][2\singleSpace][t]{\commitLengthA}                                 % Begin minipage on left side of page
      Co-Chairs of Committee,                                                             % Write in minipage
    \end{minipage}\hspace{1em}                                                            % End minipage on left side of page
    \begin{minipage}[t][2\singleSpace][t]{\commitLengthB}                                 % Begin minipage on right side of page
      \the\Chair\\\the\CoChair                                                            % Write in minipage
    \end{minipage}                                                                        % End minipage on right side of page
  \fi                                                                                     % END if
  % Set up the committee members
  \if\relax\the\MemberOne\relax
    % Do nothing
  \else
    \if\relax\the\MemberTwo\relax                                                         % If ONE members present
      \noindent\begin{minipage}[t][\singleSpace][t]{\commitLengthA}
        Committee Members,
      \end{minipage}\hspace{1em}
      \begin{minipage}[t][\singleSpace][t]{\commitLengthB}
        \the\MemberOne
      \end{minipage}
    \else
      \if\relax\the\MemberThree\relax                                                     % If TWO members present
        \noindent\begin{minipage}[t][2\singleSpace][t]{\commitLengthA}
          Committee Members,
        \end{minipage}\hspace{1em}
        \begin{minipage}[t][2\singleSpace][t]{\commitLengthB}
          \the\MemberOne\\\the\MemberTwo
        \end{minipage}  
      \else
        \if\relax\the\MemberFour\relax                                                    % If THREE members present
          \noindent\begin{minipage}[t][3\singleSpace][t]{\commitLengthA}
            Committee Members,
          \end{minipage}\hspace{1em}
          \begin{minipage}[t][3\singleSpace][t]{\commitLengthB}
            \the\MemberOne\\\the\MemberTwo\\\the\MemberThree
          \end{minipage}
        \else                                                                             % If FOUR members present
          \noindent\begin{minipage}[t][4\singleSpace][t]{\commitLengthA}
            Committee Members,
          \end{minipage}\hspace{1em}
          \begin{minipage}[t][4\singleSpace][t]{\commitLengthB}
            \the\MemberOne\\\the\MemberTwo\\\the\MemberThree\\\the\MemberFour
          \end{minipage}
        \fi
      \fi
    \fi
  \fi
  % Print the Department Head
  \noindent\begin{minipage}[t][\singleSpace][t]{\commitLengthA}                           % Begin minipage on left side of page
    Head of Department,                                                                   % Write in minipage
  \end{minipage}\hspace{1em}                                                              % End minipage on left side of page
  \begin{minipage}[t][\singleSpace][t]{\commitLengthB}                                    % Begin minipage on right side of page
    \the\DeptHead                                                                         % Write the department head in the minipage
  \end{minipage}                                                                          % End minipage on left side of page
  \end{minipage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Set up environments for abstract, dedication, etc. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Abstract environment
\renewenvironment{abstract}{
  \chapter*{ABSTRACT}                                 % Generate chapter title for Abstract
  \addcontentsline{toc}{chapter}{ABSTRACT}            % Add to table of contents
  \pagestyle{plain}                                   % Set page style to plain
}{
  \pagebreak{}                                        % Page break after text
}

% -- Dedication environment
\newenvironment{dedication}{
  \chapter*{DEDICATION}                               % Generate chapter title for Dedication
  \addcontentsline{toc}{chapter}{DEDICATION}          % Add to table of contents
  \pagestyle{plain}\vskip\fill\begin{center}          % Set page style to plain, center text, and add vertical fill before text
}{
  \end{center}\vskip\fill\pagebreak{}                                        % Page break after text
}

% -- Acknowledgements environment
\newenvironment{acknowledgements}{
  \chapter*{ACKNOWLEDGEMENTS}                         % Generate chapter title for Acknowledgements
  \addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}    % Add to table of contents
  \pagestyle{plain}                                   % Set page style to plain
}{
  \pagebreak{}                                        % Page break after text
}

% -- Nomenclature Command  
\newcommand{\makeNomenclature}{
  \chapter*{NOMENCLATURE}                             % Generate chapter title for Nomenclature
  \addcontentsline{toc}{chapter}{NOMENCLATURE}        % Add to table of contents
  \vspace{\singleSpace}                               % Move start of nomenclature up
  \printacronyms                                      % Print the nomenclature/acronyms
}

% -- Contributors and Funding
\newenvironment{contributors}{
  \chapter*{CONTRIBUTORS AND FUNDING SOURCES}                      % Generate chapter title for Contributors
  \addcontentsline{toc}{chapter}{CONTRIBUTORS AND FUNDING SOURCES} % Add to table of contents
  \pagestyle{plain}                                                % Set page style to plain
}{
  \pagebreak{}                                                     % Page break after text
}

% -- Appendices environment
\let\myappendices\appendices                             % Store default settings of \begin{appendice}
\let\endmyappendices\endappendices                       % Store default settings of \end{appendices}
\renewenvironment{appendices}{                           % Define new appendices environment
  \myappendices                                          % Load default appendices settings
  \renewcommand{\appendixname}{APPENDIX}                 % Set new appendix name
  \titleformat{\chapter}                                 % Edit chapter title format for appendices
    {\centering\normalsize\uppercase}                    % Set title to be centered and normal size
    {\appendixname{} \thechapter}                        % Set the new title name to APPENDIX `chap'
    {0em}                                                % Set marign before the title
    {\vskip\singleSpace\centering}                       % Set margin after the title
}{
  \endmyappendices                                       % End the appendix
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Titlesec Customations 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%\titleformat{\chapter}{\centering\normalsize\uppercase}{\thechapter.}{1em}{}
%\titleformat{\section}{\bf\normalsize}{\thesection}{1em}{}
%\titleformat{\subsection}{\bf\normalsize}{\thesubsection}{1em}{}
%\titleformat{\subsubsection}{\centering\normalsize\it}{\thesubsubsection}{1em}{}
%
%\titlespacing{\chapter}{0pt}{0pt}{2\singleSpace}
%\titlespacing{\section}{0pt}{0.5\singleSpace}{0.5\singleSpace}
%\titlespacing{\subsection}{0pt}{0.5\singleSpace}{0.5\singleSpace}
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- TABLE OF CONTENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- This puts \subsubsection[]{×} in your List of Tables.  The default is 3
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{4}
\renewcommand{\contentsname}{TABLE OF CONTENTS}                                           % Change the title for the ToC

\renewcommand{\cftdotsep}{1.00}                                                           % Adjusts the size of the leader dot separation.
\addtocontents{toc}{                                                                      % Puts leader dots on chapters.
  \protect\renewcommand{\protect\cftchapleader}{\protect\cftdotfill{\cftsecdotsep}}
}

%%% ToC Font specifications
\renewcommand{\cfttoctitlefont}{\hfill\normalsize}                                        % Font for ToC Title
\renewcommand{\cftloftitlefont}{\hfill\normalfont\MakeUppercase}                          % Font for LoF Title
\renewcommand{\cftlottitlefont}{\hfill\normalfont\MakeUppercase}                          % Font for LoT Title
\renewcommand{\cftchapfont}{\normalsize}                                                  % Font for chapter names
\renewcommand{\cftsecfont}{\normalfont}                                                   % Font for section names
\renewcommand{\cftpartfont}{\normalfont}                                                  % Font for part names

%%% ToC Page number fonts
\renewcommand{\cftchappagefont}{\normalsize\rm}                                           % Set chapter page font
\renewcommand{\cftsecpagefont}{\normalfont}                                               % Set section page font
\renewcommand{\cftpartpagefont}{\normalfont}                                              % Set part page font

%%% ToC Leaders to page numbers
\renewcommand{\cftchapleader}{\normalsize\rm\cftdotfill{\cftdotsep}}                      % Set chapter leader
\renewcommand{\cftchapaftersnum}{.}                                                       % Add a period after chapter numbers.
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}                                    % Add leader dots for parts

%%% ToC Spacing before titles
\setlength{\cftbeforetoctitleskip}{-\singleSpace}                                                   % Set spacing before the ToC Title
\setlength{\cftbeforeloftitleskip}{-\singleSpace}                                                   % Set spacing before the LoF Title
\setlength{\cftbeforelottitleskip}{-\singleSpace}                                                   % Set spacing before the LoT Title

%%% ToC Spacing after titles
\setlength{\cftaftertoctitleskip}{2ex}                                                    % Set spacing after the LoF Title
\setlength{\cftafterloftitleskip}{3ex}                                                    % Set spacing after the LoF Title
\setlength{\cftafterlottitleskip}{3ex}                                                    % Set spacing after the LoT Title

%%% ToC After title information
\renewcommand{\cftaftertoctitle}{                                                         % Adds 'Page' above the page number in TOC
  \hfill\mbox{}\vskip2\doubleSpace
  \hfill\normalfont{Page}
}
\renewcommand{\cftafterloftitle}{                                                         % Add 'FIGURE' (left justified) and 'Page' (right justified) after LoF Title
  \hfill\mbox{}\vskip2\doubleSpace
  {\normalfont FIGURE}\hfill{\normalfont Page}
} 
\renewcommand{\cftafterlottitle}{                                                         % Add 'TABLE' (left justified) and 'Page' (right justified) after LoT Title
  \hfill\mbox{}\vskip2\doubleSpace
  \normalfont{TABLE}\hfill{\normalfont Page} 
}

%%% ToC What to do before figure/table entires
\renewcommand{\cftbeforefigskip}{\f@size pt}                                                     % Set vertical skip before entries to 0pt
\renewcommand{\cftbeforetabskip}{\f@size pt}                                                     % Set vertical skip before entries to 0pt

%%% ToC Fix some spacing
\preto\section{                                                                           % Double space between chapter and first section
  \ifnum\value{section}=0
    \addtocontents{toc}{\vskip10pt}%\singleSpace}
  \fi
}

%%% Set up the \makeToC command
\newcommand{\makeToC}{
  \pagebreak
  %%  TABLE OF CONTENTS
  \phantomsection                                                         % Phantom section for proper hyperref links
  \addcontentsline{toc}{chapter}{TABLE OF CONTENTS}                       % Add table of contents to ToC
  \begin{singlespace}\tableofcontents\end{singlespace}\pagebreak{}        % Generate ToC in single space environment and insert a page break  
  %%  LIST OF FIGURES
  \phantomsection                                                         % Phantom section for proper hyperref links
  \addcontentsline{toc}{chapter}{LIST OF FIGURES}                         % Add list of figures to ToC
  \begin{singlespace}\listoffigures\end{singlespace}\pagebreak{}          % Generate LoF in single space environment and insert a page break
  %%  LIST OF TABLES
  \phantomsection                                                         % Phantom section for proper hyperref links
  \addcontentsline{toc}{chapter}{LIST OF TABLES}                          % Add list of tables to ToC
  \begin{singlespace}\listoftables\end{singlespace}\pagebreak{}           %  Generate LoT in single space environment and insert page break 
  \pagestyle{plain}                                  % Set the page style to plain
  \pagenumbering{arabic}                             % Set the page numbering to arabic
  \setcounter{page}{1}                               % Set the page counter to 1
}                                                                         % END of makeToC command


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Redefine \chapter{} command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter                                                    % Changes the catcode of @ to 11
\let\stdchapter\chapter                                          % Save old chapter defintion
\renewcommand*\chapter{                                          % Make new command for chapter
  \@ifstar{\starchapter}{\@dblarg\nostarchapter}}                % Not sure what this does
\newcommand*\starchapter[1]{\stdchapter*{\uppercase{#1}}}        % Define new \chapter*{} with uppercase
\def\nostarchapter[#1]#2{\stdchapter[{\uppercase{#1}}]{#2}}      % Define new \chapter{} with upper case
\makeatother                                                     % Changes the catcode of @ to 12

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Titlesec Customations 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\chapter}{\centering\normalsize\uppercase}{\thechapter.}{1em}{}
\titleformat{\section}{\bf\normalsize}{\thesection}{1em}{}
\titleformat{\subsection}{\bf\normalsize}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\centering\normalsize\it}{\thesubsubsection}{1em}{}

%\titlespacing{\chapter}{0pt}{0pt}{2\singleSpace}
\titlespacing{\chapter}{0pt}{0pt}{2\singleSpace}
\titlespacing{\section}{0pt}{0.5\singleSpace}{0.5\singleSpace}
\titlespacing{\subsection}{0pt}{0.5\singleSpace}{0.5\singleSpace}

%%%  Remove the extra vertical space before chapter titles when using report class
\makeatletter
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
\makeatother

\endinput