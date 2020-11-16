
function [frequences_triees, indices_frequences_triees] = tri(selection_frequences)
    % selection sélectionne les caractères de fréquences strictement positives, et les fréquences associées.
    [frequences_triees, indices_frequences_triees] = sort(selection_frequences, "ascend");
end