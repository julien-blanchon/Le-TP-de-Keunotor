with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;    use Ada.Float_Text_IO;

procedure Somme_Entier_Reel is

    Entier : Integer; -- l'entier lu au clavier
    Reel : Float;     -- le réel lu au clavier
    Somme : Float;    -- la somme de l'entier par le réel

begin
    -- Demander l'entier
    Get (Entier);

    -- Demander le réel
    Get (Reel);

    -- Calculer la somme de l'entier et du réel
    Somme := Float (Entier) + Reel;

    -- Afficher la somme
    Put ("Somme : ");
    Put (Somme, Exp => 0);
        -- Exp => 0 signifie utiliser 0 chiffre pour l'exposant (si possible)
    New_Line;

end Somme_Entier_Reel;
