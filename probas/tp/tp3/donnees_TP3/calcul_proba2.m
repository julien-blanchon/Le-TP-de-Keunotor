
function [x_min,x_max,probabilite] = calcul_proba2(E_nouveau_repere,p)
    n = length(E_nouveau_repere);
    x_min = min(E_nouveau_repere(:));
    x_max = max(E_nouveau_repere(:));
    N = floor(x_max-x_min);
    probabilite = 1 - binocdf(N, n-1, p);
end