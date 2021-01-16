    
function [theta_Dorth_2,rho_Dorth_2] = estimation_4(x_i, y_i)
    % Estimation Optimisation sous contrainte avec Lagragien
    % Calculer le barycentre  G:
    x_G = mean(x_i);
    y_G = mean(y_i);
    % Centrer les données 
    x_prime = x_i - x_G;
    y_prime = y_i - y_G;
    % Matrice d'inértie:
    C = [x_prime; y_prime];
    C = C';
    % Calcul des Valeurs propre:
    [V, D] = eig(C'*C);
    lambda = diag(D);
    [lambda_min, I_min] = min(lambda);
    % Calcul de Y: Vector propre associé a lambda_min
    Y = V(:, I_min);
    % Calcul de theta et rho
    theta_star = atan2( Y(2), Y(1) ); %arctan(cos(theta)/sin(theta))
    rho_star = x_G*cos(theta_star) + y_G*sin(theta_star);
    if rho_star < 0 
         theta_star = theta_star - pi;
         rho_star = x_G*cos(theta_star) + y_G*sin(theta_star);
    end;
    theta_Dorth_2 = wrapToPi(theta_star);
    rho_Dorth_2 = rho_star;
end