# Le TP de Keunotor

<p align="center">
  <img src="https://img.pokemondb.net/sprites/black-white/anim/shiny/bidoof.gif" height="250" width="250">
</p>
Dépot git communs pour les TDs et TPs du groupe B.

# Avancement des TPs/TDs
- Pim
  - TDs
    - :white_check_mark: TD1
    - :white_check_mark: TD2
    - :white_check_mark: TD3
    - :white_check_mark: TD4
    - :white_check_mark: TD5
    - :white_check_mark: TD6
    - :white_check_mark: TD7
    - :white_check_mark: TD8
    - :white_check_mark: TD9
  - TPs
    - :white_check_mark: TP1
    - :white_check_mark: TP2
    - :white_check_mark: TP3
    - :white_check_mark: TP4
    - :white_check_mark: TP5
    - :white_check_mark: TP6
    - :white_check_mark: TP7
    - :white_check_mark: TP8
    - :white_check_mark: TP9
    - :white_check_mark: TP10
  
- Intégration
  - TDs
      - :x: TD1
      - :x: TD2
      - :x: TD3
      - :x: TD4

- Probas
  - TPs
    - :white_check_mark: TP1
    - :white_check_mark: TP2
    - :white_check_mark: TP3
- Stats
  - TPs
      - :x: TP1
      - :x: TP2
      - :x: TP3
- EDP
  - TDs
    - :white_check_mark: TD1
  - TPs
    - :white_check_mark: TP1
    - :white_check_mark: TP2

- Optimisation
  - TPs
	 - :white_check_mark: TP1

- Modelisation
  - TPs
  	- :x: TP1
  	- :x: TP2
  	- :x: TP3
  	- :x: TP4
  	- :x: TP5
  	- :x: TP6
  	- :x: TP7

- Archi
  - TDs
    - :white_check_mark: TD1
  - TPs
    - :white_check_mark: TP1

- Traitement du Signal
  - TDs
    - :white_check_mark: TD1
    - :white_check_mark: TD2
    - :white_check_mark: TD3
  - TPs
    - :x: TP1
    - :x: TP2

- Language C
    - TDs
    - TPs


# Table des matières
- Usage de git
- Usage de markdown
- Usage de jupyter notebook
- Usage atom teletype

## Usage de git
### Cloner un dépôt (chez vous ou sur les ordis de l'n7) :
```console
jblancho@keunotor:~$ git clone https://github.com/julien-blanchon/Le-TP-de-Keunotor
Clonage dans 'Le-TP-de-Keunotor'...
remote: Enumerating objects: 436, done.
remote: Counting objects: 100% (436/436), done.
remote: Compressing objects: 100% (321/321), done.
remote: Total 436 (delta 97), reused 422 (delta 86), pack-reused 0
Réception d'objets: 100% (436/436), 28.31 MiB | 9.16 MiB/s, fait.
Résolution des deltas: 100% (97/97), fait.
```

### Mettre à jour le dépôt:

```git pull```

Synchronise votre dossier sur la derniere version de depo github.

### Faire des ajouts:
Aprés avoir copier ou modifier un fichier ou un dossier dans `Le-TP-de-Keunotor` pour l'envoyer sur le dépôt il faut:


- Ajouter les modifications (ajout à l'**INDEX**)

```git add <filename>```

ou plus simplement (pour enregistrer toute les modifications)

```git add --all```

- Valider les modifications (ajout à **HEAD**)

```git commit -a -m "Message de validation"```

(la -a ajoute automatiquement les modifications)

- Envoyer les modifications (sur la branche principale)

```git push```

Normalement vous allez devoir donner vos identifiant github pour le push.

Il est impossible de push si vous n'etes pas a jour sur le depo du serveur, si c'est le cas vous aller avoir une erreur.
Il faut alors faire ```git pull``` (il va essayer de fusionner la mise a jour et vos modifications) puis ```git push```.

- Exemple:
```console
jblancho@keunotor:~/Le-TP-de-Keunotor$ cp -r ../1A/optimisation/tp1 optimisation/tp/
jblancho@keunotor:~/Le-TP-de-Keunotor$ git add --all
jblancho@keunotor:~/Le-TP-de-Keunotor$ git commit -a -m "Ajout TP1 d'opti"
[main 36d85a0] Ajout TP1 d'opti
 16 files changed, 3963 insertions(+)
 create mode 100644 optimisation/tp/tp1/TP_Etudiants.zip
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/.Modelisation_C14.m.swp
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/.ipynb_checkpoints/TP1-checkpoint.ipynb
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/Algo_Gauss_Newton.m
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/Algo_Newton.m
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/C14_figures.png
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/C14_results.txt
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/H_residu_C14.m
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/Hess_f_C14.m
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/Hess_f_C14_bis.m
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/J_residu_C14.m
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/Modelisation_C14.m
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/TP1.ipynb
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/TP_Opti1A.pdf
 create mode 100644 optimisation/tp/tp1/TP_Etudiants/residu_C14.m
 create mode 100644 optimisation/tp/tp1/TP_JulienBlanchon.zip
jblancho@keunotor:~/Le-TP-de-Keunotor$ git push
Décompte des objets: 23, fait.
Delta compression using up to 6 threads.
Compression des objets: 100% (17/17), fait.
Écriture des objets: 100% (23/23), 2.49 MiB | 3.64 MiB/s, fait.
Total 23 (delta 5), reused 20 (delta 4)
remote: Resolving deltas: 100% (5/5), completed with 1 local object.
To https://github.com/julien-blanchon/Le-TP-de-Keunotor
   2b5723f..36d85a0  main -> main
```
