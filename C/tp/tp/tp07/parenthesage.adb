with Piles;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Parenthesage is


    -- L'indice dans la chaîne Meule de l'élément Aiguille.
    -- Si l'Aiguille n'est pas dans la Meule, on retroune Meule'Last + 1.
    Function Index (Meule : in String; Aiguille: Character) return Integer with
        Post => Meule'First <= Index'Result and then Index'Result <= Meule'Last + 1
            and then (Index'Result > Meule'Last or else Meule (Index'Result) = Aiguille)
    is
    begin
        for i in Meule'Range loop
            if Meule(i)=Aiguille then
                return i;
            end if;
        end loop;
        return Meule'Last+1;

    end Index;


    -- Programme de test de Index.
    procedure Tester_Index is
        ABCDEF : constant String := "abcdef";
    begin
        Put(Index (ABCDEF, 'a'));
        Put(Index (ABCDEF, 'c'));
        Put(Index (ABCDEF, 'f'));
        Put(Index (ABCDEF, 'z'));
        Put(Index (ABCDEF (1..3), 'z'));
        Put(Index (ABCDEF (3..5), 'c'));
        Put(Index (ABCDEF (3..5), 'e'));
        Put(Index (ABCDEF (3..5), 'a'));
        Put(Index (ABCDEF (3..5), 'g'));
        pragma Assert (1 = Index (ABCDEF, 'a'));
        pragma Assert (3 = Index (ABCDEF, 'c'));
        pragma Assert (6 = Index (ABCDEF, 'f'));
        pragma Assert (7 = Index (ABCDEF, 'z'));
        pragma Assert (4 = Index (ABCDEF (1..3), 'z'));
        --pragma Assert (3 = Index (ABCDEF (3..5), 'c'));
        pragma Assert (5 = Index (ABCDEF (3..5), 'e'));
        pragma Assert (6 = Index (ABCDEF (3..5), 'a'));
        pragma Assert (6 = Index (ABCDEF (3..5), 'g'));
    end;


    -- Vérifier les bon parenthésage d'une Chaîne (D).  Le sous-programme
    -- indique si le parenthésage est bon ou non (Correct : R) et dans le cas
    -- où il n'est pas correct, l'indice (Indice_Erreur : R) du symbole qui
    -- n'est pas appairé (symbole ouvrant ou fermant).
    --
    -- Exemples
    --   "[({})]"  -> Correct
    --   "]"       -> Non Correct et Indice_Erreur = 1
    --   "((()"    -> Non Correct et Indice_Erreur = 2
    --
    package Pile_Caractere is
        new Piles (Capacite => 100, T_Element => Character);
    use Pile_Caractere;
    package Pile_Integer is
        new Piles (Capacite => 100, T_Element => Integer);
    use Pile_Integer;

    procedure Verifier_Parenthesage (Chaine: in String ; Correct : out Boolean ; Indice_Erreur : out Integer) is
        Ouvrants : Constant String := "([{";
        Fermants : Constant String := ")]}";
        Pile_Ouvrants : Pile_Caractere;
        Pile_Indices : Pile_Integer;
        Compteur : Integer := 0;
    begin
      Initialiser (Pile_Ouvrants);
      Initialiser (Pile_Indices);
      for i in Chaine'Range loop
          Compteur := i;
          if Index(Ouvrants, Chaine(i)) = 4 then
            Pile_Caractere.Empiler(Pile_Ouvrants, Chaine(i));
            Pile_Integer.Empiler(Pile_Indices, i);
          elsif Index(Fermants, Chaine(i)) = 4 then
            Pile_Caractere.Depiler(Pile_Ouvrants);
            Pile_Integer.Depiler(Pile_Indices);
          end if;
      end loop;
      Correct := True;
      Indice_Erreur := -1;
      exception
        when others =>  Correct := False;
                        Indice_Erreur := Compteur;
    end Verifier_Parenthesage;


    -- Programme de test de Verifier_Parenthesage
    procedure Tester_Verifier_Parenthesage is
        Exemple1 : constant String(1..2) :=  "{}";
        Exemple2 : constant String(11..18) :=  "]{[(X)]}";

        Indice : Integer;   -- Résultat de ... XXX
        Correct : Boolean;
    begin
        Verifier_Parenthesage ("(a < b)", Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage ("([{a}])", Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage ("(][{a}])", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 2);

        Verifier_Parenthesage ("]([{a}])", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 1);

        Verifier_Parenthesage ("([{}])}", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 7);

        Verifier_Parenthesage ("([{", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 3);

        Verifier_Parenthesage ("([{}]", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 1);

        Verifier_Parenthesage ("", Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage (Exemple1, Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage (Exemple2, Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 11);

        Verifier_Parenthesage (Exemple2(12..18), Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage (Exemple2(12..15), Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 14);
    end Tester_Verifier_Parenthesage;

begin
    Tester_Index;
    Tester_Verifier_Parenthesage;
end Parenthesage;
