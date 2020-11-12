function coeff_compression = coeff_compression_texte(texte, texte_encode)
    %  la fonction coeff_compression_texte, qui calcule le coefficient de compression atteint par le
    % codage de Huffman, défini comme le rapport entre le nombre de bits nécessaires pour encoder un texte dans sa
    % version d’origine, sachant qu’en ASCII, les caractères sont encodés sur 8 bits, et le nombre de bits du même
    % texte encodé par le codage de Huffman.
    texte_mem = length(texte)*8; %Car chaque caractères encodés sur 9 bits
    texte_encode_mem = length(texte_encode);
    coeff_compression = texte_mem/texte_encode_mem;
end