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
        if Est_Vide (Pile) then
            raise Pile_Vide_Error;
        end if;

        return Pile.Elements (Pile.Taille);
    end Sommet;


    procedure Empiler (Pile : in out T_Pile; Element : in T_Element) is
    begin
        if Pile.Taille >= Capacite then
            raise Pile_Pleine_Error;
        end if;

        Pile.Taille := Pile.Taille + 1;
        Pile.Elements (Pile.Taille) := Element;
    end Empiler;

    procedure Depiler (Pile : in out T_Pile) is
    begin
        if Est_Vide (Pile) then
            raise Pile_Vide_Error;
        end if;

        Pile.Taille := Pile.Taille - 1;
    end Depiler;


end Piles;
