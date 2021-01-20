/**
 *  \author Xavier Cr�gut <nom@n7.fr>
 *  \file file.c
 *
 *  Objectif :
 *    Implantation des op�rations de la file
*/

#include <stdlib.h>
// <malloc.h> est déprécier !!
#include <assert.h>

#include "file.h"

void initialiser(File *f)
{
    f->tete = NULL;
    f->queue = NULL;
    assert(est_vide(*f));
}

void detruire(File *f)
{
    Cellule *curseur = (f->tete);
    Cellule *suprr;

    while (curseur != (f->queue))
    {
        suprr = curseur;
        curseur = curseur->suivante;
        suprr = NULL;
        free(suprr);
    }
    curseur = NULL;
    (f->queue) = NULL;
    free(curseur);
    free((f->queue));
}

char tete(File f)
{
    assert(!est_vide(f));
    return (f.tete)->valeur;
}

bool est_vide(File f)
{
    return (f.tete == NULL && f.queue == NULL);
}

/**
 * Obtenir une nouvelle cellule allou�e dynamiquement
 * initialis�e avec la valeur et la cellule suivante pr�cis� en param�tre.
 */
static Cellule *cellule(char valeur, Cellule *suivante)
{
    Cellule *cellule = malloc(sizeof(Cellule));
    cellule->valeur = valeur;
    cellule->suivante = suivante;
    return cellule;
}

void inserer(File *f, char v)
{
    assert(f != NULL);
    if (est_vide(*f))
    {
        (f->queue) = cellule(v, NULL);
        (f->tete) = (f->queue);
    }
    else
    {
        (f->queue)->suivante = cellule(v, NULL);
        (f->queue) = (f->queue)->suivante;
    }
}

void extraire(File *f, char *v)
{
    assert(f != NULL);
    assert(!est_vide(*f));

    *v = (f->tete)->valeur;
    Cellule *a_suppr = (f->tete);
    (f->tete) = (f->tete)->suivante;
    a_suppr = NULL;
    free(a_suppr);
    if ((f->tete) == NULL)
    {
        (f->queue) = (f->tete);
    }
}

int longueur(File f)
{
    if (est_vide(f))
    {
        return 0;
    }
    else
    {
        int res = 1;
        Cellule *curseur = (f.tete);
        while (curseur != (f.queue))
        {
            curseur = curseur->suivante;
            res++;
        }
        return res;
    }
}
