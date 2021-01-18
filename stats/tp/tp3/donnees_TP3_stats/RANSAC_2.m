
function [rho_F_1,theta_F_1] = RANSAC_2(rho,theta,parametres)
    n_donnees = length(rho);
    S1 = parametres(1);
    S2 = parametres(2);
    k_max = parametres(3);
    meilleur_ecart_moy = Inf;
    meilleur_conforme = zeros(n_donnees);
    for i = 1:k_max
        %1. Sous-ensemble de données
        droite_ind = randperm(n_donnees, 2);
        %2. Test relatif des autre données
        [rho_F,theta_F] = estimation_F(rho(droite_ind) ,theta(droite_ind)); %Pts intersection d1 et d2
        ecart = abs(rho - rho_F*cos(theta - theta_F));
        indice_conforme = (ecart <= S1);
        prop_conforme = mean(indice_conforme);
        %3.Accepte si prop sup S2
        if prop_conforme >= S2 
            %4.Nouvelle estimation avec tout les donnee conforme
            [rho_FF,theta_FF] = estimation_F(rho(indice_conforme), theta(indice_conforme));
            ecart_moy = mean(abs(rho - rho_FF*cos(theta - theta_FF)));
            if ecart_moy<meilleur_ecart_moy
                meilleur_ecart_moy = ecart_moy;
                meilleur_conforme = indice_conforme;
                rho_F_1 = rho_FF;
                theta_F_1 = theta_FF;
            end;
        end;
    end;
end