% INP Toulouse - N7 - PIM TP6: Modules — Constructeurs de types
% Auteur : BLANCHON Julien
% Groupe de TP : B

---

# Exercice 1

1. ads: Specification: Interfaces de “dates”

    adb: Implémentation: Corps de “dates”

2. Car la spécification de ces sous programmes se trouve dans le `date.ads`.
3. Car la sémantique de `Afficher_Deux_Positions` n’est pas définis dans le fichier `.ads`
4.
  - Procedure:
    - `Initialiser`
    - `Afficher`
  - Fonction:
    - `Le_Mois`
    - `Le_Jour`
    - `l’Annee`
  - Type :
    - `T_Date` (privé)
    - `T_Mois`


5. Comme le type `T_Date` est privé, on ne peut pas faire d’assignations sur les objets de ce type.
6. Car il est utilisé à l'extérieur de package Dates donc il doit être visible public.
7. Si on modifie le type `T_Dates` en `limited private` plutôt qu’en `private` on interdit les opérations d'assignations (`:=`) et d'égalité (`=` et `/=`).

---

# Exercice 2:
