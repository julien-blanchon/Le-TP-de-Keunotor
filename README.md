# Le TP de Keunotor

<p align="center">
  <img src="https://img.pokemondb.net/sprites/black-white/anim/shiny/bidoof.gif" height="250" width="250">
</p>
Dépot git communs pour les TDs et TPs du groupe B.

# Avancement des TPs
- :x: Modelisation 
	- :x: TP1
	- :x: TP2
	- :x: TP3
	- :x: TP4
	- :x: TP5
	- :x: TP6
	- :x: TP7
- :white_check_mark: Probas 
	- :white_check_mark: TP1
- :white_check_mark: Optimisation
	- :white_check_mark: TP1


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
Aprés avoir copier ou modifier un fichier ou un dossier dans `Le-TP-de-Keunotor` pour l'envoyer sur le dépôt il faut:

```git pull```

Ajouter les modifications (ajout à l'**INDEX**)

```git add <filename>```
ou plus simplement (pour enregistrer toute les modifications)
```git add --all```

Valider les modifications (ajout à **HEAD**)
```git commit -a -m "Message de validation"``` (la -a ajoute automatiquement les modifications)

Envoyer les modifications (sur la branche principale)
```git push```
Normalement vous allez devoir donner vos identifiant github pour le push.

Exemple
```console
jblancho@keunotor:~/Le-TP-de-Keunotor$ cp -r ../1A/optimisation/tp1 optimisation/tp/
jblancho@keunotor:~/Le-TP-de-Keunotor$ git add --all
jblancho@keunotor:~/Le-TP-de-Keunotor$ git push
Décompte des objets: 5, fait.
Delta compression using up to 6 threads.
Compression des objets: 100% (5/5), fait.
Écriture des objets: 100% (5/5), 720 bytes | 720.00 KiB/s, fait.
Total 5 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/julien-blanchon/Le-TP-de-Keunotor
   05542ac..cca9d25  main -> main
```



