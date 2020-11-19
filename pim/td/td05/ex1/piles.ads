-- Spécification du module Piles.

package Piles is

    type T_Pile is private;

    -- Initilaiser une pile.  La pile est vide.
    procedure Initialiser (Pile : out T_Pile) with
        Post => Est_Vide (Pile);

    -- Est-ce que la pile est vide ?
    function Est_Vide (Pile : in T_Pile) return Boolean;

    -- Est-ce que la pile est pleine ?
    function Est_Pleine (Pile : in T_Pile) return Boolean;

    -- L'élément en sommet de la pile.
    function Sommet (Pile : in T_Pile) return Character with
        Pre => not Est_Vide (Pile);

    -- Empiler l'élément en somment de la pile.
    procedure Empiler (Pile : in out T_Pile; Element : in Character) with
        Pre => not Est_Pleine (Pile),
        Post => Sommet (Pile) = Element;

    -- Supprimer l'élément en sommet de pile
    procedure Depiler (Pile : in out T_Pile) with
        Pre => not Est_Vide (Pile);

private

    Capacite : constant Integer := 20;  -- Capacité des piles

    type T_Tab_Elements is array (1..Capacite) of Character;

    type T_Pile is 
        record
            Elements : T_Tab_Elements;  -- les éléments de la pile
            Taille: Integer;        -- Nombre d'éléments dans la pile
        end record;

end Piles;
