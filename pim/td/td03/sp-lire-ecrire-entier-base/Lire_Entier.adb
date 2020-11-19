with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Lire_Entier is

    Base_MAX : constant Integer := 10 + 26; -- 10 chiffres ('0'..'9') + 26 lettres ('A'..'Z')


    -- Est-ce que la base est valide ?
    function Est_Base_Valide (Base : in Integer) return Boolean is
    begin
        return 2 <= Base and Base <= Base_MAX;
    end Est_Base_Valide;


    -- Le dernier symbole utilisé pour une base donnée.
    function Dernier_Symbole (Base : in Integer) return Character with
        Pre => Est_Base_Valide (Base)
    is
    begin
        if Base <= 10 then
            return Character'Val (Character'Pos ('0') + Base - 1);
        else
            return Character'Val (Character'Pos ('A') + Base - 1 - 10);
        end if;
    end Dernier_Symbole;


    procedure Tester_Dernier_Symbole is
    begin
        pragma Assert (Dernier_Symbole(8) = '7');
        pragma Assert (Dernier_Symbole(10) = '9');
        pragma Assert (Dernier_Symbole(16) = 'F');
    end Tester_Dernier_Symbole;


    -- Est-ce que le caractère est valide pour la base considérée ?
    function Est_Symbole_Valide (
        Symbole : in Character ;  -- le symbole à tester
        Base : in Integer           -- la base considérée
    ) return Boolean with
        Pre => Est_Base_Valide (Base)
    is
    begin
        if Base <= 10 then
            return '0' <= Symbole and Symbole <= Dernier_Symbole (Base);
        else
            return Est_Symbole_Valide (Symbole, 10)
                    or ('A' <= Symbole and Symbole <= Dernier_Symbole (Base));
        end if;
    end Est_Symbole_Valide;


    procedure Tester_Est_Symbole_Valide is
    begin
        pragma Assert (Est_Symbole_Valide('0', 16));
        pragma Assert (Est_Symbole_Valide('9', 16));
        pragma Assert (Est_Symbole_Valide('F', 16));
        pragma Assert (not Est_Symbole_Valide('G', 16));
        pragma Assert (Est_Symbole_Valide('7', 8));
        pragma Assert (not Est_Symbole_Valide('8', 8));
    end Tester_Est_Symbole_Valide;


    -- Est-ce qu'un caractère est un chiffre ?
    function Est_Chiffre (Un_Caractere : in Character) return Boolean is
    begin
        return '0' <= Un_Caractere and Un_Caractere <= '9';
    end;


    -- La valeur qui correspond à un symbole
    function Valeur (Lettre: Character) return Integer with
        pre => Est_Symbole_Valide (Lettre, Base_MAX)
    is
    begin
        if Est_Chiffre (Lettre) then
            return Character'Pos(Lettre) - Character'Pos('0');
        else
            return 10 + Character'Pos(Lettre) - Character'Pos('A');
        end if;
    end Valeur;


    procedure Tester_Valeur is
    begin
        pragma Assert (Valeur ('0') = 0);
        pragma Assert (Valeur ('1') = 1);
        pragma Assert (Valeur ('A') = 10);
        pragma Assert (Valeur ('5') = 5);
        pragma Assert (Valeur ('F') = 15);
    end;


    -- le symbole qui correspond à un nombre
    function Symbole (Nombre: in Integer) return Character with
        Pre => Nombre >= 0 and Nombre < Base_MAX
    is
    begin
        if Nombre < 10 then
            return Character'Val (Character'Pos ('0') + Nombre);
        else
            return Character'Val (Character'Pos ('A') + Nombre - 10);
        end if;
    end;


    procedure Tester_Symbole is
    begin
        for I in 0..Base_MAX-1 loop
            pragma Assert (Valeur (Symbole (I)) = I);
        end loop;
    end;


    -- Lire un entier au clavier dans la base considérée.
    procedure Lire (
        Nombre: out Integer ;   -- l'entier lu au clavier
        Base: in Integer := 10  -- la base à utiliser
    ) with
        Pre => Est_Base_Valide (Base)
    is
        Caractere_Lu: Character;  -- un caractère lu au clavier
        Nombre_Lu: Integer;       -- le nombre correspondant aux caractères lus
        Fin_De_Ligne: Boolean;     -- Est-ce que la fin de ligne a été trouvée ?
    begin
        Nombre_Lu := 0;

        -- Consulter le caractère suivant
        Look_Ahead (Caractere_Lu, Fin_De_Ligne);

        while not Fin_De_Ligne and then Est_Symbole_Valide (Caractere_Lu, Base) loop
            -- Ajouter à Nombre_Lu le chiffre correspond à Caractere_Lu
            Nombre_Lu := Nombre_Lu * Base + Valeur (Caractere_Lu);

            -- Consommer le caractère traité
            Get (Caractere_Lu);

            -- Consulter le caractère suivant
            Look_Ahead (Caractere_Lu, Fin_De_Ligne);
        end loop;
        Nombre := Nombre_Lu;
    end Lire;


    -- Écrire un entier dans une base donnée.
    procedure Ecrire (
        Nombre: in Integer ;    -- l'entier à écrire
        Base : in Integer       -- la base à utliser
    ) with
        Pre => Est_Base_Valide (Base)
                and Nombre >= 0
    is
    begin
        if Nombre >= Base then
            Ecrire (Nombre / Base, Base);
        else
            null;
        end if;
        Put (Symbole (Nombre mod Base));
    end Ecrire;


    procedure Tester_Tout is
    begin
        Tester_Dernier_Symbole;
        Tester_Est_Symbole_Valide;
        Tester_Valeur;
        Tester_Symbole;
    end Tester_Tout;


    Base_Lecture: Integer;  -- la base de l'entier lu
    Base_Ecriture: Integer; -- la base de l'entier écrit
    Un_Entier: Integer;     -- un entier lu au clavier
begin
    -- Faire les tests
    Tester_Tout;

    -- Demander la base de lecture
    Put ("Base de l'entier lu : ");
    Get (Base_Lecture);
    Skip_Line;

    -- Demander un entier
    Put ("Un entier (base ");
    Put (Base_Lecture, 1);
    Put (") : ");
    Lire (Un_Entier, Base_Lecture);

    -- Afficher l'entier lu en base 10
    Put ("L'entier lu est (base 10) : ");
    Put (Un_Entier, 1);
    New_Line;

    -- Demander la base d'écriture
    Put ("Base pour écrire l'entier : ");
    Get (Base_Ecriture);
    Skip_Line;

    -- Afficher l'entier lu dans la base d'écriture
    Put ("L'entier en base ");
    Put (Base_Ecriture, 1);
    Put (" est ");
    Ecrire (Un_Entier, Base_Ecriture);
    New_Line;

    -- Remarque : on aurait pu utiliser les sous-programme Lire pour lire
    -- les bases et Ecrire pour les écrire en base 10.  Nous utilisons les
    -- Get et Put d'Ada pour faciliter le test du programme.
end Lire_Entier;
