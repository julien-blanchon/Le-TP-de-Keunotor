with Ada.Text_IO;
use Ada.Text_IO;

procedure Specifier_Et_Tester is

    -- La valeur absolue d'un nombre entier.
    function Valeur_Absolue (N : in Integer) return Integer with
        Post => Valeur_Absolue'Result >= 0
            and (Valeur_Absolue'Result = N or Valeur_Absolue'Result = -N)
    is
    begin
        if N >= 0 then
            return N;
        else
            return - N;
        end if;
    end Valeur_Absolue;


    -- Incrémenter un entier N.  Les entiers étant bornés, il ne faut pas que
    -- l'entier soit le dernier Integer'LAST.  Après exécution de Incrémenter,
    -- l'entier passé en paramètre a sa valeur augmentée de 1.
    procedure Incrementer (N : in out Integer) with
        Pre => N /= Integer'LAST,
        Post => N = N'Old + 1       -- N incrémenté
    is
    begin
        N := N + 1;
    end Incrementer;


    -- Calculer le quotient et le reste de deux nombres entiers, Dividende et
    -- Diviseur.  Les deux doivent être positif et Diviseur doit être non nul.
    -- Quotient et Reste sont tels que Dividende = Quotient * Diviseur + Reste
    -- avec Reste compris entre 0 et Diviseur - 1.
    procedure Calculer_DivMod (Dividende, Diviseur : in Integer ; Quotient, Reste: out Integer) with
        Pre => Dividende >= 0 and Diviseur > 0,
        Post => Dividende = Quotient * Diviseur + Reste
            and 0 <= Reste and Reste < Diviseur
    is
        Le_Quotient: Integer;
        Le_Reste: Integer;
    begin
        -- Principe : Le reste étant initialisé avec le dividende, le quotient
        -- est le nombre de fois que l'on peut lui retrancher Diviseur.
        Le_Quotient := 0;
        Le_Reste := Dividende;
        while Le_Reste >= Diviseur loop
            -- Variant : Le_Reste
            -- Invariant : Dividende = Le_Quotient * Diviseur + Le_Reste;
            Le_Quotient := Le_Quotient + 1;
            Le_Reste := Le_Reste - Diviseur;
        end loop;

        Quotient := Le_Quotient;
        Reste := Le_Reste;
            --! Quotient et Reste ne doivent être affectés qu'une seule fois car en out
            --! Il est conseillé de le faire à la fin au cas où une exception se produirait
    end Calculer_DivMod;


    procedure Tester_Valeur_Absolue is
    begin
        pragma Assert (Valeur_Absolue (5) = 5);     -- Cas entier positif
        pragma Assert (Valeur_Absolue (-7) = 7);    -- Cas entier négatif
        pragma Assert (Valeur_Absolue (0) = 0);     -- Cas entier nul
    end Tester_Valeur_Absolue;


    procedure Tester_Incrementer is
        Un_Nombre: Integer;
    begin
        -- un premier test
        Un_Nombre := 1;
        Incrementer (Un_Nombre);
        pragma Assert (Un_Nombre = 2);

        -- un deuxième test
        Un_Nombre := 5;
        Incrementer (Un_Nombre);
        pragma Assert (Un_Nombre = 6);
    end Tester_Incrementer;


    procedure Tester_Calculer_DivMod is
        Q, R: Integer;
    begin
        -- Cas Dividende > Diviseur et reste non nul
        Calculer_DivMod(13, 3, Q, R);
        pragma Assert (Q = 4);
        pragma Assert (R = 1);

        -- Cas Dividende = Diviseur
        Calculer_DivMod(15, 15, Q, R);
        pragma Assert (Q = 1);
        pragma Assert (R = 0);

        -- Cas Dividende > Diviseur et reste nul
        Calculer_DivMod(15, 5, Q, R);
        pragma Assert (Q = 3);
        pragma Assert (R = 0);

        -- Cas Dividende < Diviseur
        Calculer_DivMod(7, 19, Q, R);
        pragma Assert (Q = 0);
        pragma Assert (R = 7);
    end Tester_Calculer_DivMod;


begin
    Tester_Valeur_Absolue;
    Tester_Incrementer;
    Tester_Calculer_DivMod;

    Put_Line ("Fin");
end Specifier_Et_Tester;
