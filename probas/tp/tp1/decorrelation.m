
function I_decorrelee = decorrelation(I)
    % Calcul Parametres de correlation.
    I_decorrelee = I;
    I_decorrelee(:, 2:end) = I(:, 2:end) - I(:, 1:end-1);
end