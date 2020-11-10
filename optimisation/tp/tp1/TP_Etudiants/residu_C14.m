%%------------------------------------------------------------------------%                                                                     %
% Fonction de calcul du residu de la fonction de desintegration           %
% radioactive du carbone 14                                               %
%-------------------------------------------------------------------------%
function res = residu_C14(beta, donnees)
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
% res    : vecteur des résidus
%          real(n)
%
    n = length(donnees);
    p = length(beta);
    ti = donnees(:, 1);
    Ai = donnees(:, 2);
    A0 = beta(1);
    lambda = beta(2);
    res = Ai - A0*exp(-lambda*ti);
end