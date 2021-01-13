    
function [theta_Dorth_1,rho_Dorth_1] = estimation_3(x_i, y_i, n_tests);
    % Estimation Naive de Monte-Carlo
    %Calculer le barycentre  G:
    x_G = mean(x_i);
    y_G = mean(y_i);
    %Centrer les données 
    x_prime = x_i - x_G;
    y_prime = y_i - y_G;
    % Echantilonner Theta dans 0; +pi
    theta = pi*rand(n_tests, 1);
    % Recherche du tirage minimum (Monte Carlo)
    n_pts = length(x_prime);
    x_rep = repmat(x_prime, n_tests, 1);
    y_rep = repmat(y_prime, n_tests, 1);
    theta_rep = repmat(theta, 1, n_pts);

    epsilon_j = ( x_rep.*cos(theta_rep) + y_rep.*sin(theta_rep) ).^2;
    epsilon = sum(epsilon_j, 2);
    [epsilon_star, k_star] = min(epsilon);
    theta_star = theta(k_star);
    rho_star = x_G*cos(theta_star)+y_G*sin(theta_star);
    if rho_star < 0 
         theta_star = theta_star - pi;
         rho_star = x_G*cos(theta_star)+y_G*sin(theta_star);
    end;
    theta_Dorth_1 = theta_star
    rho_Dorth_1 = rho_star
end