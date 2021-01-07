
function C_estime = estimation_1(x_donnees_bruitees, y_donnees_bruitees, C_tests, R_0)
    % Estimation Naive de Monte-Carlo
    % Pour toius les C_k, calculer epsilon(Pi)_k.
    % Pour toius les C_k, calculer epsilon(Pi)_k.
    dx = x_donnees_bruitees - C_tests(:, 1);
    dy = y_donnees_bruitees - C_tests(:, 2);
    d = sqrt(dx.^2 + dy.^2);
    epsilon = sum(abs(d - R_0), 2);
    % Trouver l'indice k* du minimum des epsilon(Pi)_k
    [epsilon_star, k_star] = min(epsilon);
    % Retourner C_k
    Ck = C_tests(k_star, :);
    C_estime = Ck;
end