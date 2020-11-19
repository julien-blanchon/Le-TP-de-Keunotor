with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Table_7 is
    Table: constant Integer := 7;   -- la table à afficher
    Produit: Integer;               -- une valeur de la table
begin
    -- Afficher la table de 7
    for Nombre in 1..9 loop
        -- Calculer la valeur de la table
        Produit := Nombre * Table;

        -- Afficher la ligne
        Put (Nombre, 1);
        Put (" x ");
        Put (Table, 1);
        Put (" = ");
        Put (Produit, 2);
        New_Line;
    end loop;
end Table_7;
