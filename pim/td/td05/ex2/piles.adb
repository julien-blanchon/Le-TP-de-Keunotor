-- Implantation du module Piles.

package body Piles is

    procedure Initialiser (Pile : out T_Pile) is
    begin
        Pile.Taille := 0;
    end Initialiser;

    function Est_Vide (Pile : in T_Pile) return Boolean is
    begin
        return Pile.Taille = 0;
    end Est_Vide;

    function Est_Pleine (Pile : in T_Pile) return Boolean is
    begin
        return Pile.Taille >= Capacite;
    end Est_Pleine;

    function Sommet (Pile : in T_Pile) return T_Element is
    begin
        return Pile.Elements (Pile.Taille);
    end Sommet;

    procedure Empiler (Pile : in out T_Pile; Element : in T_Element) is
    begin
        Pile.Taille := Pile.Taille + 1;
        Pile.Elements (Pile.Taille) := Element;
    end Empiler;

    procedure Depiler (Pile : in out T_Pile) is
    begin
        Pile.Taille := Pile.Taille - 1;
    end Depiler;

end Piles;
