with ada.text_io;			use ada.text_io;
with ada.integer_text_io;	use  ada.integer_text_io;

-- Calculer la somme d'une suite d'entiers lus clavier.  L'entier 0 marque la
-- fin de la sÃ©rie. Il n'en fait pas partie.
-- Si l'utilisateur fait une erreur de saisie le message "Saisie invalide" est
-- affichÃ© (et pas la somme).
procedure Somme_Invalide is 
	Somme  : Integer;   -- la somme de valeurs lues au clavier
	Valeur : Integer;	-- valeur lue au clavier
begin
	-- calculer la somme d'une suite de valeurs entiÃ¨res, se terminant par 0 
	Somme := 0;
	loop
		Put ("Entrez une valeur entiÃ¨re : ");
		Get (Valeur);
		Somme := Somme + Valeur;
	exit when Valeur = 0;
	end loop;

	-- afficher la somme
	Put ("la somme vaut : ");
	Put (Somme, 1);
	New_Line;
exception
	when Data_Error =>
		Put_Line ("Saisie invalide");
end Somme_Invalide;
