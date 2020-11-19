with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;    use Ada.Float_Text_IO;

-- Afficher une valeur approchée de la racine carréé d'un nombre réel
procedure Racine_Carree_Rang is

    A: Float;       -- le nombre dont on veut calculer la racine carrée
    Rang: Integer;  -- le rang souhaité
    Racine: Float;  -- valeur approchée de la racine carrée de A

    Terme: Float;   -- le terme de rang Rang de la suite
begin
    -- Demander la valeur (sans contrôle)
    Get (A);

    -- Déterminer la valeur approchée de la racine carrée
    --     Demander le rang (sans contrôle)
    Get (Rang);

    --     Calculer le terme de rang Rang de la suite
    if A = 0.0 then
        Racine := 0.0;
    else
        Terme := A;
        for N in 1..Rang loop
            Terme := (Terme + A / Terme) / 2.0;
        end loop;
        Racine := Terme;
    end if;

    -- Afficher la valeur approchée de la racine carrée
    Put (Racine, Exp => 0, Aft => 4);
    New_Line;

end Racine_Carree_Rang;
