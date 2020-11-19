with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;

procedure Maximum is

    -- Le plus grand de 2 entiers.
    function Max2 (N1, N2 : in Integer) return Integer with
        Post =>
            (Max2'Result = N1 or Max2'Result = N2)    -- Max2 est soit N1 et N2
            and Max2'Result >= N1 and Max2'Result >= N2 -- et c'est le plus grand
    is
    begin
        if N1 >= N2 then
            return N1;
        else
            return N2;
        end if;
    end Max2;


    procedure Tester_Max_2_Parametres is
    begin
        pragma Assert (Max2 (5, 18) = 18);      -- Cas N1 < N2
        pragma Assert (Max2 (10, 2) = 10);      -- Cas N1 > N2
        pragma Assert (Max2 (-3, -3) = -3);     -- Cas N1 = N2
    end Tester_Max_2_Parametres;


    -- Le plus grand de 3 entiers.
    function Max3 (N1, N2, N3 : in Integer) return Integer with
        Post =>
            Max3'Result = Max2 (N1, Max2 (N2, N3))
    is
    begin
        return Max2 (N1, Max2 (N2, N3));
    end Max3;

    procedure Tester_Max_3_Parametres is
    begin
        pragma Assert (Max3 (5, 18, 25) = 25);      -- Le plus grand à la fin
        pragma Assert (Max3 (4, 1, 2) = 4);         -- Le plus grand au début
        pragma Assert (Max3 (-3, -1, -4) = -1);     -- Le plus grand au milieu
    end Tester_Max_3_Parametres;

-- Test PIXAL ------------------------------------------------------------------

    A, B, C, D, E: Integer; -- 5 entiers lu au clavier
begin
    Tester_Max_2_Parametres;
    Tester_Max_3_Parametres;

    -- Demander les entiers
    Put("Donner 5 entiers : ");
    Get(A);
    Get(B);
    Get(C);
    Get(D);
    Get(E);

    -- Afficher le Max de A et B
    Put ("Max2 (");
    Put (A, 1);
    Put (", ");
    Put (B, 1);
    Put (") = ");
    Put (Max2 (A, B), 1);
    New_Line;

    -- Afficher le Max de C, D et E
    Put ("Max3 (");
    Put (C, 1);
    Put (", ");
    Put (D, 1);
    Put (", ");
    Put (E, 1);
    Put (") = ");
    Put (Max3 (C, D, E), 1);
    New_Line;

end Maximum;
