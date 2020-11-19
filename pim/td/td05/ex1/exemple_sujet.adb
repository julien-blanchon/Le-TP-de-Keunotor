with Piles;     use Piles;

-- Programme de "test" du module Pile.
procedure Exemple_Sujet is

    Une_Pile: T_Pile;
begin
    -- Initialiser une pile
    Initialiser (Une_Pile);

    -- empiler successivement les caractères 'o', 'k', puis ' ?'
    Empiler (Une_Pile, 'o');
    Empiler (Une_Pile, 'k');
    Empiler (Une_Pile, '?');

    -- vérifier que le sommet est '?'
    pragma Assert ('?' = Sommet (Une_Pile));
    
    -- dépiler 3 fois
    for I in 1..3 loop
        Depiler (Une_Pile);
    end loop;

    -- vérifier que la pile est vide
    pragma Assert (Est_Vide (Une_Pile));

end Exemple_Sujet;
