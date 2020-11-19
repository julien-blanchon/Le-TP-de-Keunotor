% INP Toulouse - N7 - PIM TD2: Raffinages
% Auteur : Nezha AKOUZ, Julien BLANCHON, Joe HABRE, Maxime HENRY
% Groupe de TP : B

----

## Piloter un drone au moyen d'un menu textuel

1. Le drone ne peut monter et descendre que s’il a été démarré au préalable.
2. En fonctionnement nominal, l’action _monter_ augmente l’altitude du drone d’une unité et l’action _descendre_ la diminue d’une unité.
3. Le drone ne peut pas descendre à une altitude négative.
4. Le programme affiche le menu et traite chaque choix de l’utilisateur du programme jusqu’à ce que l’utilisateur choisisse de quitter (avec l’option ‘q’) ou jusqu’à ce que le drone monte à une altitude supérieure ou égale à 5 (le drone est alors hors de portée).
5. L’utilisateur pourra utiliser les minuscules ou les majuscules.

**R0** : Simuler le pilotage d’un drone

**R1** : Comment "Simuler le pilotage d’un drone ?"

 - Initialiser le drone. out: Altitude, En_Route, Est_Perdu

- Répéter:
  - Afficher l’altitude out: Altitude

  - Afficher le menu de pilotage out: Menu

  - Demander le choix de l’utilisateur out: choix

  - Traiter le choix de l’utilisateur in: choix in_out: Altitude, En_Route, Est_Perdu

- Jusqu'à “Raisons de l'arrêt”

- Afficher les raisons de l’arrêt in: Est_Perdu. En_Route out: Raisons_de_l’arrêt

**R2** : Comment “Initialiser le drone”:

- En_Route <- False;

- Est_Perdu <- False;

- Altitude <- 0;

- Quitter <- False;

**R2** : Comment “- Afficher l’altitude”:

- Afficher ("Altitude : ");

- Afficher (Altitude, 1);

**R2** : Comment “- Afficher le menu de pilotage”:

- Afficher("Que faire ?");

- Afficher("- d -- Démarrer");

- Afficher("- m -- Monter");

- Afficher("- s -- Descendre");

- Afficher("- q -- Quitter");

**R2** : Comment “Demander le choix de l’utilisateur”:

- Afficher ("Votre choix : ");

- Récupérer (Choix);

**R2** : Comment “Traiter le choix de l’utilisateur”:

- Selon Choix Est:

  - 'd'  'D': Démarrer le Drone

  - 'm' ou 'M': Monter le Drone

  - 's' ou 'S': Descendre le Drone

  - 'q' ou 'Q': Quitter la simulation

  - Autre: Erreur

**R2** : Comment “- Afficher les raisons de l’arrêt”:

- Si Est_Perdu Alors

  - Afficher ("Le drone est hors de portée... et donc perdu !");

- SiSinon non(En_Route) Alors

  - Afficher ("Vous n'avez pas réussi à le mettre en route ?");

- Sinon

  - Afficher ("Au revoir...");

----
## **Problème 1**

----

## **Problème 2**

Expliquer comment fonctionne la technique suivante de la multiplication entière :

1  2  4

\*

7  3  5

\-\-\-\-\-\-\-\-\-\-\-

05 10 20

03 06 12

07 14 28

\-\-\-\-\-\-\-\-\-\-\-

07 17 39 22 20

\-\-\-\-\-\-\-\-\-\-\-

9  1  1  4  0

**R0** : “Calculer la multiplication entière de deux nombre entiers”.

**R1** : Comment “Calculer la multiplication entière”

- Demander deux nombre entier à l’utilisateur. out: a, b

- Décomposer les nombres a et b selon les puissances de 10 (unités). in: a, b out: digits_a, digits_b

- Effectuer les multiplications partielles de chaque unité. in: digits_a, digits_b out: mul_par_unité1 ...

- Sommer les multiplications partiellesde chaque unité. in: mul_par_unité1 ... out: multiplications_par

- Calculer la multiplications entière avec les retenus.in: multiplications_par out: multiplications

- Afficher la multiplication entière.in_out: multiplications

**R2** : Comment “Demander deux nombre entier à l’utilisateur”

**R2** : Comment “Décomposer les nombres a et b en suite de digits”:

**R2** : Comment “Effectuer les multiplications partielles”:

---

## **Problème 3**

**R0** : “ Realiser une mousse au chocolat.”

**R1** : Comment realiser une mousse au chocolat ?

- Preparer les ingredients

- Faire la mousse au chocolat

- Faire cuire pour 10min

- Laisser reposer pour 2h

**R2** : “Comment preparer les ingredients? “

- 125 g Chocolat noir pâtissier

- 50 g  Sucre en poudre

- 30 g  Beurre

- 4  Oeuf

**R2** : “Comment faire la mousse au chocolat ?”

- Sortir beurre et oeufs du réfrigérateur 1 h au moins avant la** **préparation

- Préparer un bain-marie

- Mettre un recipient dans le bain-marie

Confectionner la mousse dans ce recipient

- Enlever le récipient du bain marie et le faire refroidir.

- Ajouter les jaunes d’oeufs.

- [...Mettre les **blancs** dans un autre récipient et les **monter en neige** assez ferme. Incorporer les blancs montés à la préparation en 2 ou 3 fois, en la soulevant et surtout sans tourner, car **il ne faut pas briser la neige des oeufs **et les faire retomber en eau….]

**R2** : “ Comment laisser reposer pour 2h ?”

- Si la mousse terminee :

  - Mettre la mousse au refrigerateur pendant 2 heures.

**R3** :”Comment preparer un bain-marie”?

- Remplir a moitie d’eau une casserole

- Mettre la casserole sur sur une source de chaleur.

**R3** :”Comment confectionner la mousse dans ce recipient?”

---

## **Problème 4**

Expliquer le déroulement de cet exercice.

**R0** : “Réaliser cet exercice”

**R1** : Comment “réaliser cet exercice” ?

- Attribuer un problème à chaque membre

- Traiter son problème


- Commenter les raffinages des autres


- Retravailler son problème


- Evaluer son problème

**R2** : Comment “Attribuer un problème à chaque membre” ?

- Ordonner les membres selon l’ordre alphabétique de leur nom

- Attribuer selon l’ordre

**R2** : Comment “Traiter son problème” ?

- Mettre en place l’algorithme de raffinage

**R2** : Comment “Commenter les raffinages des autres” ?

**R2** : Comment “Retravailler son problème” ?

**R2** : Comment “Evaluer son problème” ?
