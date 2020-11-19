with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;

procedure Robot_Type_1 is

--| Le type T_Direction |---------------------------------------------------

    type T_Direction is (NORD, EST, SUD, OUEST);


--| Le type T_Robot |-------------------------------------------------------

    type T_Robot is
        --    ^ Y
        --    |
        --    |         Robot de coordonnées (4, 2) direction OUEST
        --  2 |      <o
        --  1 |
        --   -+-------------------------------->
        --    | 1 2 3 4                        Y
        record
            Abscisse, Ordonnee: Integer;    -- les coordonnées
            Direction: T_Direction;         -- direction du robot
        end record;


--| Le type T_Environnement |-----------------------------------------------

    MAX_X: constant Integer := 100;
    MAX_Y: constant Integer := 50;

    type T_Case is (LIBRE, OBSTACLE);
    type T_Environnement is array (-MAX_x..MAX_X, -MAX_Y..MAX_Y) of T_Case;


--| Le programme principal |------------------------------------------------

    R1, R2: T_Robot;  -- deux robots R1 et R2
    E1: T_Environnement;  -- un environnement !
begin
    -- Initialiser R1 pour que son abscisse soit 4, son ordonnée 2 et sa direction ouest
    R1 := (4, 2, OUEST);

    -- Initialiser R2 avec R1
    R2 := R1;

    -- Modifier l'abscisse de R1 pour qu'elle devienne 3
    R1.Abscisse := 3;

    -- Afficher l'abscisse de R1. La valeur affichée sera 3
    Put ("Abscisse de R1 : ");
    Put (R1.Abscisse, 1);
    New_Line;

    -- Afficher l'abscisse de R2. La valeur affichée sera 4
    Put ("Abscisse de R2 : ");
    Put (R2.Abscisse, 1);
    New_Line;

    -- Modifier l'environnement pour que la case de coordonnées (3,2) soit libre.
    E1 (3, 2) := LIBRE;

    -- Afficher "OK" si le robot R1 est sur une case libre, "ERREUR" sinon
    if E1 (R1.Abscisse, R1.Ordonnee) = LIBRE then
        Put_Line ("OK");
    else
        Put_Line ("ERREUR");
    end if;

end Robot_Type_1;
