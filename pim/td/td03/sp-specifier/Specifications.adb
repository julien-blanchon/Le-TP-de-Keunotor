procedure Specifications is

    -- Retourner la puissance entière d'un réel.
    -- Paramètres :
    --     Nombre: in Float     -- le nombre réel
    --     Exposant: in Integer -- l'exposant
    -- Résultat : Réel  -- Nombre à la puissance Exposant
    -- Nécessite :
    --     (Exposant >= 0) Ou (Nombre /= 0)     -- pas de division par zéro
    -- Assure
    --     Résultat == Nombre ** Exposant à epsilon près
    function Puissance (Nombre: in Float; Exposant: in Integer) return Float;


    -- Saisir un entier au clavier
    -- Paramètres :
    --    Nombre: out Integer   -- l'entier à saisir
    -- Nécessite : ---
    -- Assure : -- Nombre est l'entier saisi
    procedure Saisir(Nombre: out Integer);


    -- Est-ce qu'une année est bissextile ?
    -- Paramètres
    --    Année : in Integer -- l'année à analyser
    -- Résultat : Booléan  -- Vrai ssi Année est bissextile
    -- Nécessite
    -- Assure
    --      Résultat = (Année Mod 4 = 0) Et ((Année Mod 100 /= 0) Ou (Année Mod 400 = 0))
    function Est_Bissextile(Annee: in Integer) return Boolean;


    -- Calculer le pgcd de deux entiers strictement positifs.
    -- Paramètre
    --  A, B : in Integer   -- deux entiers > 0
    -- Résultat : Integer   -- le pgcd de A et B
    -- Nécessite :
    --      A > 0;
    --      B > 0;
    -- Assure :
    --      Résultat > 0;       -- le pgcd est positif
    --      A mod Résultat = 0  -- le résultat divise A
    --      B mod Résultat = 0  -- le résultat divise B
    --      -- Résultat est le plus grand diviseur de A et B
    function Pgcd (A, B: in Integer) return Integer;

    -- Remarque : nous avons respecté les précondition de l'énoncé mais nous
    -- pourrions les diminuer. Il faut alors préciser ce que serait le pgcd.
    -- Si A et B non nuls, on peut prendre Pgcd (A, B) = Pgcd ( Abs (A), Abs (B))
    -- Si A est nul, le Pgcd est B (et inversement).


    -- Calculer le quotient et le reste de la division entière d'un dividende par un diviseur
    -- Paramètres
    --   Dividende: in Integer
    --   Diviseur: in Integer
    --   Quotient: out Integer
    --   Reste: out Integer
    -- Nécessite :
    --   Dividende >= 0
    --   Diviseur > 0
    -- Assure
    --   Dividende = Quotient * Diviseur + Reste
    --   0 <= Reste ET Reste < Diviseur
    procedure Calculer_Quotient_Reste (Dividende, Diviseur : in Integer;
                                       Quotient, Reste : out Integer);

    -- Remarque : on en fait une procédure car on a deux paramètres en out.  On
    -- pourrait en faire une fonction si on avait un moyen facile de renvoyer
    -- deux valeurs (comme les n-uplets de Python).   On verra plus tard les
    -- types enregistrements ou les tableaux mais ils resteront trop lourds à
    -- utiliser dans ce contexte.


    -- Saisir un entier au clavier, entier qui doit être compris entre Inf et Sup inclus.
    -- Une consigne est affiché à l'utilisateur avant la saisie.  En cas de saisie incorrecte,
    -- une explication est affiché à l'utilisateur et une nouvelle saisie a lieu.
    -- Paramètres
    --   Inf, Sup : in Integer  -- Bornes entre lesquelles doit se trouver l'entier saisi
    --   Consigne : in String   -- Le message à afficher à l'utilisateur
    --   Nombre : out Integer   -- L'entier saisi
    -- Nécessite
    --   Inf < Sup  -- au moins deux éléments possibles
    -- Assure
    --   Inf <= Nombre <= Sup
    procedure Saisir (Entier: out Integer ; Inf, Sup : in Integer; Consigne: in String);

    -- Remarque : On a un seul paramètre en sorte et les autres paramètres en
    -- in.  On pourrait penser que les conditions sont remplis sont remplis
    -- pour en faire une fonction.   Ce n'est pourtant pas le cas car ce sous
    -- programme réalise des entrées/sorties à l'utlisateur et, à ce titre, a
    -- des effets de bords.  Ceci est contradictoire avec la notion de fonction
    -- au sens mathématique du  terme.  Nous en faisons donc une procédure.
    --
    -- Notons que ce n'est pas le choix fait par tous les langages, Python par
    -- exemple et sa fonction `input()`.


    -- Ordonner trois caractères dans l'ordre croissant.
    -- Paramètres :
    --  C1, C2, C3 : in out Character   -- les 3 caractères à ordonner
    -- Nécessite : ---
    -- Assure
    --  C1 <= C2 ET C2 <= C3        -- ordonnées
    --  (C1, C2, C3) est une permutation de (C1'Old, C2'Old, C3' Old)
    procedure Ordonner (C1, C2, C3 : in out Character);


    -- Afficher un entier naturel.
    -- Paramètres
    --  Nombre : in Integer -- l'entier, positif, à afficher
    -- Nécessite
    --      Nombre >= 0
    -- Assure
    --      -- L'entier a été affiché
    procedure Afficher (Nombre: in Entier);


    -- Remarque : dans ce fichier nous avons fait des déclaration en avant des
    -- sous-programmes.  Le compilateur Ada signalera des erreurs car il ne
    -- trouve pas le code de ces sous-programmes.   De telles spécifications
    -- pourront être définies dans l'interface d'un module.

end Specifications;
