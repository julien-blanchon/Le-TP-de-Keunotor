-- Évalue la qualité du générateur pseudo-aléatoire en déterminant la plus petite
-- et la plus grande fréquence. Le module utilise une Table de Hashage.
with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with Ada.Command_Line;     use Ada.Command_Line;
with Alea;
with LCA;

-- Évaluer la qualité du générateur aléatoire avec LCA.
procedure Evaluer_Alea_LCA is

	-- Afficher l'usage.
	procedure Afficher_Usage is
	begin
		New_Line;
		Put_Line ("Usage : " & Command_Name & " Borne Taille");
		New_Line;
		Put_Line ("   Borne  : les nombres sont tirés dans l'intervalle 1..Borne");
		Put_Line ("   Taille : la taille de l'échantillon");
		New_Line;
	end Afficher_Usage;

	-- Afficher le Nom et la Valeur d'une variable.
	-- La Valeur est affichée sur la Largeur_Valeur précisée.
	procedure Afficher_Variable (Nom: String; Valeur: in Integer; Largeur_Valeur: in Integer := 1) is
	begin
		Put (Nom);
		Put (" : ");
		Put (Valeur, Largeur_Valeur);
		New_Line;
	end Afficher_Variable;

	-- Évaluer la qualité du générateur de nombre aléatoire Alea sur un
	-- intervalle donné en calculant les fréquences absolues minimales et
	-- maximales des entiers obtenus lors de plusieurs tirages aléatoires.
	procedure Calculer_Statistiques (
		Borne    : in Integer;  -- le nombre aléatoire est dans 1..Borne
		Taille   : in Integer;  -- nombre de tirages (taille de l'échantillon)
		Min, Max : out Integer  -- fréquence minimale et maximale
	) with
		Pre => Borne > 1 and Taille > 1,
		Post => 0 <= Min and Min <= Taille
			and 0 <= Max and Max <= Taille
			and Min + Max <= Taille
	is
		-- Instanciation de Mon_Alea - Générateur Pseudo-Aléatoire
		package Mon_Alea is
			new Alea (1, Borne);
		use Mon_Alea;

		-- Instanciation du type TH_Integer_Integer
		package LCA_Integer_Integer is
			new LCA (T_Cle => Integer, T_Donnee => Integer);
		use LCA_Integer_Integer;

		-- Procedure Determiner_MinMax pour un element
		procedure Determiner_MinMax(S : in Integer; N: in Integer) is
		begin
			if Min = -1 or Max = -1 then -- Cas Initial
				Min := N;
				Max := N;
			elsif N<Min then -- Cas General plus petit
					Min := N ;
			elsif N>Max then -- Cas General plus grand
					Max := N;
			end if;
		end Determiner_MinMax;
		--* Oui j'utilise Min et Max qui sont externe à la procedure Determiner_MinMax.
		--* Cependant il me parait important d'utiliser la procedure Pour_Chaque
		--* pour rendre le calcul plus rapide.
		--* Pour faire cela proprement il faudrais donc rajouter une nouvelle Procedure
		--* Dans LCA qui soit suffisament flexible pour permettre se genre de traitement.

		-- Instanciation générique de la procedure Determiner_MinMax_Pour_Chaque
		procedure Determiner_MinMax_Pour_Chaque is
			new Pour_Chaque (Determiner_MinMax);

		Nombre : Integer;
		Ma_LCA : T_LCA;
	begin
		-- Initialiser
		Initialiser(Ma_LCA);
		-- Remplir la LCA avec les fréquences
		for I in 1..Taille loop
			Get_Random_Number(Nombre);
			if Cle_Presente(Ma_LCA, Nombre) then
				Enregistrer(Ma_LCA, Nombre, La_Donnee(Ma_LCA, Nombre)+1);
			else
				Enregistrer(Ma_LCA, Nombre, 1);
			end if;
		end loop;
		-- Calcul des fréquences minimale et maximale
		Min := -1;
		Max := -1;
		Determiner_MinMax_Pour_Chaque(Ma_LCA);
		Vider(Ma_LCA);
	end Calculer_Statistiques;

	Min, Max: Integer; -- fréquence minimale et maximale d'un échantillon
	Borne: Integer;    -- les nombres aléatoire sont tirés dans 1..Borne
	Taille: Integer;   -- nombre de tirages aléatoires
begin
	if Argument_Count /= 2 then
		Afficher_Usage;
	else
		-- Récupérer les arguments de la ligne de commande
		Borne := Integer'Value (Argument (1));
		Taille := Integer'Value (Argument (2));

		-- Afficher les valeur de Borne et Taille
		Afficher_Variable ("Borne ", Borne);
		Afficher_Variable ("Taille", Taille);

		Calculer_Statistiques (Borne, Taille, Min, Max);

		-- Afficher les fréquence Min et Max
		Afficher_Variable ("Min", Min);
		Afficher_Variable ("Max", Max);
	end if;
	exception -- Robustesse, on affiche juste "Erreur ..." puis l'usage voulu.
		when others =>  Put_Line("Erreur ...");
										New_Line;
										Afficher_Usage;
end Evaluer_Alea_LCA;
