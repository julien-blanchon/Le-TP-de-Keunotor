with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Table_Pythagore is

    Taille: Integer;    -- taille de la table
    Produit: Integer;   -- Résultat d'une multiplication
begin
    -- Demander la taille
    Get (Taille);

    -- Afficher la table de Pythagore
    --   Afficher la première ligne (opérandes de droite)
    Put ('X');
    for Droit in 1..Taille loop
        Put (Droit, 3);
    end loop;
    New_Line;

    --   Afficher les lignes de la table
    for Gauche in 1..Taille loop
        -- Afficher l'opérande de gauche
        Put (gauche, 1);

        -- Afficher la table de gauche
        for Droit in 1..Taille loop
            Produit := Gauche * Droit;
            Put (Produit, 3);
        end loop;
        New_Line;
    end loop;

end Table_Pythagore;
