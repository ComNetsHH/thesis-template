\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{comnets-thesis}
\LoadClass[a4paper,open=right,twoside=true,openany,cleardoublepage=empty,parskip=half,headings=normal,BCOR=12mm,titlepage=firstiscover]{scrreprt}

% Packages.
\usepackage[utf8]{inputenc}
\usepackage[babel,english=british]{csquotes}
\usepackage[british]{babel}
\usepackage[backend=biber,citestyle=ieee,sorting=none,dateabbrev=false,urldate=comp]{biblatex}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{graphicx}
\usepackage{acronym}
\usepackage{enumerate}
\usepackage{float}
\usepackage{microtype}				% Optical margin alignment etc.
\usepackage[a4paper]{geometry}
\usepackage{tikz}
\usepackage{listings}
\usepackage{afterpage}
\usepackage[binary-units=true]{siunitx}
\usepackage{xcolor}
\definecolor{tuhhblue}{HTML}{00C1D4}

% Loads user packages
\include{packages.tex}

\usepackage[plainpages=false,unicode=true,pdftex]{hyperref} % Load last.
\usepackage{scrhack} % Should always be loaded at the end, overwrites some macros


% url setup
\def\UrlBreaks{\do\/\do-} % Tell url package to break at / and -, too.

% siunitx setup
\sisetup{range-phrase = \text{--}}
\DeclareSIUnit{\belmilliwatt}{Bm}
\DeclareSIUnit{\dBm}{\deci\belmilliwatt}

\makeatletter
\def\BState{\State\hskip-\ALG@thistlm}
\makeatother

\raggedbottom  % Fixes too large gap after section titles.

% Custom commands.
\newcommand{\ColorReferenceLinks}{false}  % For print choose false to have black links
\newcommand{\superscript}[1]{\ensuremath{^{\textrm{#1}}}}
\newcommand{\subscript}[1]{\ensuremath{_{\textrm{#1}}}}
\newcommand{\superscriptSf}[1]{\ensuremath{^{\textsf{#1}}}}
\newcommand{\ths}[0]{\superscriptSf{th}}
\renewcommand{\th}[0]{\superscript{th}}
\newcommand{\st}[0]{\superscript{st}}
\newcommand{\nd}[0]{\superscript{nd}}
\newcommand{\rd}[0]{\superscript{rd}}
% \newcommand\poppinslight[1]{{\usefont{T1}{Poppins-Light}{m}{n} #1 }} 	% does not work, yet

% Title page margins and alignments
\renewcommand*{\coverpagetopmargin}{3em}
\renewcommand*{\coverpageleftmargin}{3em}
\renewcommand*{\coverpagerightmargin}{3em}
\renewcommand*{\coverpagebottommargin}{3em}
\setkomafont{disposition}{\normalfont\bfseries}
\setkomafont{subject}{\Large\normalfont}

% Magic.
\usetikzlibrary{shapes,arrows,positioning,matrix,scopes,chains,decorations.pathmorphing,patterns,decorations.pathreplacing}
% Generelles Umstellen des Doppelpunktes auf dieselbe
% Linie wie das Gleichheitszeichen. Aus de-tex-faq, Teil 8,
% Makro von Donald Arseneau
\mathchardef\ordinarycolon\mathcode`\:
\mathcode`\:=\string"8000
\begingroup \catcode`\:=\active
  \gdef:{\mathrel{\mathop\ordinarycolon}}
\endgroup
%% definition of perlis mathclap etcpp.
%%
% For comparison, the existing overlap macros:
% \def\llap#1{\hbox to 0pt{\hss#1}}
% \def\rlap#1{\hbox to 0pt{#1\hss}}
\def\clap#1{\hbox to 0pt{\hss#1\hss}}
\def\mathllap{\mathpalette\mathllapinternal}
\def\mathrlap{\mathpalette\mathrlapinternal}
\def\mathclap{\mathpalette\mathclapinternal}
\def\mathllapinternal#1#2{%
  \llap{$\mathsurround=0pt#1{#2}$}}
\def\mathrlapinternal#1#2{%
  \rlap{$\mathsurround=0pt#1{#2}$}}
\def\mathclapinternal#1#2{%
  \clap{$\mathsurround=0pt#1{#2}$}}
\theoremstyle{definition}
\newtheorem{definition}{Definition}[chapter]

\theoremstyle{definition}
\newtheorem{lemma}{Lemma}[chapter]

%\theoremstyle{definition}
%\newtheorem{proof}{Beweis}[chapter]

\theoremstyle{definition}
\newtheorem{theorem}{Theorem}[chapter]

%%%%%%% Math Operators %%%%%%%
\DeclareMathOperator{\spann}{span}
\DeclareMathOperator{\dimension}{dim}
\DeclareMathOperator{\grad}{deg}
\DeclareMathOperator{\minpol}{minpol}
%\DeclareMathOperator{\min}{min}
\DeclareMathOperator{\coeffmax}{coeffmax}

% Farben, die ich in den Tabellen benutze
\definecolor{hellgrau}{rgb}{0.9,0.9,0.9}

% Farben, die ich in den Listings benutze
\definecolor{darkblue}{rgb}{0,0,.6}
\definecolor{darkred}{rgb}{.6,0,0}
\definecolor{darkgreen}{rgb}{0,.6,0}
\definecolor{red}{rgb}{.98,0,0}

\definecolor{tuhh_darkcyan}{rgb}{.09,0.39,.42}
\definecolor{tuhh_cyan}{rgb}{.18,0.78,.84}

\lstloadlanguages{Matlab}
\lstset{%
  language=Matlab,
  basicstyle=\scriptsize\ttfamily,
  commentstyle=\itshape\color{darkgreen},
  keywordstyle=\bfseries\color{darkblue},
  stringstyle=\color{darkred},
  showspaces=false,
  showtabs=false,
  columns=fixed,
  numbers=left,
  frame=single,
  numberstyle=\tiny,
  breaklines=true,
  showstringspaces=false,
  xleftmargin=1cm
}

%
% TIME OF DAY (Nelson H. F. Beebe :-)
%
\newcount\hh
\newcount\mm
\mm=\time
\hh=\time
\divide\hh by 60
\divide\mm by 60
\multiply\mm by 60
\mm=-\mm
\advance\mm by \time
\def\hhmm{\number\hh:\ifnum\mm<10{}0\fi\number\mm}

% Define block styles
\tikzstyle{decision} = [diamond, draw, fill=blue!20, text width=4.5em, text badly centered, node distance=3cm, inner sep=0pt]
\tikzstyle{block} = [rectangle, draw, fill=blue!20, text width=6em, text centered, rounded corners, minimum height=4em]
\tikzstyle{line} = [draw, -latex']
%\tikzstyle{cloud} = [draw, ellipse,fill=red!20, node distance=3cm, minimum height=2em, text badly centered]
\tikzstyle{legende} = [rectangle, draw, fill=gray!10, text width=6em, text centered, minimum height=4em]

\makeatletter
\newcommand*{\rom}[1]{\expandafter\@slowromancap\romannumeral #1@}
\makeatother

% Avoid orphans and widow lines
\clubpenalty = 10000
\widowpenalty = 10000
\displaywidowpenalty = 10000

% Nested enums should be 1.1, 1.2, ...
\renewcommand{\labelenumii}{\theenumii}
\renewcommand{\theenumii}{\theenumi.\arabic{enumii}.}
% Proper quoting.
\renewcommand{\quote}[1]{``#1''}
% Dashes instead of bullet points in 1st level itemize environments.
\def\labelitemi{--} 

% Paper info.
\makeatletter
\newcommand{\@thesis}{Master's Thesis}
\newcommand{\thesis}[1]{\renewcommand{\@thesis}{#1}}

\newcommand{\@matno}{123456789}
\newcommand{\matno}[1]{\renewcommand{\@matno}{#1}}

\newcommand{\@program}{}
\newcommand{\program}[1]{\renewcommand{\@program}{#1}}

\newcommand{\@firstexaminer}{\hfill}
\newcommand{\firstexaminer}[1]{\renewcommand{\@firstexaminer}{#1}}

\newcommand{\@secondexaminer}{\hfill}
\newcommand{\secondexaminer}[1]{\renewcommand{\@secondexaminer}{#1}}

\newcommand{\@supervisor}{\hfill}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}

\newcommand{\@abstracttext}{}
\newcommand{\abstracttext}[1]{\renewcommand{\@abstracttext}{#1}}

\newcommand{\@germantitle}{}
\newcommand{\germantitle}[1]{\renewcommand{\@germantitle}{#1}}

\hypersetup{%    
  pdfkeywords  = {Hamburg University of Technology (TUHH)},  
  baseurl      = {https://www.tuhh.de/comnets},
  pdfstartview = {FitH},
  pdfview      = {FitH},
  linkcolor    = blue,     % links to same page
  urlcolor     = blue,     % links to URLs
  citecolor    = blue,     % links to citations
  breaklinks   = true,     % links may (line) break
  colorlinks   = \ColorReferenceLinks,     % false for print
  citebordercolor=0 0 0,  % color for \cite
  filebordercolor=0 0 0,
  linkbordercolor=0 0 0,
  menubordercolor=0 0 0,
  urlbordercolor=0 0 0,
  pdfhighlight=/P,   % moeglich /I, /P, ...
  pdfborder=0 0 0,   % keine Box um die Links!
}

\newcommand{\maketitlepage}{	
	% These variables can only be used here because before calling 
	% \maketitlepage they are not defined.
	\hypersetup{
		pdftitle     = {\@title},
		pdfauthor    = {\textcopyright\ \the\year\ \@author},
		pdfsubject   = {\@thesis}
	}
	\thispagestyle{empty}
	\clearpage
	\setlength{\hoffset}{6mm}
	\pagenumbering{gobble}	
	
	\href{https://www.tuhh.de/comnets}{\includegraphics[width=10cm]{comnets-logo-word-mark.pdf}}\\
	\vspace*{\fill}
	
	{\Huge\color{tuhhblue}
		\raggedright
		\MakeUppercase{\@thesis}\\[.5em] 
		\MakeUppercase{\@author}\\
		\rule{.35em}{1pt}\hspace{.1em}\rule{.35em}{1pt}\\[.5em]
		\@title{}\\
		[.5em]\@date{}
	}	

	\vspace*{\fill}
	{\color{tuhhblue}\Large\href{https://www.tuhh.de/}{tuhh.de}}
	\clearpage

	{
		\vspace*{\fill}
		\@title{}\\
		\emph{\@germantitle{}}\\
		\vspace*{.5em}

		\@author\\		
		Matriculation number: \@matno\\		
		\@program
		\vspace*{.5em}
		
		Hamburg University of Technology\\		
		Institute of Communication Networks\\
		\@firstexaminer\\		
		\@secondexaminer\\		
		\@supervisor
		\vspace*{.5em}

		Hamburg, \@date	
	}
	\thispagestyle{empty}
	\clearpage
	\setlength{\hoffset}{0mm}
	
	\chapter*{Declaration of Originality}
	\thispagestyle{empty}
	\vspace*{80mm}
	I hereby declare that the work in this thesis was composed and originated by myself and has not been submitted for another degree or diploma at any university or other institute of tertiary education.  

	I certify that all information sources and literature used are indicated in the text and a list of references is given in the bibliography.

	\vspace*{20mm}
	Hamburg, \@date
	\vspace*{20mm}
	
	\@author
	
	\chapter*{Abstract}
	\thispagestyle{empty}
	\@abstracttext
	
	\tableofcontents	
	% Make sure that there's an even number of pages before the first page that has a pagenumber.
	% If you don't, then when you print twosided you'll have page numbers on the insides, and you don't want that!
	\thispagestyle{empty} % This stuff inserts an empty page to force an even number.
	\afterpage{\null
    \thispagestyle{empty}%    
    \newpage\pagenumbering{arabic}} % Remove all this if you have an even number anyway.
	
}
\makeatother
