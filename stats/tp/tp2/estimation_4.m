    
function [theta_Dorth_2,rho_Dorth_2] = estimation_4(x_i, y_i);
    xg = mean(x_donnees_bruitees);
    yg = mean(y_donnees_bruitees);
    x_prime=x_donnees_bruitees-xg;
    y_prime=y_donnees_bruitees-yg;
    C=[x_prime;y_prime]';
    M=C'C;
    [V,D]=eig(M);
    [d,ind] = min(diag(D));
    Y=V(ind,:);

   theta_min=atan2(Y(2),Y(1));

   theta_Dorth_2=theta_min;
   rho_Dorth_2=xgcos(theta_min)+ygsin(theta_min);
   if rho_Dorth_2 < 0 
        theta_Dorth_2 = theta_Dorth_2 - pi;
        rho_Dorth_2 = yg*sin(theta_Dorth_2) + cos(theta_Dorth_2)*xg;
   end
end