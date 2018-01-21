\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jlm}[2016/01/06 v0.4.12 Journal of Language Modelling document class]

\newif\ifjlm@math
\jlm@mathtrue
\newif\ifjlm@copyedit

\DeclareOption{math}{\jlm@mathtrue}
\DeclareOption{nomath}{\jlm@mathfalse}
\def\mapping@option{}
\DeclareOption{TeXligs}{\def\mapping@option{Mapping=tex-text,}}
\DeclareOption{anonymous}{%
  \AtEndOfClass{\def\print@author{Anonymous\gdef\@authorrunning{Anonymous}}%
    \let\print@affiliation\relax}}
\DeclareOption{copyedit}{\jlm@copyedittrue}
\DeclareOption*{\ClassError{jlm}{No options allowed for this class}}
\ProcessOptions

\LoadClass[twoside]{article}

\ifjlm@math
\RequirePackage{amsmath}
\RequirePackage[charter]{mathdesign}
% \RequirePackage{unicode-math}
% \setmathfont{Cambria Math}
\fi

\RequirePackage{xltxtra}
\setmainfont[\mapping@option
  Renderer=ICU,
  SmallCapsFeatures={LetterSpace=3},
  SizeFeatures={{Size={-6},Font=Charlet SL XS},
    {Size={6-8}, Font=Charlet SL S},{Size={8-}}}
]{Charis SIL Compact}
\setmainfont[\mapping@option
  Renderer=ICU,
  SmallCapsFeatures={Letters=SmallCaps,LetterSpace=3},
  SizeFeatures={
    {Size={-6}, Font=Charlet SL XS, 
      SmallCapsFont={*}, 
      SmallCapsFeatures={Letters=SmallCaps,LetterSpace=5}},
    {Size={6-8}, Font={Charlet SL S}, 
      SmallCapsFont={*}, 
      SmallCapsFeatures={Letters=SmallCaps,LetterSpace=4}},
    {Size={8-}}
  }
]{Charis SIL Compact}
\setmonofont[\mapping@option   Renderer=ICU,Scale=.92]{Cousine}
\setsansfont[\mapping@option   Renderer=ICU,Scale=.9,BoldFont={* Semibold}]{Open
  Sans} % in bold caps use +60 tracking
\newfontfamily\titling@font[\mapping@option   Renderer=ICU]{Playfair Display}

%\RequirePackage{unicode-math}

\RequirePackage{natbib}
\bibpunct{(}{)}{;}{a}{}{,}
\RequirePackage{url,array}
\newcommand*{\urlprefix}{}


\catcode`\¶=13
\def¶#1¶#2¶{%
  \ClassError{jlm}{Copy-editing command used not in copy-editing mode!
  Check the manuscript.}
}
\ifjlm@copyedit
\usepackage{marginnote}
\renewcommand{\marginpar}{\marginnote}
\setlength{\marginparwidth}{3.3cm}
\usepackage[textsize=scriptsize]{todonotes}
\usepackage{color}
\usepackage{soul}
\definecolor{lightred}{rgb}{1,.85,.85}
\def\jlm@corr@everysyllable{%
{%
    \setbox\z@\hbox{\the\SOUL@syllable
        \SOUL@setkern\SOUL@charkern
      }%
    \dimen@=\wd\z@
    \dimen@i=\SOUL@uloverlap
    \advance\dimen@2\dimen@i
    \rlap{%
        \null
        \kern-\dimen@i
        \SOUL@ulcolor{\SOUL@ulleaders\hskip\dimen@}%
    }%
    \unhcopy\z@
    \llap{\textcolor{red}{\vrule height.7exdepth-.5ex width\dimen@
      \kern-\dimen@i}}%
}%    \SOUL@ulunderline{%
}
\protected\def\jlmcorr{%
  \sethlcolor{lightred}%
  \SOUL@stsetup
  \let\SOUL@preamble\SOUL@hlpreamble
  \let\SOUL@everysyllable\jlm@corr@everysyllable
  \SOUL@
}
\protected\def\jlm@ensure@notmath#1{\ifmmode\mbox{#1}\else#1\fi}
\protected\def\jlmedit#1#2{\jlm@ensure@notmath{\jlmcorr{#1}\sethlcolor{yellow}\hl{#2}}}
\def¶#1¶#2¶{\jlmedit{#1}{#2}}
\DeclareRobustCommand*\jlm[2][]{\todo[color=red!20,#1]{JLM: #2\@@par}\relax}
\DeclareRobustCommand*\auth[2][]{\todo[color=green!20,#1]{A: #2\@@par}\relax}
% the first argument is optional, it may override default options (inline, noline, etc.)
%
%\newcommand{\ic}{\jlm{insert comma}\hl{,} }
\else
\def\jlm#1{\ClassError{jlm}{Copy-editing command \string\jlm\space
    used not in copy-editing mode! Check the manuscript.}%
}
\def\auth#1{\ClassError{jlm}{Copy-editing command \string\jlm\space
    used not in copy-editing mode! Check the manuscript.}%
}
\fi

\usepackage[colorlinks=false,pdfborder={0 0 0},hyperfootnotes=false]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sizes:

\newdimen\xgu
\newdimen\ygu
\xgu=895044sp
\ygu=895044sp

\baselineskip=1\ygu
\parindent1.5\ygu

\def\thinspace{\kern .125\xgu}
\def\hairspace{\kern .0625\xgu}
\def\negthinspace{\kern-.125\xgu}

\clubpenalty8000
\widowpenalty8000

\parskip0pt
\emergencystretch.5\xgu

\frenchspacing

\renewcommand\normalsize{%
   \@setfontsize\normalsize{.75\ygu}{\ygu}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\renewcommand\small{%
   \@setfontsize\small{.65\ygu}{.87\ygu}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\let\footnotesize\small
\renewcommand\scriptsize{\@setfontsize\scriptsize{.525\ygu}{.63\ygu}}


\def\@textsuperscript#1{%
  {\m@th\ensuremath{^{\mbox{\scriptsize#1}}}}}


\usepackage[papersize={35.41666774\xgu,50\ygu},
bindingoffset=.41666774\xgu,
top=3\ygu,includehead,headheight=1\ygu,headsep=1\ygu,
%textheight=38\ygu,
lines=38,
footskip=3\ygu,%bottom=4\ygu,
inner=4\xgu,%outer=2\xgu,
includemp,marginparsep=1\xgu,marginparwidth=5\xgu,
textwidth=23\xgu]{geometry}


% \textwidth=12.5cm
% \evensidemargin=49pt
% \oddsidemargin=49pt

% \textheight=562pt
% \headsep=16pt
% \topmargin=55,23pt

\setlength\leftmargini  {\parindent}
\setlength\leftmarginii  {\leftmargini}
\setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

\def\@listI{\leftmargin\leftmargini
            \parsep \z@ 
            \topsep 6\p@ \@plus2\p@ \@minus2\p@
            \itemsep2\p@ \@plus\p@}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus2\p@ \@minus\p@}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus\p@\@minus\p@
              \partopsep \p@ \@plus\z@ \@minus\p@}

% LaTeX's dumb defalut is smaller parindent in footnotes.  Redefined:
\renewcommand\@makefntext[1]{%
    \parindent 1.5\ygu
    \noindent
    \hb@xt@\parindent{\hss\@makefnmark\hairspace}#1}
% Thinspace before the callout added:
\def\@footnotemark{%
  \leavevmode
  \ifhmode\edef\@x@sf{\the\spacefactor}\nobreak\fi
  \hairspace\@makefnmark
  \ifhmode\spacefactor\@x@sf\fi
  \relax}
% footnotesize changed to small:
\long\def\@footnotetext#1{\insert\footins{%
    \reset@font\small
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}%

\setlength\arraycolsep{.5\xgu}
\setlength\tabcolsep{.5\xgu}

\setcounter{topnumber}{4}
\renewcommand\topfraction{.8}
\setcounter{bottomnumber}{3}
\renewcommand\bottomfraction{.4}
\setcounter{totalnumber}{6}
\renewcommand\textfraction{.1} % 5/46
\renewcommand\floatpagefraction{.6}
\textfloatsep=\ygu \@plus .5\ygu \@minus .3\ygu
\floatsep=\ygu \@plus.3\ygu \@minus .3\ygu
\intextsep=\ygu \@plus .3\ygu \@minus .3\ygu

\abovecaptionskip=6\p@
\belowcaptionskip=6\p@

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titlepage:

\def\@title{\@latex@error{No \noexpand\title given}\@ehc}
\def\@author{\@latex@error{No \noexpand\author given}\@ehc}
\def\@affiliation{\@latex@error{No \noexpand\affiliation given}\@ehc}

\def\titlerunning{\gdef\@titlerunning}
\def\authorrunning{\gdef\@authorrunning}
\def\affiliation{\gdef\@affiliation}
\let\institute\affiliation
\newcommand*{\email}[1]{\texttt{#1}}


\renewcommand*{\and}{\unskip, }
\newcommand*\inst[1]{\unskip\hairspace\textsuperscript{\normalfont#1}}

% if only one affiliation don't produce numbers:
\newcount\@affilnum
\newcommand*{\pr@afn}{%
  \leavevmode
  \llap{\textsuperscript{\number\@affilnum}\ }%
}
\newcommand*{\print@affiliation}{{%
  % step 1: count them
  \@affilnum=1
  \def\and{\global\advance\@affilnum1 }%
  {\setbox0=\vbox{\def\thanks##1{}\@affiliation}}%
  \edef\max@affilnum{\number\@affilnum}%
  % step 2: print them
%  \leftskip=15pt
  \@affilnum1
  \ifnum\max@affilnum>1 \pr@afn\fi
  \def\and{\\\advance\@affilnum1 \pr@afn}%
  \@affiliation\par
}}

% the last \and should print different:
\newcommand*{\print@author}{%
  % step 1: count them
  \@affilnum=0
  \def\and{\global\advance\@affilnum1 }%
  {\setbox0=\vbox{\def\thanks##1{}\def\footnote##1{}\@author}}%
  \edef\max@auth{\number\@affilnum}%
  % step 2: print them
  \@affilnum=0 \rightskip=0pt
  \def\and{\unskip
    \advance\@affilnum1
    \ifnum\max@auth=\@affilnum
      \ifnum\@affilnum=1\else,\fi
      \ \hfil\penalty20\hfilneg
    {and}\ \else,\ \hfil\penalty20\hfilneg\fi
    }%
  \@author
}

\def\jlm@year{1970}
\def\jlm@vol{$i^2$}
\def\jlm@issue{$e^{i\pi}$}

\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1.5\ygu\noindent
            \hb@xt@\parindent{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \thispagestyle{first}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \hrule height\z@
%  \vspace*{-32pt}%
  \vskip-\topskip
%   \vbox to0pt{\vss
%     \centerline{\small        \footnotesize
%       \begin{tabular}{@{}c@{}}%
%         \textit{Journal of Language Modelling} Vol~\jlm@vol, No
%           \jlm@issue\ (\jlm@year),\enspace %\\[2pt]
%         pages
%         \arabic{page}–\pageref{@last:pag@:@f:the:articl@},\enspace 
%         ISSN \ifx\jlmisbn\@undefined666-666-666\else\jlmisbn\fi\enspace
%       \end{tabular}}%
% %    \vskip\ygu
%   }%
%  \hrule %height\z@

  {\centering
  \let \footnote \thanks
    {\titling@font\fontsize{1.25\ygu}{1.5\ygu}\selectfont
      \addfontfeature{LetterSpace=-2.0}%
      \@title \par}%
    \vskip 3\ygu
    {\normalsize \textit{\print@author} \par}%
%    \vskip \ygu%
    {\small \print@affiliation}
  }%
  \write@toc@entries
  \vskip 2\ygu plus.5\ygu
  \setup@runningheads
}

% \AtEndDocument{\clearpage\addtocounter{page}{-1}%
%   \immediate\write\@auxout{\string
%     \newlabel{@last:pag@:@f:the:articl@}{{}{\thepage}}}%
%   \addtocounter{page}{1}%
% }
\AtEndDocument{\label{@last:pag@:@f:the:articl@}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract & keywords:

%\newcommand*\keywords[1]{\par\vskip2pt\noindent\textbf{Keywords:}\enspace#1\par}
\def\keywords{\gdef\@keywords}
\keywords{[missing!]\@latex@error{No \noexpand\keywords given}\@ehc}

\renewenvironment{abstract}{%
  \section*{\abstractname}%
  % \centerline{\titling@font\fontsize{.9\ygu}{1.2\ygu}%
  %   % \addfontfeature{Letters=Uppercase}
  %   \addfontfeature{LetterSpace=4.0}%
  %   \MakeUppercase{\abstractname}}%
%  \everypar{\marginpar{\small\itshape\raggedright Keywords:
%  \@keywords}\everypar{}}
  \marginpar{\small\itshape\raggedright \noindent\\[1.5ex]Keywords: \@keywords}%
}{%
  \@@par
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sectioning:

\def\@seccntformat#1{\csname the#1\endcsname\enspace}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-1.6\ygu}%
                                   {.4\ygu}%
                                   {\titling@font\fontsize{.9\ygu}{1\ygu}%
                                     %\addfontfeature{Letters=Uppercase}
                                     \scshape
                                     \addfontfeature{Letters=UppercaseSmallCaps,LetterSpace=4.0}%
                                     %\MakeLowercase
                                   }}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-.7\ygu}%
                                     {.3\ygu}%
                                     {\normalfont\normalsize\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-.7\ygu}%
                                     {.3\ygu}%
                                     {\normalfont\small}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{% JLM:
        \setbox\@tempboxa\hbox{\normalfont\small\hskip #3\relax\@svsec}%
        \leftskip=\wd\@tempboxa plus1fill
        \rightskip=\leftskip
        \parindent\z@
        \interlinepenalty \@M
        \hyphenpenalty10000
        \leavevmode\hskip-\wd\@tempboxa plus-1fill\box\@tempboxa\hfill#8\@@par
      }% :JLM
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\normalfont\small\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{% JLM:
        \setbox\@tempboxa\hbox{\hskip #1\relax}% for symmetry
        \leftskip=\wd\@tempboxa plus1fill
        \rightskip=\leftskip
        \parindent\z@
        \interlinepenalty \@M
        \hyphenpenalty10000
        \leavevmode\hskip-\wd\@tempboxa plus-1fill\box\@tempboxa\hfill#5\@@par
      }% :JLM
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pagestyle:

\newcommand*{\setup@runningheads}{%
  {\let\inst\@gobble \let\thanks\@gobble \let\footnote\@gobble
    \let\\\space
    \ifx\@authorrunning\@undefined\protected@xdef\@authorrunning{\@author}\fi
    \ifx\@titlerunning\@undefined\protected@xdef\@titlerunning{\@title}\fi
    \setbox0\hbox{\small\itshape\@authorrunning}%
    \ifdim\wd0>.7\textwidth
      \gdef\@authorrunning{Author too long for running head}%
    \fi
    \setbox0\hbox{\small\itshape\@titlerunning}%
    \ifdim\wd0>.7\textwidth
      \gdef\@titlerunning{Title too long for running head}%
    \fi
  }
  \markboth{\@authorrunning}{\@titlerunning}%
}

\def\ps@headings{%
  \def\@oddfoot{\small\hfil[\quad\thepage\quad]\hfil}%
  \def\@evenfoot{\small\hfil[\quad\thepage\quad]\hfil}%
  \def\@evenhead{\small\hfil{\itshape\leftmark}\hfil}%
  \def\@oddhead{\small\hfil{\itshape\rightmark}\hfil}%
  \let\@mkboth\@gobbletwo
  \let\sectionmark\@gobble
  \let\subsectionmark\@gobble
}
\pagestyle{headings}

\def\ps@plain{%
  \def\@oddfoot{\small\hfil[\quad\thepage\quad]\hfil}%
  \def\@evenfoot{\small\hfil[\quad\thepage\quad]\hfil}%
  \def\@evenhead{}%
  \def\@oddhead{}%
  \let\@mkboth\@gobbletwo
  \let\sectionmark\@gobble
  \let\subsectionmark\@gobble
}

\def\ps@first{%
  \def\@evenfoot{\small\hfil[\quad\thepage\quad]\hfil}%
  \def\@oddfoot{\small\hfil\textit{Journal of Language
      Modelling} Vol~\jlm@vol, No \jlm@issue\ (\jlm@year),\enspace
    pp.~\arabic{page}–\pageref{@last:pag@:@f:the:articl@}\hfil}%
  \def\@evenhead{}%
  \def\@oddhead{}%
  \let\@mkboth\@gobbletwo \let\sectionmark\@gobble
  \let\subsectionmark\@gobble }

%\let\ps@plain\ps@empty % a hack for first page

% \def\ps@myheadings{%
%     \let\@oddfoot\@empty\let\@evenfoot\@empty
%     \def\@evenhead{\thepage\hfil\small\itshape\leftmark}%
%     \def\@oddhead{{\small\itshape\rightmark}\hfil\thepage}%
%     \let\@mkboth\@gobbletwo
%     \let\sectionmark\@gobble
%     \let\subsectionmark\@gobble
%     }

% \pagestyle{myheadings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table of contents:
\def\write@toc@entries{%
  \newwrite\jlm@toc
  \immediate\openout \jlm@toc \jobname.toc\relax
  {\let\thanks\@gobble
    \let\footnote\@gobble
    \def\\{ }%
    \let~\\
    \protected@xdef\toc@title{\@title}}%
%  \addcontentsline{toc}{title}{\toc@title}%
  {\let\inst\@gobble
    \let\thanks\@gobble
    \let\footnote\@gobble
    \def\and{\noexpand\protect\noexpand\and}%
    \protected@xdef\toc@author{\@author}}%
%  \addcontentsline{toc}{author}{\toc@author}%
  {\let\protect\@unexpandable@protect
  \immediate\write\jlm@toc{\noexpand\jlmarticle{\toc@title}{\toc@author}{\thepage}}}%
  \immediate\closeout\jlm@toc
}

\renewcommand*\@pnumwidth{2em}
\renewcommand*\@tocrmarg{2.55em}

\def\l@title#1#2{\addpenalty{-\@highpenalty}
 \addvspace{8pt plus 1pt}
 \@tempdima \z@
 \begingroup
 \hyphenpenalty2000
 \def\\{\unskip\protect\space\protect\ignorespaces}%
 \parindent \z@ \rightskip \@tocrmarg plus 5em
 \parfillskip -\@tocrmarg
 \leavevmode \advance\leftskip\@tempdima \hskip -\leftskip
 {\bfseries#1}\nobreak
 \leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern
 \@dotsep mu$}\hskip \@pnumwidth plus 1fill
 \nobreak\hbox to\@pnumwidth{\hss #2}\par
 \penalty\@highpenalty \endgroup}

\def\l@author#1#2{%
  {\raggedright
%   \protect\leftskip15\p@
    \rightskip\@tocrmarg
    \advance\rightskip\@flushglue
    \itshape#1\endgraf}}

\def\l@inviteds#1#2{\addpenalty{\@secpenalty}%
   \addvspace{2em plus\p@}%  % space above part line
   \begingroup
     \parindent \z@
     \rightskip \z@ plus 5em
     \hrule\vskip5pt
     \bfseries\boldmath   % set line in boldface
     \leavevmode          % TeX command to enter horizontal mode.
     #1\par
%     \vskip2pt
   \endgroup}
\def\l@invitedb#1#2{%
  {\raggedright
%   \protect\leftskip15\p@
    \rightskip\@tocrmarg
    \advance\rightskip\@flushglue
    \itshape Invited by #1\endgraf}%
     \vskip5pt
     \hrule
     \vskip1pt
     \nobreak             % Never break after part entry
}

\def\l@part#1#2{\addpenalty{\@secpenalty}%
   \addvspace{2em plus\p@}%  % space above part line
   \begingroup
   \hyphenpenalty2000
     \parindent \z@
     \rightskip \z@ plus 5em
     \hrule\vskip5pt
     \bfseries\boldmath   % set line in boldface
     \leavevmode          % TeX command to enter horizontal mode.
     #1\par
%     \vskip2pt
   \endgroup
   \vskip5pt
   \hrule
   \vskip1pt
   \nobreak             % Never break after part entry
 }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Floats:

\newbox\jlm@float@box
%\newbox\jlm@caption@box
\def\jlm@fig@width{23}
\def\jlm@caption@width{5}
\newcount\jlm@float@id

\tabcolsep=.5\xgu

\def\jlm@find@pagenum{% defines \jlm@float@pagenum to the number of
                      % the page the float will end on based on the
                      % respective label
  \global\advance\jlm@float@id 1\relax
  \label{jlm@float@\number\jlm@float@id}%
  \edef\jlm@float@pagenum{%
    \expandafter\ifx\csname r@jlm@float@\number\jlm@float@id\endcsname\relax
    % Page number yet unknown, use current page:
    \c@page%
    \else
    \expandafter\expandafter\expandafter\jlm@extract@pagenum
      \csname r@jlm@float@\number\jlm@float@id\endcsname\@nil
    \fi}%
}

% Special variant: to get page number of the _next_ float:
\def\jlm@find@next@pagenum{%
  \edef\jlm@float@pagenum{%
    \expandafter\ifx\csname r@jlm@float@\number\numexpr\jlm@float@id+1\endcsname\relax
    % Page number yet unknown, use current page:
    \c@page%
    \else
    \expandafter\expandafter\expandafter\jlm@extract@pagenum
      \csname r@jlm@float@\number\numexpr\jlm@float@id+1\endcsname\@nil
    \fi}%
}

% Representation of refs depends on hyperref: 5 arguments instead of
% usual 2.  This should work in both situations.
\def\jlm@extract@pagenum#1#2#3\@nil{#2}

\newcommand*{\jlmfloatsetup}[1]{%
  \expandafter\ifx\csname jlm@float@setup@#1\endcsname\relax
    \ClassError{jlm}{Unknown float setup `#1'}{}%
  \else
    \csname jlm@float@setup@#1\endcsname
  \fi
}
\expandafter\def\csname jlm@float@setup@0\endcsname{%
  \def\jlm@fig@width{29}%
  \def\jlm@caption@width{0}%
}
% This is special: widths like setup 1 but with caption below:
\expandafter\def\csname jlm@float@setup@l\endcsname{%
  \def\jlm@fig@width{23}%
  \def\jlm@caption@width{0}%
}
\expandafter\def\csname jlm@float@setup@1\endcsname{%
  \def\jlm@fig@width{23}%
  \def\jlm@caption@width{5}%
}
\expandafter\def\csname jlm@float@setup@2\endcsname{%
  \def\jlm@fig@width{20}%
  \def\jlm@caption@width{8}%
}
\expandafter\def\csname jlm@float@setup@3\endcsname{%
  \def\jlm@fig@width{17}%
  \def\jlm@caption@width{11}%
}
\expandafter\def\csname jlm@float@setup@4\endcsname{%
  \def\jlm@fig@width{14}%
  \def\jlm@caption@width{14}%
}
\expandafter\def\csname jlm@float@setup@5\endcsname{%
  \def\jlm@fig@width{11}%
  \def\jlm@caption@width{17}%
}

\def\jlm@floating@body#1#2{\def\jlm@float@opt{#2}%
    \def\@captype{#1}%
    \gdef\jlm@hold@caption{}%
    \setbox\jlm@float@box\vtop\bgroup\vskip\z@
    \jlm@find@next@pagenum
    \ifodd\jlm@float@pagenum  \raggedright\else\raggedleft\fi
    \hsize\jlm@fig@width\xgu\relax}
\def\endjlm@floating@body{\egroup
    \edef\reserved@a{\noexpand\@float{\@captype}[\jlm@float@opt]}%
    \reserved@a
    \jlm@find@pagenum
    \ifnum\jlm@caption@width=0\relax % full width, caption above or below:
    \csname jlm@caption@zero@\@captype\endcsname
    \else
    \ifodd\jlm@float@pagenum
    % odd page, caption on the right:
      \noindent
      \box\jlm@float@box
      \kern\xgu
      \vtop{\vskip\z@\hsize\jlm@caption@width\xgu\relax\raggedright\small
        \jlm@hold@caption}%
      \kern-6\xgu\null
    \else % even page, caption on the left:
      \noindent\kern-6\xgu
      \vtop{\vskip\z@\hsize\jlm@caption@width\xgu\relax\raggedleft\small
        \jlm@hold@caption}%
      \kern\xgu
      \box\jlm@float@box
    \fi
    \fi
  \end@float
}

\def\jlm@caption@zero@below{%
    \@@line{\ifodd\jlm@float@pagenum\else\kern\numexpr 23-\jlm@fig@width\relax\xgu\fi
      \vtop{\vskip\z@\hsize\jlm@fig@width\xgu\relax\raggedright\small
        \box\jlm@float@box
      }\ifodd\jlm@float@pagenum\kern\numexpr 23-\jlm@fig@width\relax\xgu\fi
    }\medskip
    \small
    \let\jlm@capt@break\jlm@no@capt@break
    \jlm@hold@caption\par
}
\def\jlm@caption@zero@above{%
      \small
      \let\jlm@capt@break\jlm@no@capt@break
      \jlm@hold@caption\par\smallskip
      \@@line{\ifodd\jlm@float@pagenum\else\kern\numexpr 23-\jlm@fig@width\relax\xgu\fi
        \vtop{\vskip\z@\hsize\jlm@fig@width\xgu\relax\raggedright\small
          \box\jlm@float@box
        }\ifodd\jlm@float@pagenum\kern\numexpr 23-\jlm@fig@width\relax\xgu\fi
    }%
}

\let\jlm@caption@zero@figure\jlm@caption@zero@below
\let\jlm@caption@zero@table\jlm@caption@zero@above
\let\jlm@caption@zero@algocf\jlm@caption@zero@below

\renewenvironment{figure}[1][\fps@figure]%
{\jlm@floating@body{figure}{#1}}%
{\endjlm@floating@body}%  

\renewenvironment{table}[1][\fps@table]%
{\jlm@floating@body{table}{#1}\small}%
{\endjlm@floating@body}%  

\def\jlm@capt@break{\\}
\def\jlm@no@capt@break{\unskip\ \ignorespaces}
\long\def\@makecaption#1#2{%
  \gdef\jlm@hold@caption{{#1}:\jlm@capt@break#2}%
}

\newenvironment{sidewaysfigure}%
  {\def\@captype{figure}%
    \gdef\jlm@hold@caption{}%
    \setbox\jlm@float@box\vtop\bgroup\vskip\z@
  \hsize\textheight\raggedright
  \small %???!!! decyzja projektowa
}
  {\egroup
    \@float{figure}[p]%
    \jlm@find@pagenum
    \@@line{\ifodd\jlm@float@pagenum\else\kern-6\xgu\fi
      \setbox0
      \vbox to29\xgu
      {\ifodd\jlm@float@pagenum\vskip\z@\else\vfill\fi
        \hsize\textheight\raggedright\small
        \let\jlm@capt@break\jlm@no@capt@break
        \box\jlm@float@box
        \medskip
        \jlm@hold@caption\par
        \ifodd\jlm@float@pagenum\vfill\else\vskip\z@\fi
      }%
      \rotatebox{90}{\box0}\ifodd\jlm@float@pagenum\kern-6\xgu\fi
    }%
  \end@float
}

\newenvironment{sidewaystable}%
  {\def\@captype{table}%
    \gdef\jlm@hold@caption{}%
    \setbox\jlm@float@box\vtop\bgroup\vskip\z@
  \hsize\textheight\raggedright
  \small %???!!! decyzja projektowa
}
  {\egroup
    \@float{table}[p]%
    \jlm@find@pagenum
    \@@line{\ifodd\jlm@float@pagenum\else\kern-6\xgu\fi
      \setbox0
      \vbox to29\xgu
      {\ifodd\jlm@float@pagenum\vskip\z@\else\vfill\fi
        \hsize\textheight\raggedright\small
        \let\jlm@capt@break\jlm@no@capt@break
        \jlm@hold@caption\par
        \medskip
        \box\jlm@float@box
        \ifodd\jlm@float@pagenum\vfill\else\vskip\z@\fi
      }%
      \rotatebox{90}{\box0}\ifodd\jlm@float@pagenum\kern-6\xgu\fi
    }%
  \end@float
}


% Text flushed towards inside margin (left or right depending on page number):
\newenvironment{flushinside}{\trivlist 
\item\relax\raggedout
}
{\endtrivlist}

\newcommand*{\raggedout}{\jlm@find@pagenum
  \ifodd\jlm@float@pagenum  \raggedright\else\raggedleft\fi
}

\newenvironment{stickout}{\trivlist 
\item\relax
  \jlm@find@pagenum
  \unless\ifodd\jlm@float@pagenum \hspace*{-6\xgu}\fi
  \begin{minipage}{29\xgu}
  }{
  \end{minipage}%
  \ifodd\jlm@float@pagenum \hspace*{-6\xgu}\fi
\endtrivlist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bibliography:

%\RequirePackage{multicol}
\columnsep=\xgu

\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \small
%      \begin{multicols}{2}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{}%{\@biblabel{#1}}%
            \leftmargin\labelwidth
%            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}%
          \raggedright}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist%\end{multicols}
}


\AtBeginDocument{%
  \@ifpackageloaded{natbib}{%
    \def\bibfont{\small}}{}}

% algorithms:

\AtBeginDocument{%
  \@ifpackageloaded{algorithm2e}{%
    \RestyleAlgo{plain}%
    \renewcommand{\algocf@makecaption}[2]{%
      \gdef\jlm@hold@caption{{#1}:\jlm@capt@break#2}%
    }%
    \let\algocf@makecaption@ruled\algocf@makecaption
    \renewcommand{\algocf@captiontext}[2]{%
      #1:\jlm@capt@break#2}%
    \def\AlCapFnt{\small\normalfont}%
    \def\AlCapNameFnt{\small\normalfont}%
    \setlength{\algomargin}{0pt}%
    \renewenvironment{algocf}[1][htbp]%      % float environment for algorithms
        {\jlm@floating@body{algocf}{#1}\vspace*{-3.5pt}}%
        {\endjlm@floating@body}%
      }{}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creative Commons:


\def\licenceccby{%
  \def\lic@notice{%
    \textit{This work is licensed under the Creative Commons Attribution 3.0
      Unported License.}\\*[1pt]
    \url{http://creativecommons.org/licenses/by/3.0/}\\*[2pt]
    \includegraphics[scale=.7]{cc-by.pdf}}}

\def\licenceccbysa{%
  \def\lic@notice{%
    \textit{This work is licensed under the Creative Commons\\
      Attribution-ShareAlike 3.0
      Unported License.}\\*[1pt]
    \url{http://creativecommons.org/licenses/by-sa/3.0/}\\*[2pt]
    \includegraphics[scale=.7]{cc-by-sa.pdf}}}

\def\licenceccbynd{%
  \def\lic@notice{%
    \textit{This work is licensed under the Creative Commons Attribution-NoDerivs 3.0
      Unported License.}\\*[1pt]
    \url{http://creativecommons.org/licenses/by-nd/3.0/}\\*[2pt]
    \includegraphics[scale=.7]{cc-by-nd.pdf}}}

\def\licenceccbync{%
  \def\lic@notice{%
    \textit{This work is licensed under the Creative Commons\\
      Attribution-NonCommercial 3.0
      Unported License.}\\*[1pt]
    \url{http://creativecommons.org/licenses/by-nc/3.0/}\\*[2pt]
    \includegraphics[scale=.7]{cc-by-nc.pdf}}}

\def\licenceccbyncsa{%
  \def\lic@notice{%
    \textit{This work is licensed under the Creative Commons\\
      Attribution-NonCommercial-ShareAlike 3.0
      Unported License.}\\*[1pt]
    \url{http://creativecommons.org/licenses/by-nc-sa/3.0/}\\*[2pt]
    \includegraphics[scale=.7]{cc-by-nc-sa.pdf}}}

\def\licenceccbyncnd{%
  \def\lic@notice{%
    \textit{This work is licensed under the Creative Commons\\
      Attribution-NonCommercial-NoDerivs 3.0
      Unported License.}\\*[1pt]
    \url{http://creativecommons.org/licenses/by-nc-nd/3.0/}\\*[2pt]
    \includegraphics[scale=.7]{cc-by-nc-nd.pdf}}}

\licenceccby

\AtEndDocument{\par%
  \vspace{2\ygu}%
  \nopagebreak
  {\centering\footnotesize\lic@notice\par}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TeX logos adapted for Charis:
\protected\def\TeX{{\sbox0TT\kern-.11\wd0\lower.5ex\hbox{E}\kern-.09\wd\z@
    X\@}}
\DeclareRobustCommand{\LaTeX}{{%
    \sbox\z@ L%
    L\kern-.48\wd\z@
    \sbox\z@ T%
    \vbox to\ht\z@{\hbox{\fontsize{\ht\z@}\z@
        \math@fontsfalse\selectfont
        \fontspec{Charlet SL XS}%
        A}%
      \vss}%
    \kern-.12\wd\z@
  }%
  \TeX}
\DeclareRobustCommand\Xe{%
  X%
  {\sbox\z@ E%
    \kern-.09\wd\z@}%
  \lower.5ex\hbox{%
    \ifnum\XeTeXfonttype\font>\z@
      \ifnum\XeTeXcharglyph"018E>\z@
        \char"018E%
      \else
        \ifdim\fontdimen\@ne\font=\z@
          \reflectbox{E}%
        \else
          \reflectbox{%
            \addfontfeature{FakeSlant=-\strip@pt\fontdimen\@ne\font}%
            \upshape E}%
        \fi
      \fi
    \else
      \ifdim\fontdimen1\font=\z@
        \reflectbox{E}%
      \else
        \XeTeXuseglyphmetrics\@ne
        \setbox\z@\hbox{E}%
        \dimen@\ht\z@
        \advance\dimen@\dp\z@
        \ltx@sh@ft\dimen@
        \raise\dimen@\hbox{\rotatebox{180}{\box\z@}}%
        \xl@sh@ft\dimen@
      \fi
    \fi}%
}
\DeclareRobustCommand\XeLaTeX{%
  \Xe
  {\sbox\z@ T%
    \kern-.05\wd\z@}%
  \LaTeX
}
\DeclareRobustCommand\XeTeX{%
  \Xe
  {\sbox0T\kern-.11\wd\z@}%
  \TeX
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\clearemptydoublepage}{%
        \newpage{\pagestyle{empty}\cleardoublepage}}

\def\tabragged{%
%  \let\\\@centercr
  \@rightskip\z@ plus3em %\@flushglue
  \rightskip\@rightskip
  \leftskip\z@skip
  \parindent\z@}

\newcommand*{\onemore}{{\looseness1 \par}}
\newcommand*{\oneless}{{\looseness-1 \par}}

\newcommand*{\acro}[1]{{\addfontfeature{Letters=UppercaseSmallCaps,LetterSpace=2}#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\InputIfFileExists{../jlm.conf}{}{}
\InputIfFileExists{jlm.conf}{}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Interaction with commonly used packages:

\def\patch@gbIVe{%
  \exewidth{(99)}%
  \def\@exe[##1]{\ifnum \@xnumdepth >0%
                 \if@xrec\@exrecwarn\fi%
                 \if@noftnote\@exrecwarn\fi%
                 \@xnumdepth0\@listdepth0\@xrectrue%
                 \save@counters%
              \fi%
                 \advance\@xnumdepth \@ne \@@xsi%
                 \begin{list}{(\thexnumi)}%
                             {\usecounter{xnumi}\@subex{##1}{.8em}%
                              \if@noftnote%
                                 \setcounter{xnumi}{\value{exx}}%
                              \else%
                                 \setcounter{xnumi}{\value{fnx}}%
                              \fi}%
                            %MW:
                            \def\makelabel####1{\normalfont####1\hfil}%
%                            \small
                            %:MW
                          }%
}

% gb4e.sty:
\AtBeginDocument{%
  \@ifpackageloaded{gb4e}{\patch@gbIVe}{}%
  \@ifpackageloaded{gb4e+}{\patch@gbIVe}{}%
}

\endinput