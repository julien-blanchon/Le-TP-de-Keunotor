%-------------------------------------------------------------------------%                                                                        %
% Fonction de calcul de la Jacobienne du residu de la fonction de         %
% desintegration radioactive du carbone 14                                %
%-------------------------------------------------------------------------%
function J_res = J_residu_C14(beta, donnees)
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
% J_res    : Matrice jacobienne des résidus
%            real(n,p)
%
    n = length(donnees);
    p = length(beta);
    ti = donnees(:, 1);
    Ai = donnees(:, 2);
    A0 = beta(1);
    lambda = beta(2);
    J_res(:, 1) = -exp(-lambda*ti);
    J_res(:, 2) = A0*ti.*exp(-lambda*ti);
end