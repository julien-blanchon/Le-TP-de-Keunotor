-- Spécification du module Piles.

generic
    Capacite : Integer;   -- Nombre maximal d'éléments qu'une pile peut contenir
    type T_Element is private;  -- Type des éléments de la pile

package Piles is

    type T_Pile is limited private; --! "très privé" en Algorithmique !
        --! Sur un type privé, on a droit à l'affectation (:=) et l'égalité (=).
        --! On perd ces opérations avec un type "limited private" (très privé).


    Pile_Vide_Error: Exception; -- en cas d'opération sur une pile vide
    Pile_Pleine_Error: Exception;   -- dépassement de la capacité d'une pile


    -- Initilaiser une pile.  La pile est vide.
    procedure Initialiser (Pile : out T_Pile) with
        Post => Est_Vide (Pile);


    -- Est-ce que la pile est vide ?
    function Est_Vide (Pile : in T_Pile) return Boolean;


    -- Est-ce que la pile est pleine ?
    function Est_Pleine (Pile : in T_Pile) return Boolean;


    -- L'élément en sommet de la pile.
    -- Exception : Pile_Vide_Error si la pile est vide.
    function Sommet (Pile : in T_Pile) return T_Element;


    -- Empiler l'élément en somment de la pile.
    procedure Empiler (Pile : in out T_Pile; Element : in T_Element) with
        Post => Sommet (Pile) = Element;


    -- Supprimer l'élément en sommet de pile
    -- Exception : Pile_Vide_Error si la pile est vide.
    procedure Depiler (Pile : in out T_Pile);


private

    type T_Tab_Elements is array (1..Capacite) of T_Element;

    type T_Pile is 
        record
            Elements : T_Tab_Elements;  -- les éléments de la pile
            Taille: Integer;        -- Nombre d'éléments dans la pile
        end record;

end Piles;
