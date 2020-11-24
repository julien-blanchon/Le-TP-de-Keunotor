-- Spécification de structures de données associatives sous forme d'un arbre
-- binaire de recherche (ABR).
with SDA_Exceptions;         use SDA_Exceptions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_DeAllocation;

package body ABR is

	procedure Free is
		new Ada.Unchecked_DeAllocation (Object => T_Noeud, Name => T_ABR);

	-- Initialiser une Sda.  La Sda est vide.
	procedure Initialiser(Sda: out T_ABR) is
	begin
		Sda := Null;
	end Initialiser;

	-- Est-ce qu'une Sda est vide ?
	function Est_Vide (Sda : T_ABR) return Boolean is
	begin
		return Sda = Null;
	end Est_Vide;

	-- Obtenir le nombre d'éléments d'une Sda.
	function Taille (Sda : in T_ABR) return Integer is
	begin
		if Sda=Null then
      -- Cas terminal:
			return 0;
		else
      -- Cas récurcifs:
			return Taille(Sda.All.Sous_Arbre_Droit) + 1 + Taille(Sda.All.Sous_Arbre_Gauche);
		end if;
	end Taille;

	-- Enregistrer une Donnée associée à une Clé dans une Sda.
	-- Si la clé est déjà présente dans la Sda, sa donnée est changée.
	procedure Enregistrer (Sda : in out T_ABR ; Cle : in T_Cle ; Donnee : in T_Donnee) is
	begin
		if Sda=Null then
			-- Cas terminal: La cle n'est pas présente.
			Sda := New T_Noeud'(Cle, Donnee, Null, Null);
		elsif Cle = Sda.All.Cle then
			-- Cas terminal: La cle est présente.
			Sda.All.Donnee := Donnee;
		elsif Cle < Sda.All.Cle then
			-- Cas récurcifs on passe a l'element suivant gauche.
			Enregistrer(Sda.All.Sous_Arbre_Gauche, Cle, Donnee);
    else -- {Cle > Sda.All.Cle}
			-- Cas récurcifs on passe a l'element suivant droit.
			Enregistrer(Sda.All.Sous_Arbre_Droit, Cle, Donnee);
		end if;
	end Enregistrer;

	-- Obtenir la donnée associée à une Cle dans la Sda.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans la Sda
	function La_Donnee (Sda : in T_ABR ; Cle : in T_Cle) return T_Donnee is
	begin
		if Sda = Null then
      raise Cle_Absente_Exception;
    elsif Sda.All.Cle = Cle then
      return Sda.All.Donnee;
    elsif (Cle < Sda.All.Cle) then
      return La_Donnee (Sda.All.Sous_Arbre_Gauche, Cle);
    else
      return La_Donnee (Sda.All.Sous_Arbre_Droit, Cle);
    end if;
	end La_Donnee;

	-- Extrait le plus petit element de l'arbre
	procedure Decrocher_Min (Sda : in out T_ABR; Min : out T_ABR) is
	begin
		if Sda.All.Sous_Arbre_Gauche /= Null then
			Decrocher_Min(Sda.All.Sous_Arbre_Gauche, Min);
		elsif Sda.All.Sous_Arbre_Gauche = Null then
			Min := Sda;
			Sda := Sda.All.Sous_Arbre_Droit;
			Min.All.Sous_Arbre_Droit := Null;
		end if;
	end Decrocher_Min;

	-- Supprimer la Donnée associée à une Clé dans une Sda.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans la Sda
	procedure Supprimer (Sda : in out T_ABR ; Cle : in T_Cle) is
		A_Detruire : T_ABR;
	begin
		if Sda = Null then
			-- Cas terminal: La cle n'est pas présente.
			raise Cle_Absente_Exception;
		elsif Sda.All.Cle = Cle then
			A_Detruire := Sda;
			-- Cas terminal: La cle est présente.
			if Sda.All.Sous_Arbre_Droit = Null and Sda.All.Sous_Arbre_Gauche = Null then
				-- Le dernier elt est une feuille
				Sda := Null;
				Free(Sda);
			elsif Sda.All.Sous_Arbre_Droit = Null then
				-- Que des elt a gauche
				Sda := Sda.All.Sous_Arbre_Gauche;
			elsif Sda.All.Sous_Arbre_Gauche = Null then
				-- Que des elt a droite
				Sda := Sda.All.Sous_Arbre_Droit;
			else
				-- Elt à droite ET à gauche
				declare
					Min : T_ABR;
				begin
					Decrocher_Min (Sda.All.Sous_Arbre_Droit, Min);
					Min.All.Sous_Arbre_Gauche := Sda.All.Sous_Arbre_Gauche;
					Min.All.Sous_Arbre_Droit := Sda.All.Sous_Arbre_Droit;
					Sda := Min;
				end;
			end if;
		elsif Cle < Sda.All.Cle then
			-- La cle ne peut être que à gauche.
			Supprimer(Sda.All.Sous_Arbre_Gauche, Cle);
		else -- {Cle > Sda.All.Cle}
			-- La cle ne peut être que à droite.
			Supprimer(Sda.All.Sous_Arbre_Droit, Cle);
		end if;
		Free(A_Detruire);
	end Supprimer;

	-- Supprimer tous les éléments d'une Sda.
	procedure Vider (Sda : in out T_ABR) is
	begin
		if Sda/=Null then
			Vider(Sda.All.Sous_Arbre_Gauche);
			Vider(Sda.All.Sous_Arbre_Droit);
			Free(Sda);
		end if;
	end Vider;

	-- Effectue la procedure generique Traiter pour chaque couple de la Abr.
	procedure Pour_Chaque (Sda : in T_ABR) is
	begin
		if Sda /= Null then
			Pour_Chaque(Sda.All.Sous_Arbre_Gauche);
			begin
			Traiter(Sda.All.Cle, Sda.All.Donnee);
			exception
				when others => Put_Line("Le traitement a échoué ... on continue");
			end;
			Pour_Chaque(Sda.All.Sous_Arbre_Droit);
		end if;
	end Pour_Chaque;


end ABR;
