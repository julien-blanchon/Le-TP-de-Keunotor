with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Ecrire_Entier is

    -- Écrire un entier.
    -- Paramètres :
    --    Nombre : l'entier à écrire
    -- Nécessite : Nombre >= 0  -- Nombre positif
    -- Assure : -- Nombre est écrit
    procedure Ecrire_Recursif (Nombre: in Integer) is
        Unite: Integer;        -- le chiffre des unités de Nombre
        Caractere: Character;  -- le caractère correspondant à unité
    begin
        if Nombre < 10 then
            Caractere := Character'Val (Character'Pos('0') + Nombre);
            Put (Caractere);
        else
            Ecrire_Recursif (Nombre / 10);
            Unite := Nombre mod 10;
            Caractere := Character'Val (Character'Pos('0') + Unite);
            Put (Caractere);
        end if;
        -- Remarque : on pourrait factoriser l'écriture du chiffre car dans le
        -- Si on a Nombre mod 10 = Nombre (car Nombre < 10).
    end Ecrire_Recursif;


    -- Écrire un entier.
    -- Paramètres :
    --    Nombre : l'entier à écrire
    -- Nécessite : Nombre >= 0  -- Nombre positif
    -- Assure : -- Nombre est écrit
    procedure Ecrire_Iteratif (Nombre: in Integer) is
        Chiffre: Integer;           -- un chiffre de Nombre
        Caractere: Character;       -- le caractère correspondant à chiffre
        Puissance: Integer;         -- une puissance de 10
        Nombre_Chiffres: Integer;   -- Nombre de chiffres du nombre
        Copie_Nombre: Integer;      -- Une copie de Nombre (car Nombre est en in)
    begin
        -- déterminer la plus grande puissance de 10 inférieure à Nombre et le nombre de chiffre de Nombre
        Puissance := 1;
        Nombre_Chiffres := 1;
        while Puissance <= Nombre / 10 loop
            Puissance := Puissance * 10;
            Nombre_Chiffres := Nombre_Chiffres + 1;
        end loop;

        -- Afficher les chiffres de Nombre
        Copie_Nombre := Nombre;     --! car Nombre est en in : on ne peut pas le modifier
        for I in 1..Nombre_Chiffres loop
            -- Afficher le Ième chiffre significatif de Nombre
            --   Déterminer le chiffre significatif
            Chiffre := Copie_Nombre / Puissance;

            --   Obtenir le caractère correspondant
            Caractere := Character'VAL (Character'POS ('0') + Chiffre);

            --   Afficher ce caractère
            Put (Caractere);

            --   Supprimer le chiffre significatif
            Copie_Nombre := Copie_Nombre mod Puissance;

            --   Passer à la puissance suivante
            Puissance := Puissance / 10;
        end loop;
    end Ecrire_Iteratif;


    -- Écrire un entier.
    -- Paramètres :
    --    Nombre : l'entier à écrire
    -- Nécessite : ---
    -- Assure : -- Nombre est écrit
    procedure Ecrire (Nombre: in Integer) is
    begin
        if Nombre < 0 then
            Put ('-');
            if Nombre < -9 then
                Ecrire_Recursif (- Nombre / 10);
            end if;
            Ecrire_Recursif (- (Nombre rem 10));
        else
            Ecrire_Recursif (Nombre);
        end if;
    end Ecrire;


    Un_Entier: Integer;     -- un entier lu au clavier
    Message: constant String := "L'entier lu est ";
begin
    -- Demander un entier
    Put ("Un entier : ");
    Get (Un_Entier);

    -- Afficher l'entier lu avec les différents sous-programmes
    if Un_Entier >= 0 then
        -- L'afficher avec Ecrire_Recursif
        Put (Message & "(Ecrire_Recursif) : ");
        Ecrire_Recursif (Un_Entier);
        New_Line;

        -- L'afficher avec Ecrire_Iteratif
        Put (Message & "(Ecrire_Iteratif) : ");
        Ecrire_Iteratif (Un_Entier);
        New_Line;
    else
        Put_Line ("Le nombre est négatif. "
            & "On ne peut utiliser ni Ecrire_Recursif ni Ecrire_Iteratif.");
    end if;
    --  L'afficher avec Ecrire
    Put (Message & "(Ecrire) : ");
    Ecrire (Un_Entier);
    New_Line;
end Ecrire_Entier;
