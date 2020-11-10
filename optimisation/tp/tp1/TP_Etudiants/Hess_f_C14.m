%-------------------------------------------------------------------------%
% Fonction de calcul de la Hessienne des moindres carres de la fonction   %
% de desintegration radioactive du carbone 14                             %
% (residu et J_residu sont des fonctions en entree)                       %
%-------------------------------------------------------------------------%

function [H_f, res, J_res] = Hess_f_C14(beta, donnees, residu, J_residu)
%
% Paramètres en entrés
% --------------------
% beta     : vecteur des paramètres
%            real(p)
% donnees  : Données
%            real(n,2)
% residu   : fonction qui code les résidus
%            res_beta = residus(beta)
% J_residu : fonction qui code la matrice jacobienne
%            J_res_beta = J_residu(beta);
%
% Paramètres en sortie
% --------------------
% H_f      : Matrice hessienne
%            real(p,p)
% res      : vecteur des résidus
%            real(n)
% J_res    : Matrice jacobienne des résiduis
%            real(n,p)
%
    n = length(donnees);
    p = length(beta);
    ti = donnees(:, 1);
    Ai = donnees(:, 2);
    A0 = beta(1);
    lambda = beta(2);
    res = residu(beta);
    J_res = J_residu(beta);
    H_f(1, 1) = sum( (-exp(-lambda*ti)).*(-exp(-lambda*ti)) ); %lambda*lambda
    H_f(1, 2) = sum( (ti.*exp(-lambda*ti).*(Ai - A0*exp(-lambda*ti))) + (-exp(-lambda*ti).*(A0*ti.*exp(-lambda*ti))) ); %lambda*A0
    H_f(2, 1) = H_f(1, 2); %A0*lambda
    H_f(2, 2) = sum( (-A0*ti.*ti.*exp(-lambda*ti)).*(Ai - A0*exp(-lambda*ti)) + (A0*ti.*exp(-lambda*ti)).*(A0*ti.*exp(-lambda*ti)) ); %A0*A0
end