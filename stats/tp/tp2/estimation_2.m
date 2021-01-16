
function [a_star, b_star] = estimation_2(x_i, y_i);
    % Estimation par projection orthogonal de B sur Im(A).
    % Construire A et B
    A = x_i(:);
    A(:, 2) = 1;
    B = y_i(:);
    % Faire la projection
    X = pinv(A)*B;
    a_star = X(1);
    b_star = X(2);
end