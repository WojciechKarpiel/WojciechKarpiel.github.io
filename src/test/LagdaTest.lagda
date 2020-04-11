% to w założeniu ma się skompilować Heveą, zwykły pdftex nie przejdzie
\documentclass[utf8]{article}
\usepackage{polski}
\usepackage[utf8]{inputenc}
\usepackage{hyperref}
\renewcommand{\contentsname}{Spis treści}

\loadcssfile{Agda.css} % UWAGA!
% agda --html --html-dir html2 --html-highlight=code LagdaTest.lagda

\begin{document}
\title{Test literackiej Agdy}
\date{5 IV 2020r}
\author{Wojciech Karpiel}

\maketitle
\href{../../index.html}{Powrót na stronę główną}
\tableofcontents

\section{Wstęp}\label{sec:wstep}
Cześć!

\begin{rawhtml}
\begin{code}
module LagdaTest where

data 𝔹 : Set where
  true : 𝔹
  false : 𝔹

data ⊤ : Set where
  tt : ⊤

data ⊥ : Set where

data _≡_  {A : Set} (x : A) : A → Set where
  refl : x ≡ x
\end{code}
\end{rawhtml}

\subsection{A tu coś więcej}
Ziomy

\begin{rawhtml}
\begin{code}
¬ : Set → Set
¬ A = A → ⊥

goal : ¬ (true ≡ false)
goal t=f = transport xd t=f tt
  where
    transport : {A : Set} (B : A → Set) {a b : A} → a ≡ b → B a → B b
    transport B refl x = x
    xd : 𝔹 → Set
    xd true = ⊤
    xd false = ⊥
\end{code}
\end{rawhtml}
No i to by było na tyle

\section{Zakończenie}
Papa!
\[
  \Pi_{(x : A)}B(x) \rightarrow \top  
\]

\end{document}
