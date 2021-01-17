-- Spécification d'une structures de données associatives sous forme d'une
-- table de hashage (TH).
with LCA;
-- Parametres de généricité
generic
	-- 	Type de clé:
	type T_Cle is private;
	-- 	Type de donnée:
	type T_Donnee is private;
	-- 	Capacité maximum de la table de hashage (p):
	Capacite: Integer;
	-- 	Fonction de hashage:
	with function Hashage(Cle : in T_Cle) return Integer;

-- Package Table de Hashage
package TH is

	-- Type Table de Hashage
	type T_TH is limited private;

	-- Initialiser une Th.	La Th est vide.
	procedure Initialiser(Th: out T_TH) with
		Post => Est_Vide (Th);

	-- Est-ce qu'une Th est vide ?
	function Est_Vide (Th : in T_TH) return Boolean;

	-- Obtenir le nombre d'éléments d'une Th.
	function Taille (Th : in T_TH) return Integer with
		Post => Taille'Result >= 0
			and (Taille'Result = 0) = Est_Vide (Th);

	-- Supprimer tous les éléments d'une Th.
	procedure Vider (Th : in out T_TH) with
		Post => Est_Vide (Th);

	-- Enregistrer une Donnée associée à une Clé dans une Th.
	-- Si la clé est déjà présente dans la Th, sa donnée est changée.
	procedure Enregistrer (Th : in out T_TH ; Cle : in T_Cle ; Donnee : in T_Donnee) with
		Post => Cle_Presente (Th, Cle)
		and then (La_Donnee (Th, Cle) = Donnee); -- Donnée ajoutée
			-- and then (if not (Cle_Presente (Th, Cle)'Old) then Taille (Th) = Taille (Th)'Old)
			--and then (if Cle_Presente (Th, Cle)'Old then Taille (Th) = Taille (Th)'Old + 1);

	-- Supprimer la Donnée associée à une Clé dans une Th.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans la Th
	procedure Supprimer (Th : in out T_TH ; Cle : in T_Cle) with
		Post =>  Taille (Th) = Taille (Th)'Old - 1 	-- un élément de moins
			and not Cle_Presente (Th, Cle);         -- la clé a été supprimée

	-- Savoir si une Clé est présente dans une Th.
	function Cle_Presente (Th : in T_TH ; Cle : in T_Cle) return Boolean;

	-- Obtenir la donnée associée à une Cle dans la Th.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans l'Th
	function La_Donnee (Th : in T_TH ; Cle : in T_Cle) return T_Donnee;

	-- Appliquer un traitement (Traiter) pour chaque couple d'une TH.
	generic
		with procedure Traiter (Cle : in T_Cle; Donnee: in T_Donnee);
	procedure Pour_Chaque (Th : in T_TH);

private
	package LCA_Generic is
		new LCA (T_Cle, T_Donnee);
	use LCA_Generic;

	type T_TH is array (1..Capacite) of LCA_Generic.T_LCA;

end TH;
