function L = laplacian2(nu,dx1,dx2,N1,N2)
%
%  Cette fonction construit la matrice de l'opérateur Laplacien 2D anisotrope
%
%  Inputs
%  ------
%
%  nu : nu=[nu1;nu2], coefficients de diffusivité dans les dierctions x1 et x2. 
%
%  dx1 : pas d'espace dans la direction x1.
%
%  dx2 : pas d'espace dans la direction x2.
%
%  N1 : nombre de points de grille dans la direction x1.
%
%  N2 : nombre de points de grilles dans la direction x2.
%
%  Outputs:
%  -------
%
%  L      : Matrice de l'opérateur Laplacien (dimension N1N2 x N1N2)
%
% 

% Initialisation
    b1 = nu(1)/dx1^2;
    b2 = nu(2)/dx2^2;
    a = 2*(b1+b2);
    ONE = ones(N1*N2,1);
    ONE_AL1 = ONE;
    ONE_AL1(2:N2:end) = 0;
    ONE_AL2 = ONE;
    ONE_AL2(1:N2:end) = 0;
    L = full(spdiags([ONE ONE_AL1 ONE ONE_AL2 ONE].*[-b1 -b2 a -b2 -b1], [-N2, -1, 0, 1, N2], N1*N2, N1*N2));
end