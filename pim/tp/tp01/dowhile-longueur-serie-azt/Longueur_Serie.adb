with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

-- Afficher la longueur d'un série dont les valeurs sont lues au clavier.
-- La série se termine par la valeur nulle.
procedure Longueur_Serie is

    Valeur: Integer;    -- Une valeur de la série
    Longueur: Integer;  -- Longueur de la série (nombre de valeurs)

begin
    -- Déterminer la longueur de la série lue un clavier
    Longueur := 0;
    loop
        Get (Valeur);
        Longueur := Longueur + 1;
    exit when Valeur = 0;
    end loop;

    -- Afficher la longueur
    Put ("Longueur : ");
    Put (Longueur, 1);
    New_Line;

end Longueur_Serie;
