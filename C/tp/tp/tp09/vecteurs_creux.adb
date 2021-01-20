with Ada.Text_IO;                 use Ada.Text_IO;
with Ada.Integer_Text_IO;         use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;           use Ada.Float_Text_IO;
with Ada.Unchecked_Deallocation;

package body Vecteurs_Creux is


	procedure Free is
		new Ada.Unchecked_Deallocation (T_Cellule, T_Vecteur_Creux);


	procedure Initialiser (V : out T_Vecteur_Creux) is
	begin
		V := Null;
	end Initialiser;


	procedure Detruire (V: in out T_Vecteur_Creux) is
	begin
		if V /= Null then
			Detruire (V.all.Suivant);
			Free (V);
		else
			Null;
		end if;
	end Detruire;


	function Est_Nul (V : in T_Vecteur_Creux) return Boolean is
	begin
		if V=Null then
            return True;
        else
            return False;
        end if;
	end Est_Nul;


    function Composante_Recursif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
    begin
    
        if V = Null then
            return(0.0);
        end if;
        
        if V.All.Indice>Indice then
            return(0.0);
        end if;
        
        if Indice = V.All.Indice then 
            return(V.All.Valeur);
        else 
            return(Composante_Recursif(V.all.suivant, Indice));
        end if;
        
    end Composante_Recursif;


    function Composante_Iteratif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
        V1 : T_Vecteur_Creux;
    begin
        if V = Null then
            return(0.0);
        end if;
        
        V1 := V;
        
        while V1.All.Indice<=Indice loop
           if Indice = V1.All.Indice then
               return(V1.All.Valeur);
           else
               V1 := V1.All.Suivant;
           end if;
        end loop;
        
        return(0.0);
    end Composante_Iteratif;


	procedure Modifier (V : in out T_Vecteur_Creux ;
				       Indice : in Integer ;
					   Valeur : in Float ) is
        V1: T_Vecteur_Creux;
    begin
        if V = Null then
            V := New T_Cellule;
            V.All.Indice := Indice;
            V.All.Valeur := Valeur;
            V.All.Suivant := Null;
        elsif Indice<V.All.Indice then
            V1 := New T_Cellule;
            V1.All.Indice := Indice;
            V1.All.Valeur := Valeur;
            V1.All.Suivant := V;
            V := V1;
            --V := New T_Cellule'(Indice, Valeur, V) --Terme de gauche calculer seul PUIS assignation.
        elsif Indice=V.All.Indice then
            if Valeur = 0.0 then
                V1 := V;
                V := V.All.Suivant;
                Free(V1);
            else
                V.All.Valeur := Valeur;
            end if;
        elsif Indice>V.All.Indice then
            Modifier(V.All.Suivant, Indice, Valeur);
        end if;
        
	end Modifier;


	function Sont_Egaux_Recursif (V1, V2 : in T_Vecteur_Creux) return Boolean is
    begin
        if V1 = Null and V2 = Null then
            return True;
        elsif V1 = Null or V2 = Null then
            return False;
        elsif V1.All.Indice = V2.All.Indice and V1.All.Valeur = V2.All.Valeur then
            return Sont_Egaux_Recursif(V1.All.Suivant, V2.All.Suivant);
        else
            return False;
        end if;
	end Sont_Egaux_Recursif;


	function Sont_Egaux_Iteratif (V1, V2 : in T_Vecteur_Creux) return Boolean is
        V1c, V2c : T_Vecteur_Creux;
    begin
        if V1 = Null and V2 = Null then
            return True;
        elsif V1 = Null or V2 = Null then
            return False;
        end if;
        
        V1c := V1;
        V2c := V2;
        
        while (V1c.All.Indice = V2c.All.Indice) and (V1c.All.Valeur = V2c.All.Valeur) loop
            V1c := V1c.All.Suivant;
            V2c := V2c.All.Suivant;
            if V1c = Null and V2c = Null then
                return True;
            elsif V1c = Null or V2c = Null then
                return False;
            end if;
        end loop;
        return False;
	end Sont_Egaux_Iteratif;


	procedure Additionner (V1 : in out T_Vecteur_Creux; V2 : in T_Vecteur_Creux) is
    begin
        -- V1 = V1+V2
        if V2 = Null then
            Null;
        else
            Modifier(V1, V2.All.Indice, Composante_Recursif(V1, V2.All.Indice)+V2.All.Valeur );
            Additionner(V1, V2.All.Suivant);
        end if;
	end Additionner;


	function Norme2 (V : in T_Vecteur_Creux) return Float is
	begin
		if V = Null then
            return 0.0;
        else
            return V.All.Valeur*V.All.Valeur + Norme2(V.All.Suivant);
        end if;
	end Norme2;


	function Produit_Scalaire (V1, V2: in T_Vecteur_Creux) return Float is
	begin
		if V1 = Null or V2 = Null then
            return 0.0;
        elsif V1.All.Indice = V2.All.Indice then 
            return V1.All.Valeur*V2.All.Valeur + Produit_Scalaire(V1.All.Suivant, V2.All.Suivant);
        elsif V1.All.Indice < V2.All.Indice then
            return Produit_Scalaire(V1.All.Suivant, V2);
        elsif V1.All.Indice > V2.All.Indice then
            return Produit_Scalaire(V1, V2.All.Suivant);
        end if;
	end Produit_Scalaire;


	procedure Afficher (V : T_Vecteur_Creux) is
	begin
		if V = Null then
			Put ("--E");
		else
			-- Afficher la composante V.all
			Put ("-->[ ");
			Put (V.all.Indice, 0);
			Put (" | ");
			Put (V.all.Valeur, Fore => 0, Aft => 1, Exp => 0);
			Put (" ]");

			-- Afficher les autres composantes
			Afficher (V.all.Suivant);
		end if;
	end Afficher;


	function Nombre_Composantes_Non_Nulles (V: in T_Vecteur_Creux) return Integer is
	begin
		if V = Null then
			return 0;
		else
			return 1 + Nombre_Composantes_Non_Nulles (V.all.Suivant);
		end if;
	end Nombre_Composantes_Non_Nulles;


end Vecteurs_Creux;
