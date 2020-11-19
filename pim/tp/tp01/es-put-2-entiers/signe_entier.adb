with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Signe_Entier is

    N1, N2: Integer; -- Entier lu au clavier dont on veut connaître le signe

begin
    -- Demander les deux entiers N1 et N2
    Get (N1);
    Get (N2);

    -- Afficher N1 et N2 chacun sur une ligne
    Put_Line ("Un par ligne :");
    Put (N1);
    New_Line;
    Put (N2);
    New_Line;

    -- Afficher N1 et N2 alignés contre la marge
    Put_Line ("Un par ligne, alignés contre la marge :");
    Put (N1, 1);
    New_Line;
    Put (N2, 1);
    New_Line;

    -- Afficher « Le premier nombre est {N1}, le second {N2}."
    Put_Line ("La phrase demandée :");
    Put ("Le premier nombre est ");
    Put (N1, 1);
    Put (", le second ");
    Put (N2, 1);
    Put (".");
    New_Line;

    -- Afficher « {N1} + {N2} = {N1 + N2} »
    Put_Line ("Addition :");
    Put (N1, 1);
    Put (" + ");
    Put (N2, 1);
    Put (" = ");
    Put (N1 + N2, 1);
    New_Line;


end Signe_Entier;
