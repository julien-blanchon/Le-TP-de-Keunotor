with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Lire_Entier is

    -- Lire un entier au clavier.
    -- Paramètres :
    --    Nombre : l'entier à lire
    -- Nécessite : ---
    -- Assure : -- Nombre est l'entier lu
    procedure Lire (Nombre: out Integer) is
        Caractere_Lu: Character;  -- un caractère lu au clavier
        Nombre_Lu: Integer;       -- le nombre correspondant aux caractères lus
            -- Nombre_Lu est important pour ne pas modifer Nombre (le paramètre formel)
            -- tant qu'on n'est pas sûr qu'on a réussi à le produire complètement;
            -- par exemple si une exception se produit en cours de traitement.
        Chiffre: Integer;         -- le chiffre correspondant à caractère
        Fin_De_Ligne: Boolean;     -- Est-ce que la fin de ligne a été trouvée ?
    begin
        Nombre_Lu := 0;

        -- Consulter le caractère suivant
        Look_Ahead (Caractere_Lu, Fin_De_Ligne);

        while not Fin_De_Ligne and then     --! and then car Caractere_Lu n'a de valeur
                                            --! que si Fin_De_Ligne est faux.
            ('0' <= Caractere_Lu and Caractere_Lu <= '9') -- Caractere_Lu est un chiffre
        loop
            -- convertir le caractère en chiffre
            Chiffre := Character'Pos (Caractere_Lu) - Character'Pos ('0');

            -- exploiter ce chiffre pour compléter Nombre_Lu (Horner)
            Nombre_Lu := Nombre_Lu * 10 + Chiffre;

            -- Consommer le caractère traité
            Get (Caractere_Lu);

            -- Consulter le caractère suivant
            Look_Ahead (Caractere_Lu, Fin_De_Ligne);
        end loop;
        Nombre := Nombre_Lu;
    end Lire;


    Un_Entier: Integer;     -- lu au clavier
    Suivant: Character;     -- lu au clavier
begin
    -- Demander un entier
    Put ("Un entier : ");
    Lire (Un_Entier);

    -- Afficher l'entier lu
    Put ("L'entier lu est : ");
    Put (Un_Entier, 1);
    New_Line;

    -- Afficher le caractère suivant
    Get (Suivant);
    Put ("Le caractère suivant est : ");
    Put (Suivant);
    New_Line;

end Lire_Entier;
