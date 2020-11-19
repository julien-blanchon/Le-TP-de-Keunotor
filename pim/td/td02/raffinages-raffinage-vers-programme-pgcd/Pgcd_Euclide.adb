with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

-- Afficher le pgcd de deux entiers strictement positifs
procedure Pgcd_Euclide is

    A, B: Integer;      -- deux entiers saisis au clavier
    Pgcd: Integer;      -- le pgcd de A et B
    Na, Nb: Integer;    -- utilisées pour le calcul du pgcd

begin
    -- Demander deux entiers
    --   | Attention : la spécification n'est pas respectée car cette saisie
    --   | ne garantit pas que les deux entiers seront strictement positifs
    --   | Ce raffinage n'est donc pas correct et le programme ne sera pas robuste !
    Put ("A et B ? ");
    Get (A);
    Get (B);

    pragma Assert ((A > 0) and (B > 0));

    -- Déterminer le pgcd de A et B
    NA := A;    -- variables auxiliaires : ceci permet
    NB := B;    -- de conserver les valeurs saisies
    while NA /= NB loop     -- NA et NB différents
        -- Soustraire au plus grand le plus petit
        if NA > NB then
            NA := NA - NB;
        else
            NB := NB - NA;
        end if;
    end loop;
    Pgcd := NA;

    -- Afficher le pgcd
    Put ("pgcd = ");
    Put (Pgcd, 1);
end Pgcd_Euclide;
