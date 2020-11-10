
function [X,Y] = vectorisation(I)    
    % Sous matrice droite et gauche vectorisées.
    I_gauche = I(1:end, 1:end-1);
    I_droite = I(1:end, 2:end);
    X = I_gauche(:);
    Y = I_droite(:);
end