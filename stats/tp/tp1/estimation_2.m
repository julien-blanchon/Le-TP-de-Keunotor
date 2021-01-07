function [C_estime, R_estime] = estimation_2(x_donnees_bruitees,y_donnees_bruitees,C_tests,R_tests)
    % G centre de gravité des pts
    %G = [mean(x_donnees_bruitees), mean(y_donnees_bruitees)];
    % Distance G aux pts
    %dG_xy = sqrt((x_donnees_bruitees - G(1)).^2 + (y_donnees_bruitees - G(2)).^2);
    % R moyen
    %R = mean(dG_xy);
    % Pour toius les C_k, calculer epsilon(Pi)_k.
    dx = x_donnees_bruitees - C_tests(:, 1);
    dy = y_donnees_bruitees - C_tests(:, 2);
    d = sqrt(dx.^2 + dy.^2);
    epsilon = sum(abs(d - R_tests), 2);
    % Trouver l'indice k* du minimum des epsilon(Pi)_k
    [epsilon_star, k_star] = min(epsilon);
    % Retourner C_k
    Ck = C_tests(k_star, :);
    Rk = R_tests(k_star, :);
    C_estime = Ck;
    R_estime = Rk;
end