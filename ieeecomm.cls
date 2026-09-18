%%
%% ieeecomm.cls -- IEEE Transactions/Journals colour template, rebuilt on IEEEtran.
%%
%% Version 2.0, 2026/09/17.
%%
%% Copyright (c) 2026 by Thomas Chaffey
%%
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License (LPPL), either version 1.3c of this license
%% or (at your option) any later version.  The latest version of this license
%% is at http://www.latex-project.org/lppl.txt and version 1.3c or later is
%% part of all distributions of LaTeX version 2008/05/04 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% The Current Maintainer of this work is Thomas Chaffey.
%% This work consists of the file ieeecolor.cls.
%%
%% This class loads IEEEtran.cls (V1.8b, copyright (c) 1993-2000 by Gerry
%% Murray, Silvano Balemi, Jon Dixon, Peter Nuchter, Juergen von Hagen and
%% copyright (c) 2001-2015 by Michael Shell, distributed under the LPPL
%% version 1.3), which it does not include and which is obtained from the
%% user's TeX distribution.  The definitions of \@maketitle,
%% \@IEEEpeerreviewmaketitle, \thanks, \abstract, \IEEEkeywords,
%% \@makecaption and the IEEEbiography and IEEEbiographynophoto
%% environments in this file are modified copies of the corresponding
%% definitions in IEEEtran.cls V1.8b by Michael Shell and remain under the
%% LPPL.  This is a modified, differently named work; it is not IEEEtran.cls
%% and is not supported by Michael Shell or by the IEEE.
%%
%% The appearance (colour values, fonts, running-head rule, option and hook
%% names) follows IEEE's ieeecolor.cls V1.7, which is not included and from
%% which no code is copied.
%%
%% This work is provided "as is", without warranty of any kind.
%%
%%
%% Options (in addition to every IEEEtran option):
%%   web            RGB accent colours (default)
%%   print          accent colours become black
%%   nocolor        plain IEEEtran appearance (no colour, no sans, no rule),
%%                  but xcolor, \revised and the compatibility names remain
%%   noheadrule     omit the coloured rule under the running head
%%   norevisions    \revised{...} and the revision environment print in black,
%%                  and \revisionson is disabled (for the final version)
%%   dvipsnames, svgnames, x11names, table   passed on to xcolor
%%
%%
%% Revision highlighting:
%%   \revised{text}            colour text (may contain paragraphs, inline and
%%                             display maths); usable in captions and headings
%%   \begin{revision}...\end{revision}
%%                             the same as an environment, for blocks that
%%                             contain alignments (align, IEEEeqnarray,
%%                             tabular), floats or lists.  The argument of
%%                             \revised must not contain an alignment's & or
%%                             \\ (a cell boundary closes the colour group):
%%                             put \revised inside one cell, or wrap the whole
%%                             alignment in a revision environment.
%%                             Section headings inside a revision environment
%%                             take the revision colour too.
%%   \revisionsoff / \revisionson   switch highlighting off/on from here
%%   revisioncolor             the colour used (default rgb 0,0,1)
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ieeecomm}[2026/09/17 v1.0 IEEE colour journal template on IEEEtran,
community version]

%% ---------------------------------------------------------------------------
%% Options
%% ---------------------------------------------------------------------------
\newif\if@ieeecolor@web        \@ieeecolor@webtrue
\newif\if@ieeecolor@styled     \@ieeecolor@styledtrue
\newif\if@ieeecolor@rule       \@ieeecolor@ruletrue
\newif\if@ieeecolor@revisions  \@ieeecolor@revisionstrue

\DeclareOption{web}{\@ieeecolor@webtrue}
\DeclareOption{print}{\@ieeecolor@webfalse}
\DeclareOption{nocolor}{\@ieeecolor@styledfalse}
\DeclareOption{nocolour}{\@ieeecolor@styledfalse}
\DeclareOption{noheadrule}{\@ieeecolor@rulefalse}
\DeclareOption{norevisions}{\@ieeecolor@revisionsfalse}
% xcolor options that people commonly want; passing them here avoids an
% option clash when xcolor is later requested with them on TeX Live 2022 and
% earlier (xcolor 3.0, TeX Live 2023, accepts late options anyway).
\DeclareOption{dvipsnames}{\PassOptionsToPackage{dvipsnames}{xcolor}}
\DeclareOption{svgnames}{\PassOptionsToPackage{svgnames}{xcolor}}
\DeclareOption{x11names}{\PassOptionsToPackage{x11names}{xcolor}}
\DeclareOption{table}{\PassOptionsToPackage{table}{xcolor}}
% Options of ieeecolor V1.7 that have no meaning here.
\DeclareOption{draftversion}{\PassOptionsToClass{draftcls}{IEEEtran}}
\DeclareOption{shortpaper}{\ClassWarningNoLine{ieeecolor}{Option `shortpaper' is not supported and is ignored}}
\DeclareOption{shade}{\ClassInfo{ieeecolor}{Option `shade' ignored}}
\DeclareOption{myline}{\ClassInfo{ieeecolor}{Option `myline' ignored}}
\DeclareOption{edquery}{\ClassInfo{ieeecolor}{Option `edquery' ignored}}
% Everything else goes to IEEEtran (journal, twoside, 9pt, a4paper, draftcls,
% peerreview, technote, conference, onecolumn, ...).
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{IEEEtran}}
\ProcessOptions\relax

\LoadClass{IEEEtran}

\RequirePackage{xcolor}

% The colour dressing is only defined for the journal-type modes.  Conference,
% Computer Society, ComSoc and Transactions on Magnetics documents keep the
% plain IEEEtran appearance.
\ifCLASSOPTIONconference\@ieeecolor@styledfalse\fi
\ifCLASSOPTIONcompsoc\@ieeecolor@styledfalse\fi
\ifCLASSOPTIONcomsoc\@ieeecolor@styledfalse\fi
\ifCLASSOPTIONtransmag\@ieeecolor@styledfalse\fi

%% ---------------------------------------------------------------------------
%% Colours and the hooks used by journal .sty files
%% ---------------------------------------------------------------------------
\if@ieeecolor@web
  \definecolor{nblue}{rgb}{0,0.263,0.576}
  \definecolor{mblue}{rgb}{0.075,0.541,0.855}
\else
  \definecolor{nblue}{cmyk}{0,0,0,1}
  \definecolor{mblue}{cmyk}{0,0,0,1}
\fi
% Default accent colour for subsection headings, caption labels, the
% "Abstract" and "Index Terms" leaders and the running-head rule.  generic.sty
% sets it to black; journal-specific .sty files set the journal colour.
\definecolor{subsectioncolor}{rgb}{0,0,0}
\definecolor{revisioncolor}{rgb}{0,0,1}
% In print mode every accent colour is black, whatever a .sty file says.
\if@ieeecolor@web\else
  \AtBeginDocument{\colorlet{subsectioncolor}{black}}%
\fi

\newlength{\firstpagerule}
\setlength{\firstpagerule}{\textwidth}
\newlength{\logowidth}
\setlength{\logowidth}{0pt}
\providecommand{\logoname}{logo}
% \providecommand* (not \long) so that \ifx\journalname\@empty is a valid
% emptiness test.
\providecommand*{\journalname}{}
% The rule under the running head (see the noheadrule option).
\newlength{\ieeecolorrulesep}
\setlength{\ieeecolorrulesep}{3pt}
\newlength{\ieeecolorrulewidth}
\setlength{\ieeecolorrulewidth}{1pt}

%% ---------------------------------------------------------------------------
%% Legacy names from ieeecolor V1.7 / IEEEtran V1.6 mapped to IEEEtran V1.8b
%% ---------------------------------------------------------------------------
\providecommand{\PARstart}{\IEEEPARstart}
\providecommand{\pubid}{\IEEEpubid}
\providecommand{\pubidadjcol}{\IEEEpubidadjcol}
\providecommand{\specialpapernotice}{\IEEEspecialpapernotice}
\providecommand{\authorblockN}{\IEEEauthorblockN}
\providecommand{\authorblockA}{\IEEEauthorblockA}
\providecommand{\authorrefmark}{\IEEEauthorrefmark}
\providecommand{\setlabelwidth}{\IEEEsetlabelwidth}
\providecommand{\usemathlabelsep}{\IEEEusemathlabelsep}
\providecommand{\QED}{\IEEEQED}
\providecommand{\QEDclosed}{\IEEEQEDclosed}
\providecommand{\QEDopen}{\IEEEQEDopen}
\@ifundefined{keywords}{\newenvironment{keywords}{\IEEEkeywords}{\endIEEEkeywords}}{}
\@ifundefined{biography}{\newenvironment{biography}[2][]{\IEEEbiography[{#1}]{#2}}{\endIEEEbiography}}{}
\@ifundefined{biographynophoto}{\newenvironment{biographynophoto}[1]{\IEEEbiographynophoto{#1}}{\endIEEEbiographynophoto}}{}
% \proof and \QED clash with amsthm, so the old names are only provided at
% \begin{document} if nothing else has taken them.
\AtBeginDocument{%
  \@ifundefined{proof}{%
    \@ifundefined{endproof}{\let\proof\IEEEproof\let\endproof\endIEEEproof}{}}{}}
% Old switch for centring short figure captions.  As in V1.7 and IEEEtran:
% left-justified in journal mode, centred in conference mode.
\newif\ifcenterfigcaptions
\ifCLASSOPTIONconference\centerfigcaptionstrue\else\centerfigcaptionsfalse\fi

%% ---------------------------------------------------------------------------
%% Revision highlighting
%% ---------------------------------------------------------------------------
\newcommand*{\revisionsoff}{\@ieeecolor@revisionsfalse}
\if@ieeecolor@revisions
  \newcommand*{\revisionson}{\@ieeecolor@revisionstrue}
\else
  % norevisions is a hard override: \revisionson left in the document from an
  % earlier round does nothing.
  \newcommand*{\revisionson}{\ClassInfo{ieeecolor}{\string\revisionson\space ignored (norevisions)}}
\fi
% \if@ieeecolor@inrevision is set (locally) inside a revision.  Headings and
% caption labels then keep the revision colour instead of their own.
\newif\if@ieeecolor@inrevision
% Inside a revision, \normalcolor (used by amsmath and IEEEtran for equation
% numbers, by LaTeX for float boxes and by some packages for labels) is made to
% return to the revision colour rather than to black, so that a revised
% equation or float is coloured as a whole.  The change is local to the
% revision group; the output routine (which runs inside that group when a
% page breaks in a revision) restores the document default first, so running
% heads, footers and the footnote rule are never coloured.
\def\@ieeecolor@revcolor{%
  \if@ieeecolor@revisions
    \color{revisioncolor}%
    \let\default@color\current@color
    \ifdefined\XC@current@color\let\XC@default@color\XC@current@color\fi
    \@ieeecolor@inrevisiontrue
    \let\@ieeecolor@fnhook\@ieeecolor@revcolor
  \fi}
\AtBeginDocument{\let\@ieeecolor@docdefaultcolor\default@color
  \ifdefined\XC@default@color\let\@ieeecolor@docXCdefaultcolor\XC@default@color\fi}
\def\@ieeecolor@resetdefaultcolor{%
  \ifdefined\@ieeecolor@docdefaultcolor\let\default@color\@ieeecolor@docdefaultcolor\fi
  \ifdefined\@ieeecolor@docXCdefaultcolor\let\XC@default@color\@ieeecolor@docXCdefaultcolor\fi
  \@ieeecolor@inrevisionfalse}
% The output routine runs in its own group, so these \lets are local to it.
% (\the\output comes with its outer braces; \@firstofone strips them so that
% no extra group level is added.)
\toks@\expandafter\expandafter\expandafter{\expandafter\@firstofone\the\output}
\output=\expandafter{\expandafter\@ieeecolor@resetdefaultcolor\the\toks@}
% Accent colour for headings and caption labels: off inside a revision.
\def\@ieeecolor@accent#1{\if@ieeecolor@inrevision\else\color{#1}\fi}
% Footnote text is typeset in an insert box that is shipped out at the foot of
% the page, outside the revision's colour group, so the colour is re-issued
% inside the footnote when the footnote was written inside a revision.  The
% hook is set locally by \@ieeecolor@revcolor and so is inactive elsewhere.
\let\@ieeecolor@fnhook\relax
\let\@ieeecolor@orig@makefntext\@makefntext
\long\def\@makefntext#1{\@ieeecolor@orig@makefntext{\@ieeecolor@fnhook#1}}
% \revised{...}: \long so that the argument may contain \par; robust so that it
% survives captions, section titles and other moving arguments.  The group is
% \begingroup/\endgroup rather than braces so that in math mode no extra Ord
% atom is created (spacing around relations and operators is unchanged).
% \protected (e-TeX) rather than \DeclareRobustCommand so that hyperref's
% \pdfstringdefDisableCommands can neutralise it by name.
\@ifdefinable{\revised}{\protected\long\def\revised#1{\begingroup\@ieeecolor@revcolor#1\endgroup}}
\newenvironment{revision}{\@ieeecolor@revcolor}{}
% hyperref bookmarks: strip the colour.
\AtBeginDocument{%
  \@ifpackageloaded{hyperref}{%
    \pdfstringdefDisableCommands{\let\revised\@firstofone}}{}}

%% ---------------------------------------------------------------------------
%% Running heads: sans-serif, with a rule in subsectioncolor
%% ---------------------------------------------------------------------------
% \journalname as the default left mark (first page and even pages), unless
% the document has already called \markboth itself.
\let\@ieeecolor@markboth\markboth
\def\markboth{\global\let\@ieeecolor@usermark\@empty\@ieeecolor@markboth}
\AtBeginDocument{%
  \ifx\journalname\@empty\else
    \ifx\@ieeecolor@usermark\@undefined
      \expandafter\@ieeecolor@markboth\expandafter{\journalname}{}%
    \fi
  \fi}
\if@ieeecolor@styled
  \def\@IEEEheaderstyle{\normalfont\sffamily\scriptsize}
  \def\@IEEEfooterstyle{\normalfont\sffamily\scriptsize}
\fi
\if@ieeecolor@styled\if@ieeecolor@rule
  % Grow the head box by the rule and its separation, and move the top margin
  % up by the same amount so that the text block does not move.
  \addtolength{\headheight}{4pt}
  \addtolength{\topmargin}{-4pt}
  % LaTeX's output routine sets \@oddhead/\@evenhead inside
  % \hb@xt@\textwidth{...} inside \vbox to\headheight{\vfil ...}; a \vbox of
  % exactly \headheight fits without overfull or underfull boxes.
  \long\def\@ieeecolor@makehead#1{%
    \vbox to\headheight{\vss
      \hb@xt@\textwidth{#1}%
      \kern\ieeecolorrulesep
      {\color{subsectioncolor}\hrule height\ieeecolorrulewidth depth\z@ width\textwidth}}}
  % \@ieeecolor@wraphead\@oddhead redefines \@oddhead as
  % \@ieeecolor@makehead{<old body>} (unless it is empty).
  \def\@ieeecolor@wraphead#1{%
    \ifx#1\@empty\else
      \expandafter\def\expandafter#1\expandafter{%
        \expandafter\@ieeecolor@makehead\expandafter{#1}}%
    \fi}
  \let\@ieeecolor@ps@headings\ps@headings
  \def\ps@headings{\@ieeecolor@ps@headings
    \@ieeecolor@wraphead\@oddhead\@ieeecolor@wraphead\@evenhead}
  \let\@ieeecolor@ps@titlepage\ps@IEEEtitlepagestyle
  \def\ps@IEEEtitlepagestyle{\@ieeecolor@ps@titlepage
    \@ieeecolor@wraphead\@oddhead\@ieeecolor@wraphead\@evenhead}
  % IEEEtran has already executed \pagestyle{headings}; do it again so that
  % the wrapped version is in force.
  \pagestyle{headings}
\fi\fi

%% ---------------------------------------------------------------------------
%% Title block
%% ---------------------------------------------------------------------------
\if@ieeecolor@styled
% IEEEtran V1.8b's journal/technote/peerreview \@maketitle with the title in
% nblue sans-serif and the author line in sans-serif.
\def\@maketitle{\newpage
\bgroup\par\vskip\IEEEtitletopspace\vskip\IEEEtitletopspaceextra\centering
\ifCLASSOPTIONtechnote
   {\color{nblue}\sffamily\bfseries\large\@title\par}\vskip 1.3em
   {\lineskip .5em\sffamily\@author\@IEEEspecialpapernotice\par}\relax
\else
   \vskip0.2em{\color{nblue}\sffamily\Huge\@title\par}\relax
   \vskip1.0em\par
   \ifCLASSOPTIONpeerreviewca
      {\sffamily\@IEEEspecialpapernotice\mbox{}\vskip\@IEEEauthorblockconfadjspace
       \mbox{}\hfill\begin{@IEEEauthorhalign}\@author\end{@IEEEauthorhalign}\hfill\mbox{}\par}\relax
   \else
      {\lineskip.5em\sffamily\sublargesize\@author\@IEEEspecialpapernotice\par}\relax
   \fi
\fi\par\addvspace{0.5\baselineskip}\egroup}
% peerreview: the title repeated after the cover page.
\def\@IEEEpeerreviewmaketitle{\bgroup\par\addvspace{0.5\baselineskip}\centering
\normalfont\normalsize\vskip0.2em{\color{nblue}\sffamily\Huge\@title\par}\vskip1.0em\par
\par\addvspace{0.5\baselineskip}\egroup}
\def\IEEEmembership#1{{\sublargesize\normalfont\sffamily\textit{#1}}}
% First-page footnotes (\thanks) in sans-serif.  \long, as in IEEEtran V1.8b.
\long\def\thanks#1{\footnotemark
    \protected@xdef\@thanks{\@thanks
        \protect\footnotetext[\the\c@footnote]{\normalfont\sffamily\ignorespaces#1}}}
\fi

%% ---------------------------------------------------------------------------
%% Abstract and index terms
%% ---------------------------------------------------------------------------
\if@ieeecolor@styled
\def\abstract{\normalfont\sffamily
    \if@twocolumn
      \@IEEEabskeysecsize\bfseries{\@ieeecolor@accent{subsectioncolor}\textit{\abstractname}}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\vspace{-1.78ex}\@IEEEabskeysecsize
      \textbf{\@ieeecolor@accent{subsectioncolor}\abstractname}\par\addvspace{0.5\baselineskip}\egroup
      \quotation\@IEEEabskeysecsize\sffamily
    \fi\@IEEEgobbleleadPARNLSP}
\def\IEEEkeywords{\normalfont\sffamily
    \if@twocolumn
      \@IEEEabskeysecsize\bfseries{\@ieeecolor@accent{subsectioncolor}\textit{\IEEEkeywordsname}}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\@IEEEabskeysecsize
      \textbf{\@ieeecolor@accent{subsectioncolor}\IEEEkeywordsname}\par\addvspace{0.5\baselineskip}\egroup
      \quotation\@IEEEabskeysecsize\sffamily
    \fi\@IEEEgobbleleadPARNLSP}
\fi

%% ---------------------------------------------------------------------------
%% Section headings
%% ---------------------------------------------------------------------------
\if@ieeecolor@styled
% Spacing as in IEEEtran journal mode; fonts and colours as in V1.7 (section:
% sans small caps in nblue; subsection: sans italic ragged right in
% subsectioncolor; subsubsection: run-in, \small sans italic in nblue;
% paragraph: run-in, \small italic).  V1.7 hard-coded 9pt for the run-in
% headings; \small is 9pt in a 10pt document and scales with the size option.
\def\section{\@startsection{section}{1}{\z@}{3.0ex plus 1.5ex minus 1.5ex}%
{0.7ex plus 1ex minus 0ex}{\normalfont\normalsize\sffamily\scshape\centering\@ieeecolor@accent{nblue}}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{3.5ex plus 1.5ex minus 1.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\sffamily\itshape\raggedright\@ieeecolor@accent{subsectioncolor}}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\small\sffamily\itshape\@ieeecolor@accent{nblue}}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\small\itshape}}%
\fi

%% ---------------------------------------------------------------------------
%% Captions
%% ---------------------------------------------------------------------------
\if@ieeecolor@styled
% The colour is confined to a brace group inside the label, so the colour
% stack is balanced whatever box the label ends up in.
\def\fnum@figure{{\@ieeecolor@accent{subsectioncolor}\figurename\nobreakspace\thefigure}}
\def\fnum@table{{\@ieeecolor@accent{subsectioncolor}\tablename\nobreakspace\thetable}}
\def\@ieeecolor@captionfont{\normalfont\footnotesize\sffamily}
% IEEEtran's captionsoff option replaces \@makecaption; leave that alone.
\ifCLASSOPTIONcaptionsoff\else
\long\def\@makecaption#1#2{%
\ifx\@captype\@IEEEtablestring
% table: label centred on its own line, caption text in small caps below
\footnotesize\bgroup\par\centering\@IEEEtabletopskipstrut
{\@ieeecolor@captionfont #1}\\{\@ieeecolor@captionfont\scshape #2}\par\addvspace{0.5\baselineskip}\egroup
\@IEEEtablecaptionsepspace
\else
% figure: "Fig. 1.  text"; wrapped if longer than a line, otherwise centred
% (\centerfigcaptionsfalse gives IEEEtran's left alignment)
\@IEEEfigurecaptionsepspace
\setbox\@tempboxa\hbox{\@ieeecolor@captionfont {#1.}\nobreakspace\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize
\setbox\@tempboxa\hbox{\@ieeecolor@captionfont {#1.}\nobreakspace\nobreakspace}%
\parbox[t]{\hsize}{\@ieeecolor@captionfont\noindent\unhbox\@tempboxa#2}%
\else
\ifcenterfigcaptions
\hbox to\hsize{\@ieeecolor@captionfont\hfil\box\@tempboxa\hfil}%
\else
\hbox to\hsize{\@ieeecolor@captionfont\box\@tempboxa\hfil}%
\fi
\fi\fi}
\fi
% If the caption package (caption, subcaption, subfig without caption=false)
% takes over caption formatting, give it the same style.  The settings are
% applied right after the package loads, so a \captionsetup in the document
% preamble still overrides them.
\def\@ieeecolor@captionsetup{%
  \DeclareCaptionFont{ieeecolorlabel}{\@ieeecolor@accent{subsectioncolor}}%
  \captionsetup{font={footnotesize,sf},labelfont={ieeecolorlabel},labelsep=period,%
    justification=justified,singlelinecheck=true}%
  \captionsetup[table]{labelsep=newline,textfont=sc,justification=centering,position=above}}
\ifdefined\AddToHook
  \AddToHook{package/caption/after}{\@ieeecolor@captionsetup}
\else
  \AtBeginDocument{\@ifpackageloaded{caption}{\@ieeecolor@captionsetup}{}}
\fi
\fi

%% ---------------------------------------------------------------------------
%% Biographies: sans-serif, name in nblue
%% ---------------------------------------------------------------------------
\if@ieeecolor@styled
\renewenvironment{IEEEbiography}[2][]{\normalfont\sffamily\footnotesize%
\unitlength 1in\parskip=0pt\par\parindent 1em\interlinepenalty500%
\@IEEEtrantmpdimenA=\@IEEEBIOhangdepth%
\advance\@IEEEtrantmpdimenA by \@IEEEBIOskipN%
\advance\@IEEEtrantmpdimenA by 1\baselineskip%
\@IEEEtranneedspace{\@IEEEtrantmpdimenA}{\relax}%
\vskip \@IEEEBIOskipN plus 1fil minus 0\baselineskip%
\def\@IEEEtempbiographybox{{\setlength{\fboxsep}{0pt}\framebox{%
\begin{minipage}[b][\@IEEEBIOphotodepth][c]{\@IEEEBIOphotowidth}\centering PLACE\\ PHOTO\\ HERE \end{minipage}}}}%
\@ifmtarg{#1}{\relax}{\def\@IEEEtempbiographybox{\mbox{\begin{minipage}[b][\@IEEEBIOphotodepth][c]{\@IEEEBIOphotowidth}%
\centering%
#1%
\end{minipage}}}}%
\if@IEEEbiographyTOCentrynotmade%
\setcounter{IEEEbiography}{-1}%
\refstepcounter{IEEEbiography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@IEEEbiographyTOCentrynotmadefalse%
\fi%
\refstepcounter{IEEEbiography}%
\addcontentsline{toc}{subsection}{#2}%
\let\@IEEEBIOORGparCMD=\par%
\edef\par{\hfil\break\indent}%
\settoheight{\@IEEEtrantmpdimenA}{\@IEEEtempbiographybox}%
\@IEEEtrantmpdimenB=\@IEEEBIOhangdepth%
\@IEEEtrantmpcountA=\@IEEEtrantmpdimenB%
\divide\@IEEEtrantmpcountA by \baselineskip%
\advance\@IEEEtrantmpcountA by 1%
\hangindent\@IEEEBIOhangwidth%
\hangafter-\@IEEEtrantmpcountA%
\settoheight{\@IEEEtrantmpdimenB}{\mbox{T}}%
\noindent\makebox[0pt][l]{\hspace{-\@IEEEBIOhangwidth}\raisebox{\@IEEEtrantmpdimenB}[0pt][0pt]{%
\raisebox{-\@IEEEBIOphotodepth}[0pt][0pt]{\@IEEEtempbiographybox}}}%
\noindent\textbf{{\@ieeecolor@accent{nblue}#2}\ }\@IEEEgobbleleadPARNLSP}{\relax\let\par=\@IEEEBIOORGparCMD\par%
\ifnum \prevgraf <\@IEEEtrantmpcountA\relax%
    \advance\@IEEEtrantmpcountA by -\prevgraf%
    \advance\@IEEEtrantmpcountA by -1\relax%
    \@IEEEtrantmpdimenA=\baselineskip%
    \multiply\@IEEEtrantmpdimenA by \@IEEEtrantmpcountA%
    \noindent\rule{0pt}{\@IEEEtrantmpdimenA}%
\fi%
\par\normalfont}
%
\renewenvironment{IEEEbiographynophoto}[1]{%
\if@IEEEbiographyTOCentrynotmade%
\setcounter{IEEEbiography}{-1}%
\refstepcounter{IEEEbiography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@IEEEbiographyTOCentrynotmadefalse%
\fi%
\refstepcounter{IEEEbiography}%
\addcontentsline{toc}{subsection}{#1}%
\normalfont\sffamily\footnotesize\interlinepenalty500%
\vskip 4\baselineskip plus 1fil minus 0\baselineskip%
\parskip=0pt\par%
\noindent\textbf{{\@ieeecolor@accent{nblue}#1}\ }\@IEEEgobbleleadPARNLSP}{\relax\par\normalfont}
% IEEEtran saved the original environments for its conference-mode lockout
% machinery before we redefined them; refresh the saved copies.
\let\@IEEESAVECMDIEEEbiography\IEEEbiography
\let\@IEEESAVECMDendIEEEbiography\endIEEEbiography
\let\@IEEESAVECMDIEEEbiographynophoto\IEEEbiographynophoto
\let\@IEEESAVECMDendIEEEbiographynophoto\endIEEEbiographynophoto
\fi

\endinput
