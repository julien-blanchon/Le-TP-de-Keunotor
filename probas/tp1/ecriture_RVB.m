
function image_RVB = ecriture_RVB(image_originale)
    % Transforme une image RAW en image RVB avec un filtre de Bayer.
    n = 1024;
    image_RVB = zeros(1024/2, 1024/2, 3);
    image_RVB(:, :, 1) = image_originale(1:2:end, 2:2:end); %Rouge
    image_RVB(:, :, 2) = (image_originale(1:2:end, 1:2:end) + image_originale(2:2:end, 2:2:end))/2; %Vert
    image_RVB(:, :, 3) = image_originale(2:2:end,1:2:end); %Bleu
end