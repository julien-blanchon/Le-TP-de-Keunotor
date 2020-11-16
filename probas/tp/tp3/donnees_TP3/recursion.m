function [E,contour,G_somme] = recursion(E,contour,G_somme,i,j,voisins,G_x,G_y,card_max,cos_alpha)
% Fonction recursive permettant de construire un ensemble candidat E

contour(i,j) = 0;
G_somme_normalise = G_somme/norm(G_somme);
nb_voisins = size(voisins,1);
k = 1;

while k<=nb_voisins & size(E,1)<=card_max
	i_voisin = i+voisins(k, 1);				% A completer
	j_voisin = j+voisins(k, 2);				% A completer
	if contour(i_voisin,j_voisin)
        
		% Dans cette boucle, il vous faut :
		% - Calculer le produit scalaire entre G_somme_normalise et le gradient normalise de I au pixel voisin
        G_voisin = [G_x(i_voisin, j_voisin) G_y(i_voisin, j_voisin)];
        cos_angle = G_somme_normalise*(G_voisin/norm(G_voisin))';
        % - Si ce produit scalaire est superieur a cos_alp1ha :
        if cos_angle>cos_alpha
            %+ Mettre a jour "E" par concatenation
            E = [E; i_voisin j_voisin];
            %	+ Mettre a jour "G_somme"
            G_somme = G_somme+[G_x(i_voisin, j_voisin) G_y(i_voisin, j_voisin)];
            %	+ Lancer l'appel recursif sur le voisin
            [E,contour,G_somme] = recursion(E,contour,G_somme,i_voisin,j_voisin,voisins,G_x,G_y,card_max,cos_alpha);
        end


        
        

		end
    	k = k+1;
	end

end