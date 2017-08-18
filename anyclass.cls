\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{anyclass}[2017/08/16 Just Any Document Type]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Default values
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newcommand{\DocumentOptions}{11pt,a4paper}
\newcommand{\DocumentClass}{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Option handling
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}		% for key-value options
\SetupKeyvalOptions{
	family=anyclass,
	prefix=anyclass@ }

\DeclareVoidOption{article}{  			
  \renewcommand{\DocumentClass}{article}}
\DeclareVoidOption{book}{  			
  \renewcommand{\DocumentClass}{book}}
\DeclareVoidOption{beamer}{  			
  \renewcommand{\DocumentClass}{beamer}}
\DeclareVoidOption{abstract}{  			
  \renewcommand{\DocumentClass}{abstract}}

\DeclareStringOption{options}[11pt]
\define@key{langscibook}{options}{%
  \renewcommand{\DocumentOptions}{#1}}

\ProcessKeyvalOptions{anyclass}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Abstract
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newcommand{\isabstract}{abstract}
\ifx\DocumentClass\isabstract

\LoadClass[
\DocumentOptions
]{article}

\input{settings/standard-settings}


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
\ifx\DocumentClass\isarticle

\LoadClass[
\DocumentOptions
]{article}

\input{settings/scrarticle-settings}

\input{settings/standard-settings}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Beamer
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newcommand{\isbeamer}{beamer}
\ifx\DocumentClass\isbeamer

\LoadClass[
\DocumentOptions
]{beamer}

\input{settings/beamer-settings.tex}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Book
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newcommand{\isbook}{book}
\ifx\DocumentClass\isbook

\LoadClass[
\DocumentOptions
]{book}

\usepackage{datetime}

\input{settings/standard-settings}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Poster
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% TODO
