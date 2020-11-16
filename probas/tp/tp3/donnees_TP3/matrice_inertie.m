
function [C_x,C_y,M] = matrice_inertie(E_x,E_y,G_norme_E)
    PI = sum(G_norme_E);
    C_x = E_x'*G_norme_E/PI;
    C_y = E_y'*G_norme_E/PI;
    M(1, 1) = ((E_x-C_x).*(E_x-C_x))'*G_norme_E/PI;
    M(2, 2) = ((E_y-C_y).*(E_y-C_y))'*G_norme_E/PI;
    M(1, 2) = ((E_x-C_x).*(E_y-C_y))'*G_norme_E/PI;
    M(2, 1) = M(1, 2);
end