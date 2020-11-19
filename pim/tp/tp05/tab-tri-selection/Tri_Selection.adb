with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

--Tri par sélection
procedure Tri_Selection is

    Capacite: constant Integer := 10;   -- Cette taille est arbitraire

    type T_TableauBrut is array (1..Capacite) of Integer;

    type T_Tableau is
        record
            Elements: T_TableauBrut;
            Taille: Integer;
            -- Invariant: 0 <= Taille and Taille <= Capacite;
        end record;


    -- Initialiser un tableau Tab à partir d'éléments lus au clavier.
    -- La nombre d'éléments est d'abord demandée, suivi des éléments.
    -- Les éléments en surnombre par rapport à la capacité du tableau
    -- sont ignorés et le message "Données tronquées" est affiché.
    procedure Lire (Tab: out T_Tableau) is
        Taille_Souhaitee: Integer;
        Nb_Elements: Integer;   -- Nombre d'éléments à lire
    begin
        -- Demander la taille
        Put ("Nombre d'éléments ? ");
        Get (Taille_Souhaitee);

        -- Déterminer le nombre d'éléments à saisir
        if Taille_Souhaitee > Capacite then
            Nb_Elements := Capacite;
        elsif Taille_Souhaitee < 0 then
            Nb_Elements := 0;
        else
            Nb_Elements := Taille_Souhaitee;
        end if;

        -- Demander les éléments du tableau
        for N in 1..Nb_Elements loop
            Put ("Element ");
            Put (N, 1);
            Put (" ? ");
            Get (Tab.Elements (N));
        end loop;
        Tab.Taille := Nb_Elements;

        if Nb_Elements < Taille_Souhaitee then
            Put_Line ("Données tronquées");
        else
            null;
        end if;
    end Lire;


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


--------------------[ Ne pas changer le code qui précède ]---------------------


    -- Trier le tableau dans l'ordre croissant des éléments
    -- Principe : On utilise le principe du tri par sélection.
    procedure Trier (Tab : in out T_Tableau) is
        Min: Integer;   -- Le plus petit élément
        Indice_Min: Integer;    -- Indice du minimum
    begin
        for Etape in 1..Tab.Taille - 1 loop
            -- Placer le plus petit élément de Tab.Element(Etape..Tab.Taille) en position Etape
            --   Déterminer la position du plus petit élément
            Indice_Min := Etape;
            Min := Tab.Elements (Indice_Min);
            for I in Etape+1..Tab.Taille loop
                if Tab.Elements (I) < Min then
                    Indice_Min := I;
                    Min := Tab.Elements (Indice_Min);
                else
                    null;
                end if;
            end loop;

            --    Échanger les éléments aux indices Etape et Indice_Min
            Tab.Elements (Indice_Min) := Tab.Elements (Etape);
            Tab.Elements (Etape) := Min;

            -- Afficher le tableau pour permettre la vérification de l'algorithme
            Ecrire (Tab);
            New_Line;
        end loop;
    end Trier;




----[ Ne pas changer le code qui suit, sauf pour la question optionnelle  ]----


    Tab1: T_Tableau;    -- Un tableau
begin
    Lire (Tab1);

    -- Afficher le tableau lu
    Put ("Tableau lu : ");
    Ecrire (Tab1);
    New_Line;

    Trier (Tab1);

    -- Afficher le tableau trié
    Put ("Tableau trié : ");
    Ecrire (Tab1);
    New_Line;

end Tri_Selection;
