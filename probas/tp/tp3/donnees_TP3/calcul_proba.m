
function [x_min,x_max,probabilite] = calcul_proba(E_nouveau_repere,p)
    x_min = min(E_nouveau_repere(:, 1));
    x_max = max(E_nouveau_repere(:, 1));
    y_min = min(E_nouveau_repere(:, 2));
    y_max = max(E_nouveau_repere(:, 2));
    l = abs(x_max - x_min);
    h = abs(y_max - y_min);
    N = floor(l*h);
    n = length(E_nouveau_repere);
    probabilite = 1 - binocdf(N, n-1, p);
end