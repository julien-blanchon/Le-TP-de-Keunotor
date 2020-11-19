with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

-- Afficher le nombre de jours d'un mois pour une année qui n'est pas bissextile.
-- Contrainte : le modulo est interdit (reste de la division entière).
procedure Afficher_Nombre_Jours_Mois is

    Mois: Integer;      -- le mois saisi au clavier
    Nb_Jours: Integer;  -- le nombre de jours de Mois
begin
    -- Demander le mois
    Get (Mois);

    pragma Assert(1 <= Mois and Mois <= 12);

    -- Déterminer le nombre de jours du mois
    case Mois is
        when 2 =>               -- février
            Nb_Jours := 28;
        when 4 | 6 | 9 | 11 =>  -- mois à 30 jours
            Nb_Jours := 30;
        when others =>          -- mois à 31 jours
            Nb_Jours := 31;
    end case;

    -- Afficher le nombre de jours
    Put (Nb_Jours, 1);
    New_Line;

end Afficher_Nombre_Jours_Mois;
