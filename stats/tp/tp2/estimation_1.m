
function [a_star, b_star] = estimation_1(x_i, y_i, n_tests)
    % Estimation Naive de Monte-Carlo
    % Calculer le barycentre  G:
    x_G = mean(x_i);
    y_G = mean(y_i);
    % Centrer les données 
    x_prime = x_i - x_G;
    y_prime = y_i - y_G;
    % Echantilonner Psi dans -pi/2; +pi/2
    psi = pi*rand(n_tests, 1) - pi/2;
    % Recherche du tirage minimum (Monte Carlo)
    n_pts = length(x_prime);
    x_rep = repmat(x_prime, n_tests, 1);
    y_rep = repmat(y_prime, n_tests, 1);
    psi_rep = repmat(psi, 1, n_pts);
    epsilon_j = (y_rep - tan(psi_rep).*x_rep).^2;
    epsilon = sum(epsilon_j, 2);
    [epsilon_star, k_star] = min(epsilon);
    % 
    a_star = tan(psi(k_star));
    b_star = y_G-a_star*x_G;
end