with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Tours_De_Hanoi is

    -- Déplacer les Nombre_Disques de la tige Tige_Depart vers la Tige_Arrivee
    -- en respectant les règles.
    -- Préocndition :
    --     Les Nombre_Disques sont sur la tige Tige_Depart du plus grand au
    --     plus petit.  Les tiges Tige_Arrivee et Tige_Depart ne contiennent
    --     pas de disque de taille inférieure au Nombre_Disques de la tige
    --     Tige_Depart.
    -- Postcondition :
    --     Les Nombre_Disques sont déplacés sur Tige_Arrivee
    procedure Resoudre_Hanoi(
            Nombre_Disques: Integer;    --
            Tige_Depart: Character;     -- la tige où sont les Nombre_Disques disques
            Tige_Arrivee: Character;    -- la tige où doivent être déplacés les disques
            Tige_Intermediaire: Character  -- la tige qui peut être utilisée
        ) with
            Pre => Nombre_Disques >= 0
    is
    begin
        if Nombre_Disques = 0  then
            null;  -- rien à faire
        elsif Nombre_Disques = 1 then
            -- Déplacer 1 disque de Tige_Depart à Tige_Arrivee
            Put (Tige_Depart);
            Put (" -> ");
            Put (Tige_Arrivee);
            New_Line;
        else
            Resoudre_Hanoi (Nombre_Disques - 1, Tige_Depart, Tige_Intermediaire, Tige_Arrivee);
            Resoudre_Hanoi (1, Tige_Depart, Tige_Arrivee, Tige_Intermediaire);
            Resoudre_Hanoi (Nombre_Disques - 1, Tige_Intermediaire, Tige_Arrivee, Tige_Depart);
        end if;
    end Resoudre_Hanoi;


    Nb: Integer;         -- Nombre de disque du jeu
begin
    -- Demander le réel
    Put ("Nombre de disques : ");
    Get (Nb);

    Resoudre_Hanoi (Nb, 'A', 'C', 'B');

end Tours_De_Hanoi;
