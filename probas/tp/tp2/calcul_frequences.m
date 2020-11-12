
function frequences = calcul_frequences(texte, alphabet)
    % calcul_frequences calcule les fréquences relatives des caractères dans le texte passé en paramètre.
    taille_texte = length(texte);
    taille_alphabet = length(alphabet);
    frequences = zeros(taille_alphabet, 1);
    for i = 1:taille_alphabet
        frequences(i) = length(find(texte==alphabet(i)));
    end
    frequences = frequences/taille_texte;
end