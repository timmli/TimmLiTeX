\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{anydoc}[2017/08/16 Just Any Document Type]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Default values
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newcommand{\FontSize}{11pt}
\newcommand{\DocumentType}{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Option handling
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}		% for key-value options
\SetupKeyvalOptions{
	family=anydoc,
	prefix=anydoc@ }

\DeclareVoidOption{article}{  			
  \renewcommand{\DocumentType}{article}}
\DeclareVoidOption{book}{  			
  \renewcommand{\DocumentType}{book}}
\DeclareVoidOption{beamer}{  			
  \renewcommand{\DocumentType}{beamer}}
\DeclareVoidOption{abstract}{  			
  \renewcommand{\DocumentType}{abstract}}

\DeclareStringOption{documenttype}[article]
\define@key{langscibook}{type}{%
  \renewcommand{\DocumentType}{#1}}

\DeclareVoidOption{12pt}{  			
  \renewcommand{\FontSize}{12pt}}
\DeclareVoidOption{11pt}{  			
  \renewcommand{\FontSize}{11pt}}
\DeclareVoidOption{10pt}{  			
  \renewcommand{\FontSize}{10pt}}

\DeclareStringOption{fontsize}[11pt]
\define@key{langscibook}{fontsize}{%
  \renewcommand{\FontSize}{#1}}

\ProcessKeyvalOptions{anydoc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Abstract
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newcommand{\isabstract}{abstract}
\ifx\DocumentType\isabstract

\LoadClass[
\FontSize,
a4paper,
]{article}

\input{settings/standard-preamble}


\usepackage[left=25mm, right=25mm, top=25mm, bottom=25mm, noheadfoot]{geometry}
\pagenumbering{gobble}

\PassOptionsToPackage{maxbibnames=1,maxcitenames=1,firstinits=true}{biblatex}
\defbibenvironment{bibliography}{\noindent}{\unspace}{\xspace$\bullet$\xspace}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% ACL
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% TODO


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Article
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newcommand{\isarticle}{article}
\ifx\DocumentType\isarticle

\LoadClass[
\FontSize,
draft,
twoside
]{scrartcl}

\input{settings/scrarticle-settings}

\input{settings/standard-preamble}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Beamer
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newcommand{\isbeamer}{beamer}
\ifx\DocumentType\isbeamer

\LoadClass[
% 8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt, 20pt
% serif,
% table, % for table coloring
% draft,
% ngerman,
% handout,	% remove overlays
compress,
xcolor=table,
dvipsnames,
]{beamer}

\input{settings/beamer-preamble.tex}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Book
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newcommand{\isbook}{book}
\ifx\DocumentType\isbook

\LoadClass[
\FontSize,
bibliography=totoc,
numbers=noenddot,
% draft
]{scrbook}

\usepackage{datetime}

\input{settings/standard-preamble}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Poster
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% TODO
