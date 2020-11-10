%-------------------------------------------------------------------------%                                                                        %
% Fonction de calcul de la Hessienne du residu de la fonction de         %
% desintegration radioactive du carbone 14                                %
%-------------------------------------------------------------------------%
function H_res = H_residu_C14(beta, donnees)
%
% Paramètres en entrés
% --------------------
% beta : vecteur des paramètres
%         real(p)
% donnees : Données
%           real(n,2)
%
% Paramètres en sortie
% --------------------
% H_res    : Matrice hessienne des résidus
%            real(n,p,p)
%
    n = length(donnees);
    p = length(beta);
    ti = donnees(:, 1);
    Ai = donnees(:, 2);
    A0 = beta(1);
    lambda = beta(2);
    H_res(:, 1, 1) = zeros(n, 1);
    H_res(:, 1, 2) = ti.*exp(-lambda*ti);
    H_res(:, 2, 1) = ti.*exp(-lambda*ti);
    H_res(:, 2, 2) = -A0*ti.*ti.*exp(-lambda*ti);
end