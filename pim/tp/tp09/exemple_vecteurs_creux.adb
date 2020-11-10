with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Vecteurs_Creux;    use Vecteurs_Creux;

-- Exemple d'utilisation des vecteurs creux.
procedure Exemple_Vecteurs_Creux is 

	V : T_Vecteur_Creux;
    V2: T_Vecteur_Creux;
    V3: T_Vecteur_Creux;
	Epsilon: constant Float := 1.0e-5;
begin
	Put_Line ("Début du scénario");
    
    --1: Initialiser un vecteur creux.
    Put("1: Initialiser un vecteur creux.");
    New_Line;
    Initialiser (V);
    Afficher (V);
    New_Line;
    
    --2: Déterminer si un vecteur est nul.
    Put("2: Déterminer si un vecteur est nul.");
    New_Line;
    pragma Assert (Est_Nul(V));
    New_Line;
    
    --3: Détruire un vecteur creux.
    Put("3: Détruire un vecteur creux.");
    New_Line;
    Detruire (V);
    New_Line;
    
    --4: Obtenir une composante de V.
    Put("4: Obtenir une composante de V.");
    New_Line;
    Initialiser (V);
    Afficher (V);
    pragma Assert (Composante_Recursif(V, 18) = 0.0);
    pragma Assert (Composante_Iteratif(V, 18) = 0.0);
    New_Line;
    
    --5: Modifier une composante d’un vecteur creux.
    Put("5: Modifier une composante d’un vecteur creux.");
    New_Line;
    --! V est vide.
    Modifier (V, 3, 3.0);
    Afficher (V);
    pragma Assert (Composante_Recursif(V, 3) = 3.0);
    New_Line;
    --! Indice Inférieur
    Modifier (V, 1, 10.0);
    Afficher (V);
    pragma Assert (Composante_Recursif(V, 1) = 10.0);
    New_Line;
    --! Indice Existant 0.0
    Modifier (V, 1, 0.0);
    Afficher (V);
    pragma Assert (Composante_Recursif(V, 1) = 0.0);
    New_Line;
    --! Indice Existant Valeur
    Modifier (V, 3, 12.0);
    Afficher (V);
    pragma Assert (Composante_Recursif(V, 3) = 12.0);
    New_Line;
    --! Indice Superieur
    Modifier (V, 10, 42.0);
    Afficher (V);
    pragma Assert (Composante_Recursif(V, 10) = 42.0);
    New_Line;
    
    --6: Déterminer si deux vecteurs creux sont égaux.
    Put("6: Déterminer si deux vecteurs creux sont égaux.");
    New_Line;
    Initialiser (V2);
    Modifier (V2, 3, 12.0);
    Modifier (V2, 10, 42.0);
    pragma Assert (Sont_Egaux_Recursif (V, V2));
    pragma Assert (Sont_Egaux_Iteratif (V, V2));
    Initialiser (V3);
    Modifier (V3, 3, 10.0);
    Modifier (V3, 10, 42.0);
    pragma Assert ( not (Sont_Egaux_Recursif (V, V3)));
    Initialiser (V3);
    Modifier (V3, 6, 1.0);
    Modifier (V3, 10, 42.0);
    pragma Assert ( not (Sont_Egaux_Recursif (V, V3)));
    
    --7: Additionner à un vecteur un autre vecteur.
    Put("7: Additionner à un vecteur un autre vecteur.");
    New_Line;
    Afficher(V2);
    New_Line;
    Afficher(V3);
    New_Line;
    Additionner (V2, V3);
    Afficher(V2);
    New_Line;
    pragma Assert (Composante_Recursif(V2, 10) = 84.0);
    
    --8: Calculer le carré de la norme d’un vecteur creux.
    Put("8: Calculer le carré de la norme d’un vecteur creux.");
    New_Line;
    Afficher(V2);
    New_Line;
    Put(Norme2(V2));
    pragma Assert (Norme2(V2) = 7201.0);
    Initialiser (V);
    pragma Assert (Norme2(V) = 0.0);
    New_Line;
    
    --9: Calculer le produit scalaire de deux vecteurs.
    Put("9: Calculer le produit scalaire de deux vecteurs.");
    New_Line;
    Afficher(V);
    New_Line;
    Afficher(V2);
    New_Line;
    Afficher(V3);
    New_Line;
    Put(Produit_Scalaire(V2, V3));
    pragma Assert (Produit_Scalaire(V2, V3) = 3529.0);
    New_Line;
    
	Put_Line ("Fin du scénario");
end Exemple_Vecteurs_Creux;
