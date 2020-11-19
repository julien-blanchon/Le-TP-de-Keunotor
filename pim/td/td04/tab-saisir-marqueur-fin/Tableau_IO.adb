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
    -- Les éléments sont saisis les uns à la suite des autres.  La fin
    -- est indiqué par un élément particulier : FIN.
    -- Les éléments en surnombre par rapport à la capacité du tableau
    -- sont ignorés et le Depassement vaut vrai.  Il vaut faux sinon.
    procedure Lire (Tab: out T_Tableau; Depassement : out Boolean) is
        Entier : Integer;       -- un entier lu au clavier
        Nb_Elements: Integer;   -- Nombre d'éléments à lire
        FIN: constant Integer := -1;    -- marqueur de fin de la série
    begin
        -- Salsir un premier entier
        Get (Entier);

        Tab.Taille := 0;
        while Entier /= FIN             -- un élément du tableau
            and Tab.Taille < Capacite   -- y a de la place dans le tableau
        loop
            -- stocker l'élément
            Tab.Taille := Tab.Taille + 1;
            Tab.Elements (Tab.Taille) := Entier;

            -- Lire un nouveal entier
            Get (Entier);
        end loop;

        -- Positionner Depassement
        Depassement := Entier /= FIN;
    end Lire;


----[ Ne pas changer le code qui suit, sauf pour la question optionnelle  ]----


    Tab1: T_Tableau;        -- Un tableau
    Depassement: Boolean;   -- Y-a-t-il dépassemnt pendant la saisie ?
begin
    Lire (Tab1, Depassement);
    if Depassement then
        Put_Line ("Données tronquées");
    else
        null;
    end if;

    -- Afficher le tableau lu
    Put ("Tableau lu : ");
    Ecrire (Tab1);
    New_Line;

end Tableau_IO;
