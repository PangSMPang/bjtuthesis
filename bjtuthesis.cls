%   LaTeX template for Beijing Jiaotong University theses
%
%   -*- coding: utf-8 -*-
%
%   File Name : bjtuthesis.cls
%
%   Usage : Used by setting it as the document class:\documentclass{bjtuthesis}
%
%   Creation Date : 2025-05-13
%
%   Author : PangSMPang (pangsmpang@gmail.com)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjtuthesis}[Beijing Jiaotong University Thesis and Design Template, PangSMPang@gmail.com]

% 处理文档选项
\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=bjtuthesis,
    prefix=bjtuthesis@
}

\DeclareBoolOption[true]{TwoSide}  
\DeclareBoolOption[false]{BlindReview}
\DeclareBoolOption[true]{NumberByChapter} 

\ProcessKeyvalOptions*

\ifbjtuthesis@TwoSide
    \PassOptionsToClass{twoside,openright}{ctexrep}
\fi

\LoadClass[a4paper,zihao=-4]{ctexrep}

\ifbjtuthesis@NumberByChapter
    \renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
    \renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
    \renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\else
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\thetable}{\arabic{table}}
\fi

% 处理封面
\newcommand{\department}[1]{\gdef\@department{\bjtusongti\zihao{3}#1}}
\renewcommand{\title}[1]{\renewcommand{\title}{#1}}
\newcommand{\englishtitle}[1]{\renewcommand{\englishtitle}{#1}}
\renewcommand{\author}[1]{\renewcommand{\author}{\bjtusongti\zihao{3}#1}}
\newcommand{\major}[1]{\renewcommand{\major}{\bjtusongti\zihao{3}#1}}
\newcommand{\studentNumber}[1]{\renewcommand{\studentNumber}{\zihao{3}#1}}
\newcommand{\advisor}[1]{\renewcommand{\advisor}{\bjtusongti\zihao{3}#1}}
\newcommand{\printdepartment}{\@department}
\newcommand{\makecover}{
    \vspace*{0.13cm}
    \begin{center}
    \includegraphics[width=108mm]{logo/logo.png}

    {\vspace{0.85cm}\zihao{2}\bjtusongti \textbf{本科毕业设计（论文）}}
    \vspace{2.25cm}

    \begin{spacing}{2}
        {\zihao{-2}\bjtuheiti\textbf{\title}}
    \end{spacing}
    \vspace{1em}
    \begin{spacing}{2}
        {\zihao{-2}\bjtusongti\textbf{\englishtitle}}
    \end{spacing}

    \newlength{\capwidth}
    \setlength{\capwidth}{\widthof{\zihao{3}学生姓名：}}

    \begin{spacing}{1.8}
    \setlength{\tabcolsep}{.2mm}
    \vspace{-0.2cm}\hspace{-0.75cm}

    \ifbjtuthesis@BlindReview
        \begin{tabular}{lc}
            \rule{\capwidth}{0pt} & \rule{5.7cm}{0pt} \\
            \makebox[\capwidth][s]{\zihao{3}学院：} \\ 
            \makebox[\capwidth][s]{\zihao{3}专业：} \\ 
            \makebox[\capwidth][s]{\zihao{3}学生姓名：} \\ 
            \makebox[\capwidth][s]{\zihao{3}学号：} \\ 
            \makebox[\capwidth][s]{\zihao{3}指导教师：}
        \end{tabular}
    \else
        \begin{tabular}{lc}
            \rule{\capwidth}{0pt} & \rule{5.7cm}{0pt} \\
            \makebox[\capwidth][s]{\zihao{3}学院：} & \printdepartment \\ 
            \makebox[\capwidth][s]{\zihao{3}专业：} & \major \\ 
            \makebox[\capwidth][s]{\zihao{3}学生姓名：} & \author \\ 
            \makebox[\capwidth][s]{\zihao{3}学号：} & \studentNumber \\ 
            \makebox[\capwidth][s]{\zihao{3}指导教师：} & \advisor
        \end{tabular}
    \fi


    \end{spacing}

    %此处的长度以“计算机科学与技术学院”（10个字）所占横线长度为准
    \begin{tikzpicture}[remember picture,overlay]
        \draw[color=black,thick] (-1.4,4.85)--(4.3,4.85);
        \draw[color=black,thick] (-1.4,3.75)--(4.3,3.75);
        \draw[color=black,thick] (-1.4,2.65)--(4.3,2.65);
        \draw[color=black,thick] (-1.4,1.55)--(4.3,1.55);
        \draw[color=black,thick] (-1.4,0.45)--(4.3,0.45);
    \end{tikzpicture}

    \vspace*{0.8cm}

    \zihao{-3}\bjtusongti \textbf{北京交通大学}\vspace*{1ex}

    \yearmonth
    \end{center}

    \newpage
}

%宏包
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{xifthen}
\RequirePackage{caption}
\RequirePackage{mathptmx}
\RequirePackage{changepage}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{tabularx}
\RequirePackage{subcaption}
\RequirePackage{pgfplots}
\RequirePackage{tikz}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage{titletoc}
\RequirePackage{fontspec}
\RequirePackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black,urlcolor=black]{hyperref} %在这里调整超链接的颜色
\RequirePackage{calc}
\RequirePackage{datetime}
\RequirePackage{etoolbox}
\RequirePackage{booktabs}
\RequirePackage{floatrow}
\RequirePackage{appendix}
\RequirePackage{enumitem}
\RequirePackage[backend=biber,style=gb7714-2015,gbalign=left,gbbiblabel=bracket,natbib=true]{biblatex} 
\RequirePackage{underscore}
\RequirePackage{listings}
\RequirePackage{multirow}
\RequirePackage{float}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{bm}
\RequirePackage{textcomp}
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage[normalem]{ulem}
\RequirePackage{ragged2e}
\RequirePackage{blindtext}
\RequirePackage{adjustbox}
\RequirePackage{chngcntr}          
\RequirePackage{tabularray}
\RequirePackage{afterpage}
\RequirePackage{makecell}
\RequirePackage{multicol}
\RequirePackage{xeCJKfntef}
%========================================================================%
% 北京交通大学计算机学院明确给出的格式
%========================================================================%
\setCJKfamilyfont{hwzs}{stzhongs.ttf}[Path=fonts/]
\newcommand{\hwzs}{\CJKfamily{hwzs}}
\setCJKfamilyfont{bjtusongti}{simsun.ttc}[Path=fonts/, AutoFakeBold=2.5]
\newcommand*{\bjtusongti}{\CJKfamily{bjtusongti}}
\newfontfamily{\bjtueheiti}{simhei.ttf}[Path=fonts/]
\setCJKfamilyfont{bjtuhei}{simhei.ttf}[Path=fonts/, AutoFakeBold=2]
\newcommand*{\bjtuheiti}{\CJKfamily{bjtuhei}}
\newcommand*{\yearmonth}{\bjtusongti \zihao{-3} \the \year 年 \the \month 月}


\geometry{left=2.5cm,right=2.5cm,top=3.0cm,bottom=3.0cm,headheight=1.5cm,footskip=1.75cm}
\setmainfont{Times New Roman}
\linespread{1.4}\selectfont
\setlength{\baselineskip}{20pt}
\renewcommand{\arraystretch}{1.2}
\renewcommand{\captionfont}{\zihao{5}}

\DeclareCaptionFont{bjtusongti}{\zihao{5}\bjtusongti}
\captionsetup{font=bjtusongti}


\DeclareFloatFont{bjtusongti}{\zihao{5}\bjtusongti}
\DeclareFloatVCode{figureafterfloat}{\vspace{-16pt}}
\DeclareFloatVCode{tableafterfloat}{\vspace{-4pt}}
\floatsetup[table]{font=bjtusongti,capposition=top,captionskip=2pt,postcode=tableafterfloat}
\floatsetup[figure]{font=bjtusongti,capposition=bottom,captionskip=4pt,postcode=figureafterfloat}
\ctexset{
    chapter = {
        name={,},
        aftername=\hspace{1em},
        number={\arabic {chapter}},
        beforeskip={-4pt},
        afterskip={18pt},
        nameformat={},
        titleformat={},
        format=\heiti\zihao{3},
    },
    section = {
        format=\raggedright\heiti\zihao{-3},
        aftername=\hspace{1em},
        beforeskip={24pt},
        afterskip={18pt},
    },
    subsection = {
        format=\raggedright\heiti\zihao{4},
        aftername=\hspace{1em},
        beforeskip={24pt},
        afterskip={18pt},
    },
}

\setlength{\itemsep}{100pt}
\setlength{\abovedisplayskip}{-5cm}
\setlength{\belowdisplayskip}{-5cm}

\let\oldequation=\equation
\let\endoldequation=\endequation
\renewenvironment{equation}{\vspace{-0.7cm}\begin{oldequation}}{\vspace{-0.3cm}\end{oldequation}\ignorespacesafterend}
\newcommand{\figcaption}[1]{\caption{图}{#1}}
%目录
\makeatletter
\renewcommand\tableofcontents{%
    \chapter*{\makebox[\linewidth]{\zihao{-2} 目\hspace{2em}录}
        \@mkboth{\MakeUppercase \contentsname}{}}% ADDED
	\vspace{-0.5cm}
    \@starttoc{toc}%
    } 
\makeatother



\makeatletter
\renewcommand\contentspage[1][\MakeUppercase{\bjtueheiti \thecontentspage}]{%
  \hb@xt@\@pnumwidth{\hfil#1}%
  \hspace*{-\@pnumwidth}}
\makeatother


\titlecontents{part}[0em]{\vspace{0.2ex}}{\bjtueheiti \zihao{-4}\contentslabel{0em}}{\bjtueheiti \bjtuheiti\zihao{-4}}{\titlerule*[0.5pc]{.}\contentspage}[\vspace{0.2ex}]
\titlecontents{chapter}[1em]{\vspace{0.3ex}}{\bjtuheiti \bjtueheiti \zihao{-4}\contentslabel{1em}}{\bjtuheiti \bjtueheiti \zihao{-4}}{\titlerule*[0.5pc]{.}\contentspage}[\vspace{0.15ex}]
\titlecontents{section}[3em]{\hspace{0em}}{\contentslabel{2em}}{\bjtusongti \zihao{-4}}{\titlerule*[0.5pc]{.}\contentspage}[\vspace{0ex}]
\titlecontents{subsection}[5em]{\hspace{0em}}{\contentslabel{3em}}{\bjtusongti \zihao{-4}}{\titlerule*[0.5pc]{.}\contentspage}[\vspace{0ex}]

% 页眉
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\fancypagestyle{bjtufancy}{
    \fancyhead[CE,CO]{}
    \fancyhead[L]{\zihao{4}\hwzs \hspace*{0.8em}北京交通大学毕业设计（论文）}
    \fancyhead[R]{\zihao{4}\hwzs \leftmark\hspace*{0.8em}}
    \fancyfoot[CO,CE]{\zihao{5}\thepage}
    \makeatletter
    \renewcommand{\headrule}{\hrule height 2.5pt \vspace{1pt}\hrule height 1pt}
}

\fancypagestyle{fancynofoot}{
\fancyhead[CE,CO]{}
    \fancyhead[L]{\zihao{4}\hwzs \hspace*{0.8em}北京交通大学毕业设计（论文）}
    \fancyhead[R]{\zihao{4}\hwzs \leftmark\hspace*{0.8em}}
    \fancyfoot{}
    \makeatletter
    \renewcommand{\headrule}{\hrule height 2.5pt \vspace{1pt}\hrule height 1pt}
}

\fancypagestyle{bjtufancymain}{
	\fancyhead[R]{\zihao{4}\hwzs 正文\hspace*{0.8em}}
}



\fancypagestyle{plain}{
\fancyhead{}
\fancyhead[CE]{\zihao{5}\hspace{2em}北京交通大学毕业设计（论文）}
\fancyhead[CO]{\zihao{5}\hspace{2em}\leftmark}
\fancyfoot[CO,CE]{\zihao{-5}\thepage}
\renewcommand{\headrulewidth}{0.4pt}
}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
%========================================================================%
% 自定义内容
%========================================================================%
\newcommand{\authorsign}[1]{\renewcommand{\authorsign}{#1}}
\newcommand{\advisorsign}[1]{\renewcommand{\advisorsign}{#1}}
\newcommand{\authorsigndate}[1]{\renewcommand{\authorsigndate}{#1}}
\newcommand{\advisorsigndate}[1]{\renewcommand{\advisorsigndate}{#1}}

%参考文献
\AtBeginBibliography{\zihao{5}}

\defbibheading{bjtuheading}[\zihao{-2}参考文献]{%
  \centering\chapter*{#1}
  \markboth{参考文献}{}}
 
   \renewenvironment{thebibliography}[1]
{\zihao{5}
	{\centering\chapter*{\heiti \bibname}}
	\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
	\addcontentsline{toc}{chapter}{\heiti 参考文献}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\setlength{\parsep}{1mm}
		\setlength{\labelsep}{0.5em}
		\setlength{\itemsep}{0.05pc}
		\setlength{\listparindent}{0in}
		\setlength{\itemindent}{0in}
		\setlength{\rightmargin}{0in}
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist}
	 


%========================================================================%
% 前置部分命令
%========================================================================%
% 设置有序和无序列表行距和留白
\setlist[itemize]{noitemsep, topsep=0pt}
\setlist[enumerate]{noitemsep, topsep=0pt}

% 设置全局样式
\makeatletter
\let\ps@plain\ps@fancy
\patchcmd{\chapter}{plain}{bjtufancy}{}{}
\makeatother

\newenvironment{thecenter}
	{\begin{center}\vspace{24pt}\zihao{-2}\heiti}
	{\vspace{18pt}\end{center}}


%中文摘要
\newenvironment{chineseabstract}{
	\thispagestyle{bjtufancy}
	\chapter*{\makebox[\linewidth]{\zihao{-2}中文摘要}}
	\markboth{中文摘要}{}
	\addcontentsline{toc}{part}{\color{black}中文摘要}
}{}

%英文摘要
\newenvironment{englishabstract}{
	\thispagestyle{bjtufancy}
	\chapter*{\makebox[\linewidth]{\zihao{-2}ABSTRACT}}
	\markboth{英文摘要}{}
	\addcontentsline{toc}{part}{\color{black}ABSTRACT}
}{}

%致谢
\newenvironment{acknowledgement}{
	\thispagestyle{bjtufancy}
	\chapter*{\makebox[\linewidth]{\zihao{-2}致\hspace{2em}谢}}
	\markboth{致谢}{}
	\addcontentsline{toc}{part}{\color{black}致\hspace{2em}谢}
}{}


%附录
\fancypagestyle{bjtufancyappendix}{
	\fancyhead[R]{\zihao{4}\hwzs 附录\hspace*{0.8em}}
}

\newcommand{\appendixfront}{        
        \chapter*{\makebox[\linewidth]{\zihao{-2}附\hspace{2em}录}}
        \markboth{附录}{}
        \addcontentsline{toc}{part}{\color{black}附\hspace{2em}录}
        \bjtusongti\zihao{5}
}

\makeatletter
\newcommand{\chapternopagebreak}[1]{
        \begingroup
            \let\clearpage\relax
            \let\cleardoublepage\relax
            \vspace{1.5\baselineskip}
            \chapter{#1}
        \endgroup
}
\makeatother

\pretocmd{\appendix}{
        \counterwithin{table}{chapter}
        \counterwithin{figure}{chapter}
        \counterwithin{equation}{chapter}
        \renewcommand{\thetable}{\Alph{chapter}-\arabic{table}}
        \renewcommand{\thefigure}{\Alph{chapter}-\arabic{figure}}
        \renewcommand{\theequation}{\Alph{chapter}-\arabic{equation}}
        \ctexset{chapter={format=\bjtuheiti\zihao{3}}}
        \bjtusongti\zihao{5}
        \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
% 搜索可能的图片文件夹
\graphicspath{{figures/}{pics/}{pictures/}}
% 参考文献
\addbibresource[]{reference/ref.bib}