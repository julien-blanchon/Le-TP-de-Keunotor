with Ada.Text_IO;
use Ada.Text_IO;

-- Dans ce programme, les commentaires de spécification
-- ont **volontairement** été omis !

procedure Comprendre_Mode_Parametre is

    function Double (N : in Integer) return Integer is
    begin
        return 2 * N;
    end Double;

    procedure Incrementer (N : in out Integer) is
    begin
        N := N + 1;
    end Incrementer;

    procedure Mettre_A_Zero (N : out Integer) is
    begin
        N := 0;
    end Mettre_A_Zero;

    procedure Comprendre_Les_Contraintes_Sur_L_Appelant is
        A, B, R : Integer;
    begin
        A := 5;
        -- Indiquer pour chacune des instructions suivantes si elles sont
        -- acceptées par le compilateur.  Si elles sont refusées, expliquer
        -- pourquoi dans un commentaire sur la ligne.
        R := Double (A);
        R := Double (10);
        R := Double (10 * A);
        -- erreur car B non initialisé ! -- R := Double (B);

        Incrementer (A);
        -- le paramètre doit être une variable ou équivalent -- Incrementer (10);
        -- le paramètre doit être une variable ou équivalent -- Incrementer (10 * A);
        -- erreur car B non initialisé ! -- Incrementer (B);

        Mettre_A_Zero (A);
        -- le paramètre doit être une variable ou équivalent -- Mettre_A_Zero (10);
        -- le paramètre doit être une variable ou équivalent -- Mettre_A_Zero (10 * A);
        Mettre_A_Zero (B);
    end Comprendre_Les_Contraintes_Sur_L_Appelant;


    procedure Comprendre_Les_Contrainte_Dans_Le_Corps (
            A      : in Integer;
            B1, B2 : in out Integer;
            C1, C2 : out Integer)
    is
        L: Integer;
    begin
        -- pour chaque affectation suivante indiquer si elle est autorisée
        L := A;
        -- Erreur : A en in ! -- A := 1;

        B1 := 5;

        L := B2;
        B2 := B2 + 1;

        C1 := L;

        -- Avertissement : C n'a pas de valeur maîtrisée ! -- L := C2;

        C2 := A;
        C2 := C2 + 1;

        -- Le compilateur affichera des messages d'avertissement pour les
        -- variables qui sont affectées sans que leur valeur soit utlisée.
        -- Ceci est certainement un signe d'erreur dans le programme. Ici
        -- la raison est que ce programme ne fait rien d'intéressant et n'est
        -- là que pour illustrer ce que le programmeur peut faire sur un paramètre
        -- en fonction de son mode.
    end Comprendre_Les_Contrainte_Dans_Le_Corps;


begin
    Comprendre_Les_Contraintes_Sur_L_Appelant;
    Put_Line ("Fin");
end Comprendre_Mode_Parametre;
