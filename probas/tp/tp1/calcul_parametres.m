
function [r, a, b] = calcul_parametres(X, Y)
    % Calcul Parametres de correlation.
    sigmaX2 = mean(X.^2 - mean(X).^2);
    sigmaY2 = mean(Y.^2 - mean(Y).^2);
    sigmaXY = mean((X - mean(X)).*(Y - mean(Y)));
    r = sigmaXY/sqrt(sigmaX2*sigmaY2);
    a = sigmaXY/sigmaX2;
    b = mean(Y) - a*mean(X);
end