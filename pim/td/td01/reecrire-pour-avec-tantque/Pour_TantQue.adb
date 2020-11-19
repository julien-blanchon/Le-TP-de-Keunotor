with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Pour_TantQue is
    Debut: Integer;
    Fin: Integer;
    Element: Integer;
    ValeurFin: Integer;     -- Mémorisation de la valeur de Fin
begin
    -- Demander les valeurs de Debut et Fin
    Get (Debut);
    Get (Fin);

    -- Afficher les entiers de Début à Fin
    --    La boucle réécrite avec un TantQue
    ValeurFin := Fin;
    Element := Debut;
    while Element <= ValeurFin loop
        Put (Element);
        New_Line;
        Element := Element + 1;
    end loop;
end Pour_TantQue;
