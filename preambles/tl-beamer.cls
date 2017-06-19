\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{preambles/tl-beamer}[2017/04/26 v0.1 My Beamer Preamble]

\LoadClass[
% 8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt, 20pt
% serif,
% table, % for table coloring
% draft,
% ngerman,
% handout,	% remove overlays
compress,
xcolor=table, % doesn't play well together with ccg.sty
dvipsnames,
]{beamer}

\usepackage{tipa}
%% Encoding, fonts, language
\input{settings/pdflatex_setup}

\usepackage{etex} 
\usepackage{graphics}
\input{settings/tikz_setup} 
\input{settings/forest_setup}

\usepackage{url}
\usepackage{amsmath,amssymb,amsfonts,marvosym}
\usepackage{ulem}			% to cross out text
\normalem

\usepackage{ragged2e}
\let\raggedright=\RaggedRight

% \usepackage{tipa}
\usepackage{linguex}   % must be loaded below \usepackage[T1]{fontenc}
\AtBeginDocument{
  \setlength{\Exlabelsep}{0em}		% for linguex examples
  \setlength{\SubExleftmargin}{1,5em}	% for linguex examples
  \renewcommand\eachwordone{\sffamily}	% for glossing with linguex
  \renewcommand\eachwordtwo{\sffamily}	% for glossing with linguex
  % \setlength{\Extopsep}{1ex}   % vertical margin in linguex examples
}
\input{settings/avm_setup}


\input{settings/beamer_setup}

%% Bibliography
%% BibLaTeX
\input{settings/biblatex_setup.tex}
%% BibTeX 
% \input{settings/natbib_bibtex_setup.tex} 
% \PassOptionsToPackage{round}{natbib}
% \renewcommand{\newblock}{}    % to make natbib compatible with beamer


\usepackage{calc}
\usepackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1em}
\setlength{\TPVertModule}{1ex}

\newlength{\textposOriginH}
\newlength{\textposOriginV}
\setlength{\textposOriginH}{10mm}
\setlength{\textposOriginV}{10mm}
\textblockorigin{\textposOriginH}{\textposOriginV}

\newcommand{\freeblock}[2]{
  \begin{textblock}{0.1}(#1)
  #2
  \end{textblock}
}

% \usepackage{packages/tl-ccg}
