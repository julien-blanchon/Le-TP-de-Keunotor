with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

-- Afficher le signe d'un entier lu au clavier
procedure Signe_Entier is
    Nombre: Integer; -- Entier lu au clavier dont on veut connaître le signe

begin
    -- Demander un entier
    Get (Nombre);

    -- Afficher le signe de l'entier
    if Nombre > 0 then
        Put ("positif");
    elsif Nombre = 0 then
        Put ("nul");
    else
        Put ("negatif");
    end if;
    New_Line;

end Signe_Entier;
