-- Auteurs :
-- Equipe  :
-- Mini-projet 1 : Le jeu du devin

with    Ada.Text_Io, Ada.Integer_Text_Io, Ada.Characters.Handling;
use     Ada.Text_Io, Ada.Integer_Text_Io, Ada.Characters.Handling;

-- TODO: à compléter...
procedure Jeu_Devin is

    Min : Integer := 1;
    Max : Integer := 999;
	-- les nombres à trouver sont entre Min et Max

    -- TODO: Mettre le bon commentaire !
    procedure Exercice_1 is	-- Jeu du devin (la machine est maître)
		Solution:Integer;       -- Le nombre que l'utilisateur doit trouver
		Nbr_Essais:Integer:=0;     -- Le nombre d'essai(s) réalisé par l'utilisateur pour trouver la solution
		Proposition:Integer;    -- Le nombre que l'utilisateur donne pour tenter de trouver la solution

	begin
		-- Déterminer le nombre à trouver
		Put("J'ai choisi ");
		Get(Solution);
		Skip_Line;

		-- Faire deviner l'utilisateur
		loop
		    -- Demander un nombre à l'utilisateur
		    Put("Proposez un nombre : ");
		    Get (Proposition);

		    -- Donner une indication à l'utilisateur
		    if Proposition < Solution then
		        Put ("Le nombre proposé est trop petit.");
		    elsif Proposition > Solution then
		        Put ("Le nombre proposé est trop grand.");
		    else
		        Put ("Trouvé !");
		    end if;
		    New_Line;

		   -- Incrémenter le nombre de tentative
		    Nbr_Essais:=Nbr_Essais+1;

		exit when Solution = Proposition;
		end Loop;

		--  Afficher le nombre d'essais
		Put("Bravo ! Vous avez trouvé en  ");
		Put(Nbr_Essais, 0);
		Put(" essai(s).");
		New_Line;
		New_Line;

	end Exercice_1;	-- TODO: à changer

	procedure Exercice_2 is	-- TODO: Donner un nom significatif !
		-- TODO: Déclarer ici les variables nécessaires pour cet exercice
		A_Gagner: Boolean := False;
		A_Tricher: Boolean := False;
		mMin: Integer;
		mMax: Integer;
		Nbr_Essais: Integer := 0;
		Reponse: Character;
		Indication: Character;
		Nombre: Integer;
    begin
    	-- Demander si le Joueur à bien son nombre dans l'intervalle proposé. --
    	loop -- Variant : Reponse --> Fonction des réponse de l'utilisateur.
    		Put("Avez-vous choisi un nombre compris entre ");
    		Put(Min, 0);
    		Put(" et ");
    		Put(Max, 0);
    		Put(" (o/n) ? ");
    		mMin := Min;
    		mMax := Max;
    		Get(Reponse);
    		-- New_Line;
    		if To_Lower(Reponse)/='o' then
    		    Put_Line("J'attends...");
    		else
    		    Null;
    		end if;
    	exit when To_Lower(Reponse)='o';
    	end loop;


    	-- Faire deviner le Nombre à l'Ordinateur
    	loop    -- Variant : Min, Max avec :
    			-- - Min strictement décroissant.
    			-- - Max strictement croissant.
    			-- Sortie du programme si le nombre est trouvés ou si le variant Min-Max atteint zeros.
    			-- La boucle (sauf Indications incorrecte) doit faire un maximum int(log2((Min - Max))) + 1 loop.

    		--Proposer le nombre au centre de l'intervalle des possibles.
    		pragma Assert (mMin<=mMax);
    		Nombre := (mMin+mMax)/2;
    		Put("Je propose ");
    		Put(Nombre, 0);
    		New_Line;

    		-------------------------------------------------------------

    		loop
        		--Demander l'indication du joueur.
        		Put("Votre indice (t/p/g) ? ");
        		Get(Indication);
        		Skip_Line;
        		----------------------------------

        		--Mettre à jour le jeu selon l'indication.
        		case Indication is
        			when 't'|'T'    =>  A_Gagner := True;
        							    Nbr_Essais := Nbr_Essais+1;
        			when 'p'|'P'    =>  mMin := Nombre+1;
        							    Nbr_Essais := Nbr_Essais+1;
        			when 'g'|'G'    =>  mMax := Nombre-1;
        							    Nbr_Essais := Nbr_Essais+1;
        			when others     =>  Put("Je ne comprends pas : ");
        			                    Put(Indication);
        			                    New_Line;
        		end case;

        		if mMin>mMax then
        			A_Tricher := True;
        			Nbr_Essais := Nbr_Essais+1;
        		end if;

        	exit when To_Lower(Indication)='t' or To_Lower(Indication)='p' or To_Lower(Indication)='g';
        	end loop;

    		-------------------------------------------

    	exit when A_Gagner or A_Tricher;
    	end loop;
    	-----------------------------------------

    	--Afficher le bilan de la partie
    	if A_Gagner then
    		Put("J'ai trouvé ");
    		Put(Nombre, 0);
    		Put(" en ");
    		Put(Nbr_Essais, 0);
    		Put(" essai(s).");
    	else
    		Put("Vous trichez.  J'arrête cette partie.");
    	end if;
    	New_Line;
    	New_line;
    	--------------------------------
    end Exercice_2;


    -- TODO: Déclarer ici les variables pour le programme principal
    Choix_Jeux: Character;
    A_Quitter: Boolean := False;

begin
    Put ("Min = ");
	Get (Min);
	Put ("Max = ");
	Get (Max);
	New_Line;

    loop
        -- Afficher le Menu.
        Put_Line("1- L'ordinateur choisit un nombre et vous le devinez");
        Put_Line("2- Vous choisissez un nombre et l'ordinateur le devine");
        Put_Line("0- Quitter");
        --------------------

        -- Demander le choix
        Put("Votre choix : ");
        Get(Choix_Jeux);
        Skip_Line;
        New_Line;
        --------------------

        -- Démarrer (ou non) le mode de jeu correspondant.
        case Choix_Jeux is
            when '0'    =>  A_Quitter:=True;
            when '1'    =>  Exercice_1;
            when '2'    =>  Exercice_2;
            when others =>  Put("Choix incorrect.  Recommencez !");
                            New_Line;
                            New_Line;
        end case;
        ---------------------------------------------------

    exit when A_Quitter;
    end loop;
end Jeu_Devin;
