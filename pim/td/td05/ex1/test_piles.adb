with Piles;     use Piles;

-- Programme de test du module Pile.
procedure Test_Piles is

    -- Initialiser une pile avec 'O' puis 'K' empilés dans la pile vide.
    procedure Initialiser_Avec_OK (Pile : out T_Pile) is
    begin
        Initialiser (Pile);
        Empiler (Pile, 'O');
        Empiler (Pile, 'K');
    end Initialiser_Avec_OK;

    procedure Tester_Est_Vide is
        Pile1, Pile2 : T_Pile;
    begin
        Initialiser (Pile1);
        pragma Assert (Est_Vide (Pile1));

        Empiler (Pile1, 'A');
        pragma Assert (not Est_Vide (Pile1));

        Initialiser_Avec_OK (Pile2);
        pragma Assert (not Est_Vide (Pile2));
    end Tester_Est_Vide;

    procedure Tester_Empiler is
        Pile1 : T_Pile;
    begin
        Initialiser_Avec_OK (Pile1);
        pragma Assert (not Est_Pleine (Pile1));

        Empiler (Pile1, 'N');
        pragma Assert ('N' = Sommet (Pile1));

        -- remplir la pile
        for I in 4..20 loop     -- Attention : 20 = Capacite dans piles.adb !
            Empiler (Pile1, '.');
        end loop;

        pragma Assert (Est_Pleine (Pile1));
    end Tester_Empiler;

    procedure Tester_Depiler is
        Pile1 : T_Pile;
    begin
        Initialiser_Avec_OK (Pile1);
        Depiler (Pile1);
        pragma Assert ('O' = Sommet (Pile1));
        Depiler (Pile1);
        pragma Assert (Est_Vide (Pile1));
    end Tester_Depiler;

begin
    Tester_Est_Vide;
    Tester_Empiler;
    Tester_Depiler;
end Test_Piles;
