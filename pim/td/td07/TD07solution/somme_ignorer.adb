with ada.text_io;			use ada.text_io;
with ada.integer_text_io;	use ada.integer_text_io;

-- Calculer la somme d'une suite d'entiers lus clavier.  L'entier 0 marque la
-- fin de la sÃ©rie. Il n'en fait pas partie.
-- En cas d'erreur de saisie, un message est affichÃ© et la saisie est refaite.
procedure Somme_Ignorer is 
	Somme  : Integer;    -- la somme de valeurs lues au clavier
	Valeur : Integer;    -- valeur lue au clavier
begin
	-- calculer la somme d'une suite de valeurs entiÃ¨res, se terminant par 0 
	Somme := 0;
	loop
		begin
			Put ("Entrez une valeur entiÃ¨re : ");
			Get (Valeur);
			Somme := Somme + Valeur;
		exception
			when Data_Error =>
				Put_Line ("Saisie invalide... mais on continue !");
				Skip_Line;
		end;
	exit when Valeur = 0;
	end loop;

	-- afficher la somme
	Put ("la somme vaut : ");
	Put (Somme, 1);
	New_Line;
end Somme_Ignorer;
