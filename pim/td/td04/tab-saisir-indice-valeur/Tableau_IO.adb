with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

-- Lire et écrire un tableau d'entiers.
procedure Tableau_IO is

    Capacite: constant Integer := 10;   -- Cette taille est arbitraire

    type T_TableauBrut is array (1..Capacite) of Integer;

    type T_Tableau is
        record
            Elements: T_TableauBrut;
            Taille: Integer;
            -- Invariant: 0 <= Taille and Taille <= Capacite;
        end record;


--------------------[ Ne pas changer le code qui précède ]---------------------


    -- Afficher le tableau.  Les éléments sont affichés entre crochets, séparés
    -- par des virgules.
    procedure Ecrire(Tab: in T_Tableau) is
    begin
        Put ('[');
        if Tab.Taille > 0 then
            -- Écrire le premier élément
            Put (Tab.Elements (1), 1);

            -- Écrire les autres éléments précédés d'une virgule
            for I in 2..Tab.Taille loop
                Put (", ");
                Put (Tab.Elements (I), 1);
            end loop;
        else
            null;
        end if;
        Put (']');
    end Ecrire;


    -- Initialiser un tableau Tab à partir d'éléments lus au clavier.
    -- L'utilisateur donne un indice, puis la valeur à cet indice.  Ceci permet
    -- de modifier une valeur déjà renseignée.  La taille du tableau est le plus
    -- grand indice dont la valeur est positionnée.  Les valeurs non affectés
    -- auront la valeur par défaut.
    procedure Lire (Tab: out T_Tableau; Valeur_Defaut: in Integer := 0) is

        procedure Demander_Indice (Indice: out Integer) is
        begin
            Put ("Indice (-1 pour arrêter) ? ");
            Get (Indice);
        end Demander_Indice;

        FIN: constant Integer := -1 ; -- valeur de l'indice qui termine la série

        Indice: Integer;    -- indice de la valeur à modifier

    begin
        -- Initialiser avec la valeur par défaut
        Tab.Elements (1..Capacite) := (others => Valeur_Defaut);
        Tab.Taille := 0;    -- le tableau est vide au départ

        -- Proposer de modifier les valeurs du tableau
        Demander_Indice (Indice);
        while Indice /= FIN loop
            if 1 <= Indice and Indice <= Capacite then
                -- Demander la valeur
                Put ("Valeur ? ");
                Get (Tab.Elements (Indice));

                -- Adapter la taille
                if Indice > Tab.Taille then
                    Tab.Taille := Indice;
                else
                    null;
                end if;
            else
                -- Signaler l'erreur sur l'indice
                Put ("Erreur : l'indice doit être entre 1 et ");
                Put (Capacite, 1);
                Put_Line (".");
            end if;

            Demander_Indice (Indice);
        end loop;
    end Lire;



----[ Ne pas changer le code qui suit, sauf pour la question optionnelle  ]----


    Tab1: T_Tableau;    -- Un tableau
    Defaut: Integer;    -- Valeur par défaut
begin
    -- Demander la valeur par défaut
    Put ("Valeur par défaut ? ");
    Get (Defaut);

    Lire (Tab1, Defaut);

    -- Afficher le tableau lu
    Put ("Tableau lu : ");
    Ecrire (Tab1);
    New_Line;

end Tableau_IO;
