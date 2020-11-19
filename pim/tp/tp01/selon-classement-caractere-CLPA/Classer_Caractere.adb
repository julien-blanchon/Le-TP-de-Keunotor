with Ada.Text_IO;          use Ada.Text_IO;

-- afficher la classe à laquelle appartient un caractère lu au clavier
procedure Classer_Caractere is

    -- Constantes pour définir la classe des caractères
    --   Remarque : Dans la suite du cours nous verrons une meilleure
    --   façon de faire que de définir ces constantes.  Laquelle ?
    Chiffre     : constant Character := 'C';
    Lettre      : constant Character := 'L';
    Ponctuation : constant Character := 'P';
    Autre       : constant Character := 'A';

    C : Character;      -- le caractère à classer
    Classe: Character;  -- la classe du caractère C
begin
    -- Demander le caractère
    Get (C);

    -- Déterminer la classe du caractère c
    case C is
        when '0'..'9' =>
            Classe := Chiffre;

        when 'A'..'Z' | 'a'..'z' =>
            Classe := Lettre;

        when '!' | '?' | '.' | ',' | ';' =>
            Classe := Ponctuation;

        when others =>
            Classe := Autre;

    end case;

    -- Afficher la classe du caractère
    Put (Classe);

end Classer_Caractere;
