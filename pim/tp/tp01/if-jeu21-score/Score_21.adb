with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Score_21 is

    De1, De2 : Integer; -- les deux dés
    Score: Integer;     -- le score obtenu avec les deux dés
begin
    -- Demander la valeur des dés
    Get (De1);
    Get (De2);

    -- Déterminer le score
    --   Ordonner les deux dés (de1 >= de2)
    if de1 < de2 then
        de1 := de1 + de2;
        de2 := de1 - de2;
        de1 := de1 - de2;
    end if;

    pragma assert (de1 >= de2);

    -- Déterminer le score sachant que de1 >= de2
    if de1 = 2 and de2 = 1 then -- 21
        Score := 21;
    elsif de1 = de2 then            -- paire
        Score := 10 + de1;
    elsif de1 = de2 + 1 then        -- suite
        Score := de1 + de2;
    else
        Score := 0;
    end if;

    -- Afficher le score
    Put ("Score : ");
    Put (Score, 1);
    New_Line;

end Score_21;
