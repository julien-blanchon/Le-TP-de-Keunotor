function coeff_compression = coeff_compression_image(histogramme,dico)
    nbr_pixel = sum(histogramme);
    image_mem = nbr_pixel*8; %Car chaque pixel utilise 2^8=256.
    mem_codage_intensite = cellfun('length', dico) %Matrice des tailles de toute les cellules.
    mem_codage_intensite = mem_codage_intensite(:, 2); %Vecteur qui donne le nbr de bits neccessaire pour coder chaque intensite entre 0 et 255.
    image_encode_mem = histogramme*mem_codage_intensite;
    coeff_compression = image_mem/image_encode_mem;
end