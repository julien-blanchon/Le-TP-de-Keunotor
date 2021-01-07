-- Implémentation d'une structures de données associatives sous forme d'une
-- table de hashage (TH).

-- Package Table de Hashage
package body TH is

	-- Initialiser une Th.	La Th est vide.
	procedure Initialiser(Th: out T_TH) is
	begin
		for i in 1..Capacite loop
			Initialiser(Th(i)); --! Surcharge de Initialiser avec T_LCA
		end loop;
	end Initialiser;

	-- Est-ce qu'une Th est vide ?
	function Est_Vide (Th : T_TH) return Boolean is
	begin
		for i in 1..Capacite loop
			if not( Est_Vide(Th(i)) ) then
				return False;
			end if;
		end loop;
		return True;
	end;

	-- Obtenir le nombre d'éléments d'une Th.
	function Taille (Th : in T_TH) return Integer is
		Compteur : Integer := 0;
	begin
		for i in 1..Capacite loop
			Compteur := Compteur+Taille(Th(i));
		end loop;
		return Compteur;
	end Taille;

	-- Enregistrer une Donnée associée à une Clé dans une Th.
	-- Si la clé est déjà présente dans la Th, sa donnée est changée.
	procedure Enregistrer (Th : in out T_TH ; Cle : in T_Cle ; Donnee : in T_Donnee) is
	begin
		Enregistrer(Th(Hashage(Cle)), Cle, Donnee);
	end Enregistrer;

	-- Savoir si une Clé est présente dans une Th.
	function Cle_Presente (Th : in T_TH ; Cle : in T_Cle) return Boolean is
	begin
		return Cle_Presente(Th(Hashage(Cle)), Cle);
	end Cle_Presente;

	-- Obtenir la donnée associée à une Cle dans la Th.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans la Th.
	function La_Donnee (Th : in T_TH ; Cle : in T_Cle) return T_Donnee is
	begin
		return La_Donnee(Th(Hashage(Cle)), Cle);
	end La_Donnee;

	-- Supprimer la Donnée associée à une Clé dans une Th.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans la Th.
	procedure Supprimer (Th : in out T_TH ; Cle : in T_Cle) is
	begin
		Supprimer(Th(Hashage(Cle)), Cle);
	end Supprimer;

	-- Supprimer tous les éléments d'une Th.
	procedure Vider(Th : in out T_TH) is
	begin
		for i in 1..Capacite loop
			Vider(Th(i));
		end loop;
	end Vider;

	-- Effectue la procedure generique Traiter pour chaque couple de la Table de Hashage
	procedure Pour_Chaque (Th : in T_TH) is
		procedure Pour_Chaque_LCA is
			new LCA_Generic.Pour_Chaque(Traiter);
	begin
		for i in 1..Capacite loop
			Pour_Chaque_LCA(Th(i));
		end loop;
	end Pour_Chaque;

end TH;
