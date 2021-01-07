-- Implémentation d'une structures de données associatives sous forme d'une
-- liste chainée associative (LCA).
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;

-- Package Liste Chainée Associative (LCA)
package body LCA is

	-- Libere la mémoire du pointeurs.
	procedure Free is
		new Ada.Unchecked_Deallocation (Object => T_Cellule, Name => T_LCA);

	-- Initialiser une LCA.	La LCA est vide.
	procedure Initialiser(Sda: out T_LCA) is
	begin
		Sda := Null;
	end Initialiser;

	-- Est-ce qu'une LCA est vide ?
	function Est_Vide (Sda : T_LCA) return Boolean is
	begin
		return Sda = Null;
	end Est_Vide;

	-- Obtenir le nombre d'éléments d'une LCA.
	function Taille (Sda : in T_LCA) return Integer is
	begin
		if Sda=Null then
			return 0;
		else
			return 1+Taille(Sda.All.Suivant);
		end if;
	end Taille;

	-- Enregistrer une Donnée associée à une Clé dans une LCA.
	-- Si la clé est déjà présente dans la LCA, sa donnée est changée.
	procedure Enregistrer (Sda : in out T_LCA ; Cle : in T_Cle ; Donnee : in T_Donnee) is
	begin
		if Sda=Null then
			Sda := New T_Cellule'(Cle, Donnee, Null);
			--Cas terminal: La cle n'est pas présente.
		else
			if Sda.All.Cle=Cle then
				Sda.All.Donnee := Donnee;
				--Cas terminal: La cle est présente.
			else
				Enregistrer(Sda.All.Suivant, Cle, Donnee);
				--Cas récurcifs on passe a l'element suivant.
			end if;
		end if;
	end Enregistrer;

	-- Savoir si une Clé est présente dans une LCA.
	function Cle_Presente (Sda : in T_LCA ; Cle : in T_Cle) return Boolean is
	begin
		if Sda=Null then
			return False;
			--Cas terminal: La cle n'est pas présente.
		else
			if Sda.All.Cle = Cle then
				return True;
				--Cas terminal: La cle est présente.
			else
				return Cle_Presente(Sda.All.Suivant, Cle);
				--Cas récurcifs on passe a l'element suivant.
			end if;
		end if;
	end;

	-- Obtenir la donnée associée à une Cle dans la LCA.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans la LCA.
	function La_Donnee (Sda : in T_LCA ; Cle : in T_Cle) return T_Donnee is
	begin
		if Sda=Null then
			raise Cle_Absente_Exception;
			--Cas terminal: La cle n'est pas présente.
		else
			if Sda.All.Cle = Cle then
				return Sda.All.Donnee;
				--Cas terminal: La cle est présente.
			else
				return La_Donnee(Sda.All.Suivant, Cle);
				--Cas récurcifs on passe a l'element suivant.
			end if;
		end if;
	end La_Donnee;

	-- Supprimer la Donnée associée à une Clé dans une LCA.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans la LCA.
	procedure Supprimer (Sda : in out T_LCA ; Cle : in T_Cle) is
		Sda_copy : T_LCA;
	begin
		if Sda=Null then
			raise Cle_Absente_Exception;
			--Cas terminal: La cle n'est pas présente.
		else
			if Sda.All.Cle = Cle then
				Sda_copy := Sda;
				Sda := Sda.All.Suivant;
				Free(Sda_copy);
				--Cas terminal: La cle est présente.
			else
				Supprimer(Sda.All.Suivant, Cle);
				--Cas récurcifs on passe a l'element suivant.
			end if;
		end if;
	end Supprimer;

	-- Supprimer tous les éléments d'une LCA.
	procedure Vider(Sda : in out T_LCA) is
	begin
		if Sda/=Null then
			Vider(Sda.all.Suivant);
			Free(Sda);
		end if;
	end Vider;

	-- Effectue la procedure generique Traiter pour chaque couple de la LCA.
	procedure Pour_Chaque (Sda : in T_LCA) is
	begin
		if Sda/=Null then
			begin
				Traiter(Sda.All.Cle, Sda.All.Donnee);
				exception
					when others =>  Put_Line("Le traitement a échoué ... on continue");
				end;
			Pour_Chaque(Sda.All.Suivant);
		end if;
	end Pour_Chaque;

end LCA;
