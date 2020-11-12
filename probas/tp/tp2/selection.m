
function [selection_frequences,selection_alphabet] = selection(frequences, alphabet)
    % selection sélectionne les caractères de fréquences strictement positives, et les fréquences associées.
    mask = find(frequences~=0);
    selection_frequences = frequences(mask);
    selection_alphabet = alphabet(mask);
end