---
title: "Raffinage PageRank"
author: "Julien Blanchon (1SN Groupe B)"
header-includes:
   - \usepackage[ruled,vlined,linesnumbered]{algorithm2e}
output:
    pdf_document
---

## Retour KJR
- Si vous pouviez mettre des virgules dans la liste des flots de donnees, ce serait plus facile à lire. Aussi pour les flots, le fait de les écrire au bout de chaque étape permet de mieux voir comment des données circulent d'une étape à une autre.
- Quand vous déterminez une exception, vous pourriez simplement commencer le calcul avec le paramètre par défaut (alpha ou max_iter), et indiquer avant le lancement les paramètres réellement pris en compte.
- Il manque le raffinage R3 des calculs de G, du produit matriciel. 

# Raffinages:

## Consigne :

1. L'executable `./pagerank` doit comporter 4 argument dont 3 optionnels:
  - `fichier.net` est le chemin vers le fichier décrivant le réseau.
    Ex:
    ```
        6
        0 1
        0 2
        2 0
        2 1
        2 4
        3 4
        3 5
        4 3
        4 5
        5 3
        ```
  - `-P` optionnel: Permet d’utiliser le l’implantation `Google_Naive`. Par défaut (sans `-P`), on lance l’implantation `Google_Creuse`.
  - `-I <int>` optionnel: Permet de spécifier le nombre maximal d’itérations. Par défaut 150.
  - `-A <float>` optionnel: Permet de spécifier le valeur d'`\alpha`. Par défaut 0.85.
  - On adopte un programmation défensive pour l'appel de `./pagerank`.
  - `./pagerank -P -I 150 -A 0.90 exemple_sujet.net`

2. Les résultat du programme seront écris dans des fichier d'extensions `.p` (pour le fichier pagerank) et `.ord` (pour le fichier poid) avec le même préfixe que le fichier `.net`.
  - `*.p` Liste le poids des nœuds par ordre décroissant.
  - `*.ord` Liste l’identifiant des nœuds par poids décroissant (PageRank croissant).

## Raffinage 0 : Programme Principale

  \SetAlgorithmName{Raffinage}{raffinage}{list of Raffinage}
  \setcounter{algocf}{-1}
  \begin{algorithm}[H]
  \DontPrintSemicolon
  \SetAlgoLined
  \SetKwInOut{Input}{Input}
  \SetKwInOut{Output}{Output}
  \Input{stdin("-P -I 150 -A 0.90 exemple\_sujet.net")}
  \Output{\underline{exemple\_sujet.p}:Fichier \underline{exemple\_sujet.ord}:Fichier}
  \BlankLine
  V\'erifier l'int\'egrit\'e des arguments et les charg\'es en m\'emoire\;
  \eIf{Integre}{
      Calculer la matrice de Google $G$\;
      Calculer le vecteur de poids $\pi$\;
      Trier $\pi$ et d\'eterminer le PageRank $Pk$\;
      \'Ecrire les sorties\;
      }{
      Afficher la documentation\;
  }
  \caption{Programme Principale}
  \end{algorithm}

## Raffinage 1 : Vérifier l'intégrité des arguments et les chargés en mémoire
\SetKwProg{Exception}{exception}{}{end}
\SetKwProg{progll}{=$>$}{}{}
\SetAlgorithmName{Raffinage}{raffinage}{list of Raffinage}
\setcounter{algocf}{0}
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}

\SetKwInOut{Output}{Output}
\Input{stdin("-P -I 150 -A 0.90 exemple\_sujet.net")}
\Output{type\_matrice:Integer max\_iter:Integer $\alpha$:Float integre:Boolean}
\BlankLine
Initialiser les param\`etres avec les valeurs par d\'efauts\;
\Begin{
	Mettre \`a jour les param\`etres \;
	\Exception{}{
	Max\_Iter\_Arg\_Exception
		\progll{}{
			integre := False\;
			Afficher("-I max\_iter")
		}
	Alpha\_Arg\_Exception
		\progll{}{
			integre := False\;
			Afficher("-A alpha")
		}
	Net\_Arg\_Exception
		\progll{}{
			integre := False\;
			Afficher("chemin/fichier.net")
		}
	}
}
\caption{V\'erifier l'int\'egrit\'e des arguments et les charg\'es en m\'emoire}
\end{algorithm}

## Raffinage 2 : Initialiser les paramètres avec les valeurs par défauts
\SetAlgorithmName{Raffinage}{raffinage}{list of Raffinage}
\setcounter{algocf}{1}
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}

\SetKwInOut{Output}{Output}
\Input{}
\Output{type\_matrice max\_iter $\alpha$ Integre}
\BlankLine
type\_matrice := 0  \;
max\_iter := 150 \;
$\alpha$ := 0.85 \;
integre := True\;
\caption{Initialiser les param\`etres avec les valeurs par d\'efauts}
\end{algorithm}

## Raffinage 2 : Mettre à jour les paramètres
\SetKwProg{Exception}{exception}{}{end}
\SetKwProg{progll}{=$>$}{}{}
\SetAlgorithmName{Raffinage}{raffinage}{list of Raffinage}
\setcounter{algocf}{0}
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}

\SetKwInOut{Output}{Output}
\Input{Argument:String Argument\_Count:Integer}
\Output{type\_matrice:Integer max\_iter:Integer $\alpha$:Float integre:Boolean $A$}
\BlankLine
\If{not(1$\leq$Argument\_Count$\geq$6)}{
      Raise Argument\_Exception \;
      }
I := 1\;
\While{I $\neq$ Argument\_Count}{
\uIf{Argument(I) := "-P"}{
    type\_matrice := 1\;
  }
  \uElseIf{Argument(I) = "-I"}{
    max\_iter := Argument(I+1)\;
    I := I+1\;
  }
  \uElseIf{Argument(I) = "-A"}{
  	$\alpha$ := Argument(I+1) \;
    I := I+1\;
  }
  \Else{
    Ouvrir le fichier\;
    Construire la matrice adjacente $A$
  }
  I:=I+1\;
}
\caption{Mettre \`a jour les param\`etres}
\end{algorithm}
