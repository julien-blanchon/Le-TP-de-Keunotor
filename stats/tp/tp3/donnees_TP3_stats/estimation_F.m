function [rho_F,theta_F] = estimation_F(rho,theta);
    % Estimation par projection orthogonal de B sur Im(A).
    % Construire A et B
    A = [cos(theta) sin(theta)];
    B = rho;
    % Faire la projection
    X_star = pinv(A)*B;
    x_F = X_star(1);
    y_F = X_star(2);
    rho_F = sqrt(x_F^2 + y_F^2);
    theta_F = atan2(y_F, x_F);
end