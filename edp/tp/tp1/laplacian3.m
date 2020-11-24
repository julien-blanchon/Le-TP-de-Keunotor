function L = laplacian3(nu,dx1,dx2,N1,N2)
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

B1 = spdiags(ones(N1,1)*[-1, 2, -1], [-1, 0, 1], N1, N1)/dx1^2;
C1 = spdiags(ones(N2,1)*[1], [0], N2, N2);
B2 = spdiags(ones(N1,1)*[1], [0], N1, N1)/dx2^2;
C2 = spdiags(ones(N2,1)*[-1, 2, -1], [-1, 0, 1], N2, N2);

L = nu(1)*kron(B1, C1) + nu(2)*kron(B2, C2);
end