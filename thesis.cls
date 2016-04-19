%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  thesis.cls : A Thesis class for the Courant Institute of Mathematical Sciences,NYU
%		       By: Marc Millstone
%		              m3i1l4l1s5t9o2n6e5 at cims dot nyu dot edu
%                        (sorry for the obfuscation, unfortunately due to
%			spam boths this is necessary, just remove the digits 314159265
%			  from between the letters in the first part of the address which will
%			 give you my last name at my educations location )
%
% Note:  Although I use pdflatex, testing has shown that this class works ok with the
% 	       standard latex + dvips + ps2pdf run.
%
%
%	Provides environments for abstract, introduction which add entries to TOC
%	new-abstract,acknowedgements, introduction, conclusion
%	Generate list of tables/figures and add to tOC
%	\lotTOC and  \lofTOC
%
%
%	Provides following options
%	option			description
%
%	fancyheaders 		use fancy headers which meet NYU guidelines
%	chapterformata		format chapter headings format a
%	chapterformatb		format chapter headings format b
%	dedication		Add environment for dedication and update page
%					numbers
%     NOTE:  If you do use a dedication, USE THE dedication OPTION!!!
%	This is important to set page numbers properly and add label to the table
%	of contents
%
%	Also provides automatic generation of titlepage and copyright
%   	In latex file use commands with proper values
%
%	\thesistitle{}
% 	\author{}
%	\month{}
%	\year{}
% 	\degree{}
%	\advisor{}
%
%	And then after \begin{document}
%	call
%		\maketitlepages
%
%
%	New Environments defined
%		-- introduction
%		-- new-abstract
%		-- conclusion
%		-- acknowledgments
%		-- futurework
%		-- dedication (see above. You must use option to class to ensure proper page numbering)
%
%	UPDATE: 5 January 2007
%		Fixed issue with double spacing of title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% package identification

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{thesis}[2006/05/01 Courant Thesis Class]


%For booleans and options
\RequirePackage{ifthen}



\newboolean{fancychaptersa}
\newboolean{fancychaptersb}
\newboolean{fancyheadersa}
\newboolean{fancyheadersb}

\newboolean{dedication}




%Declare OPTIONS
\DeclareOption{chapterformata}{\setboolean{fancychaptersa}{true}}
\DeclareOption{chapterformatb}{\setboolean{fancychaptersb}{true}}
\DeclareOption{fancyheaders}{\setboolean{fancyheadersa}{true}}
\DeclareOption{headb}{\setboolean{fancyheadersb}{true}}

\DeclareOption{dedication}{\setboolean{dedication}{true}}


\ProcessOptions \relax









%load report
\LoadClass[12pt,twoside]{report}


%Required Packages for  graphics, math, citations, formatting, etc.
%Special packages have more specific explanations below

\RequirePackage{graphicx}
%\RequirePackage{psfrag}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}  % double spacing
% The following allows an easier way of setting page and margin sizes.  Note
% the asymmetric argument is important to insure that the left and right margins are
% not aliases for the "inner" and "outer" margins for the twoside report.
\RequirePackage[paper=letterpaper, twoside=true, includeheadfoot = true, asymmetric, lmargin=1.6in,right=1.1in,tmargin=1.1in,bmargin=1.1in,footskip=.8in]{geometry}


\RequirePackage{titlesec}     		             % For fancy chapter heading
								    % 		if you remove this, remove the section
								    %		below which formats the chapter





%Fancy Header Format.
%Standard definitions, modified slightly

\newcommand{\fancychaptermark}[1]
  {\markboth{\textsf{\thechapter} \ \ #1}{}}
\newcommand{\fancysectionmark}[1]
  {\markright{\textsf{\thesection} \ \ #1}}


%-------------- CODE FOR OPTION HANDLING
%We know process the options properly
%FIRST HEADERS
\ifthenelse{\boolean{fancyheadersa}}{ %
	%WE use the first form of fancy headers
	\pagestyle{fancy}
 	\fancyhf{}
 	\renewcommand{\chaptermark}{\fancychaptermark}
 	\renewcommand{\sectionmark}{\fancysectionmark}
	 \fancyhead[LO]{\rmfamily\scshape\leftmark}
 	\fancyhead[RE]{\rmfamily\scshape\rightmark}
 	\fancyfoot[C]{\thepage}
	\renewcommand{\headrulewidth}{0pt}

%	\fancypagestyle{plain}{
%		\fancyhf{}
%		\fancyfoot[C]{\thepage}}
	% \setlength{\topmargin}{.3in}
	}{}


%NOW CHAPTER FORMATS
\ifthenelse{\boolean{fancychaptersa}}{ %
	%FIRST FORMAT

	\titleformat{name=\chapter}[block]{\huge\normalfont\rmfamily\scshape}{}{0pt}
	{\filright \textsf{\thechapter}\\ \vspace{-1.5em}  \rule{\textwidth}{1pt}\\ \vspace{-1em}}[]

	\titleformat{name=\chapter,numberless=true}[block]{\huge\normalfont\rmfamily\scshape}{}{0pt}
	{\filright \\ \vspace{-1.75em}  \rule{\textwidth}{1pt}\\ \vspace{-1em}}[]

	%%\titleformat{\chapter}[block]{\normalfont\sffamily}{}{0pt}{}
	\titlespacing*{\chapter}{0pt}{-.75in}{2em}
	\titlespacing*{\subsubsection}{0pt}{1em}{0em}}
	{% Check Other format
	\ifthenelse{\boolean{fancychaptersb}}{%
		\titleformat{name=\chapter}[block]{\filcenter\huge\normalfont\rmfamily\scshape}{\thechapter
		\quad $\bullet$ \hspace{.5em}}{0pt}{ \filcenter }[\vspace{-20pt}\filcenter\rule{.8\textwidth}{2pt}]

	%%\titleformat{\chapter}[block]{\normalfont\sffamily}{}{0pt}{}
		\titlespacing*{\chapter}{0pt}{-.75in}{2em}}
	{}}
{}



%Parse Dedication page
%Requires new environment and update to page number

%\ifthenelse{\boolean{dedication}}{%then
%	\newenvironment{dedication}
%	{\setcounter{page}{3}
% 	\thispagestyle{plain}
%	\chaptertocded{Dedication}}{}	}
%	{%else do nothing
%	}




% Required Thesis Size (by NYU Office of Student Affair)
\renewcommand{\baselinestretch}{1.5}
\renewcommand{\emptyset}{\varnothing}
\pagestyle{plain}
%\setlength{\topmargin}{12pt}
\textwidth 5.8in
\renewcommand{\headwidth}{\textwidth}

% NOTE!   textheight and topmarginn must change depending on
%		options selected.  I MUST ADD THIS FUNCTIONALITY!
%
%\textheight 8.0in
%\oddsidemargin 0.6in
%\evensidemargin 0.6in
%\marginparwidth 1.2in
%\headheight 14.5pt
%\headsep 10pt
%\footskip 10pt
\doublespacing


\tolerance=100  %allow slightly looser typesetting for fewer
                %overfull boxes







% Standard environment definitions
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{proposition}{Proposition}[chapter]
\newtheorem{lemma}{Lemma}[chapter]
\newtheorem{corollary}{Corollary}[chapter]
\newtheorem{remark}{Remark}[chapter]

%Change to remark style, find it easier to follow
\theoremstyle{remark}
\newtheorem{example}{Example}[chapter]

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}

% variables for the titlepages of the thesis and \maketitlepages command
\newcommand{\thesistitle}[1]{\gdef\@thesistitle{#1}}
\renewcommand{\year}[1]{\gdef\@year{#1}}
\renewcommand{\month}[1]{\gdef\@month{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\advisor}[1]{\gdef\@advisor{#1}}



%Make title page in the proper format
%Use variables defined above.

\newcommand\maketitlepages{
 \pagestyle{empty}                       % no header/numbering on title page
 \begin{titlepage}
 \vspace*{.5cm}

    \begin{center}
      \linespread{3} \normalsize {\textbf{\huge{\bfseries \@thesistitle}}}\\
    \linespread{1.6} \normalsize
	\vspace{1cm}
     by\\
      \vspace{1cm}
      {\it \large \@author}\\
      \vspace*{3cm}
      \noindent
      { A dissertation submitted in partial fulfillment}\\
      {of the requirements for the degree of}\\
      {\@degree}\\
      {\@department}\\
      {New York University}\\
      { \@month\; \@year}\\
    \end{center}

      \vspace{1cm}
      \begin{flushright}
   	\makebox[2in]{\hrulefill}\\
   	\vspace{-.1cm}
   	\parbox[t]{1.8in}{\@advisor}\\
       \end{flushright}

       \newpage
	\begin{center}
	\copyright \hspace{.2cm} \@author\\
		All Rights Reserved, \@year
	\end{center}
 \end{titlepage}
 \ifthenelse{ \boolean{fancyheadersa} \or \boolean{fancyheadersb} }
 { \pagestyle{fancy}  }{ \pagestyle{plain} }
 \pagenumbering{roman}
}

% use the string 'Table of Contents' instead of the default 'Contents'

\renewcommand{\contentsname}{Table of Contents}

%List Tables and add entry to TOC
\newcommand{\lotTOC}{
\clearpage
\addcontentsline{toc}{chapter}{List of Tables}
\listoftables}
%List Figures and add entry to TOC
\newcommand{\lofTOC}{
\clearpage
\addcontentsline{toc}{chapter}{List of Figures}
\listoffigures}




%New command for a \chapter like environment for Abstract/introduction
%etc which will add the chapter to the table of contents.  Idea from
%thesis class defined for McGill University.


\newcommand{\chaptertoc}[1] {
   \chapter*{#1}
   \addcontentsline{toc}{chapter}{#1}
   \chaptermark{#1}
}

\newcommand{\chaptertocded}[1] {
   \addcontentsline{toc}{chapter}{#1}
   \chaptermark{#1}
}


%% NOTE: original file has been modified. The present file does not
%% adjusts the page numbers if the dedication is not defined
\newenvironment{dedication}
{\setcounter{page}{3}
\chaptertoc{Dedication}}{}


\newenvironment{new-abstract}
{\chaptertoc{Abstract}}{}


%\ifthenelse{\boolean{dedication}}{%then
%	\newenvironment{dedication}
%	{\setcounter{page}{3}
% 	\thispagestyle{plain}
%	\chaptertocded{Dedication}}{}	}
%	{%else do nothing
%	}





\newenvironment{acknowledgments}
{\chaptertoc{Acknowledgments}}{}

\newenvironment{introduction}
{ \clearpage
  \pagenumbering{arabic}
  \chaptertoc{Introduction}
}{}




\newenvironment{conclusion}
{\chaptertoc{Conclusion}}{}


\newenvironment{futurework}
{\chaptertoc{Future Work}}{}
