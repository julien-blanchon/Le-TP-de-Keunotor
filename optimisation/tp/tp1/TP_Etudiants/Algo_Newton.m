function [beta, norm_grad_f_beta, f_beta, norm_delta, nb_it, exitflag] ...
          = Algo_Newton(Hess_f_C14, beta0, option)
%************************************************************
% Fichier  ~gergaud/ENS/Optim1a/TP-optim-20-21/Newton_ref.m *
% Novembre 2020                                             *
% Université de Toulouse, INP-ENSEEIHT                      *
%************************************************************
%
% Newton résout par l'algorithme de Newton les problemes aux moindres carres
% Min 0.5||r(beta)||^2
% beta \in R^p
%
% Parametres en entrees
% --------------------
% Hess_f_C14 : fonction qui code la hessiennne de f
%              Hess_f_C14 : R^p --> matrice (p,p)
%              (la fonction retourne aussi le residu et la jacobienne)
% beta0  : point de dÃ©part
%          real(p)
% option(1) : Tol_abs, tolÃ©rance absolue
%             real
% option(2) : Tol_rel, tolÃ©rance relative
%             real
% option(3) : nitimax, nombre d'itÃ©rations maximum
%             integer
%
% Parametres en sortie
% --------------------
% beta      : beta
%             real(p)
% norm_gradf_beta : ||gradient f(beta)||
%                   real
% f_beta    : f(beta)
%             real
% res       : r(beta)
%             real(n)
% norm_delta : ||delta||
%              real
% nbit       : nombre d'itÃ©rations
%              integer
% exitflag   : indicateur de sortie
%              integer entre 1 et 4
% exitflag = 1 : ||gradient f(beta)|| < max(Tol_rel||gradient f(beta0)||,Tol_abs)
% exitflag = 2 : |f(beta^{k+1})-f(beta^k)| < max(Tol_rel|f(beta^k)|,Tol_abs)
% exitflag = 3 : ||delta)|| < max(Tol_rel delta^k),Tol_abs)
% exitflag = 4 : nombre maximum d'itÃ©rations atteint
%      
% ---------------------------------------------------------------------------------

    %Initialisation:
    beta = beta0;
    [Hf_beta, r_beta, Jr_beta] = Hess_f_C14(beta);
    
    norm_grad_f_beta0 = norm(Jr_beta'*r_beta, 2);
    f_beta = 0.5*r_beta'*r_beta;
    
    nb_it = 0;
    exitflag = 0;
    Tol_abs = option(1);
    Tol_rel = option(2);
    n_itmax = option(3);
    
    %Corps:
    while exitflag==0
        beta_old = beta;
        f_beta_old = f_beta;
        
        b = Jr_beta'*r_beta;
        A = Hf_beta;
        
        beta = beta - A\b; %MLDivide
        
        [Hf_beta, r_beta, Jr_beta] = Hess_f_C14(beta);
        f_beta = 0.5*r_beta'*r_beta;
        
        nb_it = nb_it + 1;
        
        if norm(Jr_beta'*r_beta, 2) <= max(Tol_rel*norm_grad_f_beta0, Tol_abs)
            exitflag = 1;
        elseif abs(f_beta - f_beta_old) <= max(Tol_rel*abs(f_beta_old), Tol_abs)
            exitflag = 2;
        elseif norm(beta - beta_old) <= max(Tol_rel*norm(beta_old, 2), Tol_abs)
            exitflag = 3;
        elseif nb_it == n_itmax
            exitflag = 4;
        end
    end
    
    norm_grad_f_beta = norm(Jr_beta'*r_beta, 2);
    norm_delta = norm(beta-beta_old, 2);
    
end