% Compte-rendu minimal du mini-projet SDA : LCA et TH
% Auteur : BLANCHON Julien
% Groupe de TP : B

**Remarque :** Ce document utilise le langage Markdown. On peut en engendrer une version PDF en faisant par exemple :

~~~
pandoc --toc -N -o LISEZ-MOI.pdf LISEZ-MOI.md
~~~

# Exercice 1

## Question 1.1: :white_check_mark:

## Question 1.2: :white_check_mark:

## Question 1.3: :white_check_mark:
Je ne vois pas de potentiel sous-programmes utile pour l'interface :neutral_face:.

## Question 1.4: :white_check_mark:
- Avantage:
	- Simplicité de manipulation d'un point de vue algorithmique.
	- Aucune contrainte sur la taille car on utilise des pointeurs.
	- Aucune limite de taille si ce n'est la mémoire.

- Inconvenient:
	- Opérations lentes ($O(n)$ avec $n$ la taille) car les lectures/écritures sont effectuées de façon séquentielle de proche en proche de par le système chainage.
	- Pour accéder à une clé particulière il faut effectué une procédure séquentielle alors que se serait immédiat avec une structures de liste.

## Question 1.5: :white_check_mark:

# Évaluation expérimentale.

## Performance comparée de LCA et TH

### Performance de TH pour le trie: **17,18ms**
```shell
$ time ./evaluer_alea_th 1000 10000
Borne  : 1000
Taille : 10000
Min : 1
Max : 27

________________________________________________________
Executed in   17,18 millis    fish           external
   usr time    2,20 millis   78,00 micros    2,13 millis
   sys time    3,43 millis  444,00 micros    2,98 millis
```

### Performance de LCA pour le trie: **19,09s**

```shell
$ time ./evaluer_alea_lca 1000 10000
Borne  : 1000
Taille : 10000
Min : 2
Max : 21

________________________________________________________
Executed in   19,09 secs   fish           external
   usr time   16,90 secs  104,00 micros   16,90 secs
   sys time    0,15 secs  542,00 micros    0,14 secs
```

La TH est 1000 (=Borne=Capacité du tableau de la th) fois plus rapide que la LCA.
La TH dans cette configuration s'assimile totalement à un tableau, les opérations de consultations et de modifications sont donc en temps constant. Alors que la LCA doit pour cela parcourir séquentiellement les potentielles 1000 éléments.

De façon général la TH est $\frac{n}{k}$ plus rapide que la LCA avec $n$ le nombre d'éléments et $k$ la capacité de la table de hashage.

## Qualité du générateur aléatoire

Le générateur pseudo-aléatoire semble plutôt mauvais avec un écart de fréquence relativement haut ainsi qu'un régularité dans celui-ci.


# Principales difficultés rencontrées




# Informations complémentaires

Il faut bien faire en sorte que la répartition des hash soit de façon homogène parmi les 1..Capacite.



# Bilan personnel
