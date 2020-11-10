%-------------------------------------------------------------------------%
% Fonction de calcul de la Hessienne des moindres carres de la fonction   %
% de desintegration radioactive du carbone 14                             %
% (residu et J_residu sont des fonctions en entree)                       %
%-------------------------------------------------------------------------%

function [H_f, res, J_res] = Hess_f_C14_bis(beta, donnees, residu, J_residu, H_residu)
%
% Paramètres en entrés
% --------------------
% beta     : vecteur des paramètres
%            real(p)
% donnees  : Données
%            real(n,2)
% residu   : fonction qui code les résidus
%            res = residus(beta)
% J_residu : fonction qui code la matrice jacobienne
%            J_res = J_residu(beta);
% H_residu : fonction qui code la matrice hessienne (ou plutôt derivée Jacobienne de Jacobienne)
%            H_res = H_residu(beta);
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
    res = residu(beta, donnees);
    J_res = J_residu(beta, donnees);
    H_res = H_residu(beta, donnees);
    K(:, :) = [res'*H_res(:,:,1); res'*H_res(:,:,2)];
    H_f = K + J_res'*J_res;
    %H_f = H_res'*res + J_res'*J_res;
end