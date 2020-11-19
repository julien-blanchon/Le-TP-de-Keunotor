with Ada.Text_IO;          use Ada.Text_IO;

-- Demander confirmation par 'o' ou 'n'.
procedure Demander_Confirmation is
    Reponse: Character; -- le réponse de l'utilisateur
    Question: constant String := "Confirmation (o/n) ? ";
    Consigne: constant String := "Merci de répondre par 'o' (oui) ou 'n' (non).";

    Saisie_OK: Boolean; -- Est-ce que l'utilisateur a répondu correctement ?
        -- pour la version Répéter seulement

    Avec_TantQue: constant Boolean := True;
    Avec_Repeter: constant Boolean := True;
begin
    if Avec_TantQue then
        -- Dans cette version on duplique des instructions : demander confirmation

        -- Demander de confirmer
        Put (Question);
        Get (Reponse);

        while reponse /= 'o' and reponse /= 'n' loop
            -- Rappeler la consigne
            Put_Line (consigne);

            -- Demander de confirmer
            Put (Question);
            Get (Reponse);
        end loop;

    else -- avec un Répéter

        if Avec_Repeter then

            -- Dans cette version on duplique la condition.  Pour éviter de la calculer
            -- plusieurs fois, on ajoute une variable booléenne Saisie_OK.

            loop
                -- Demander de confirmer
                Put (Question);
                Get (Reponse);

                Saisie_OK := reponse = 'o' or reponse = 'n';
                if not Saisie_OK then
                    -- Rappeler la consigne
                    Put (consigne);
                else
                    Null;
                end if;

            exit when Saisie_OK;
            end loop;

        else    -- version plus Ada...

            -- mettre le when exit plus haut évite de publiquer la condition...

            loop
                -- Demander de confirmer
                Put (Question);
                Get (Reponse);

            exit when reponse = 'o' or reponse = 'n';

                -- Rappeler la consigne
                Put (consigne);

            end loop;

        end if;

    end if;

    -- Afficher la réponse
    Put (Reponse);
end Demander_Confirmation;
