/** Squelette du programme **/
/*********************************************************************
 *  Auteur  : Julien Blanchon
 *  Version : 1.0
 *  Objectif : Conversion pouces/centimètres
 ********************************************************************/

#include <stdio.h>
#include <stdlib.h>

int main()
{
    const float un_pouce = 2.54;
    float valeur;
    char unite;
    float lg_cm;
    float lg_p;
    
    /* Saisir la longueur */
    printf("Entrer une longeur (valeur + unité) : ");
    scanf("%f %c", &valeur, &unite);
        

    /* Calculer la longueur en pouces et en centimètres */
    switch (unite) {
        case 'p':
        case 'P':
            lg_p = valeur;
            lg_cm = lg_p*un_pouce;
            break;
        case 'c':
        case 'C':
            lg_cm = valeur;
            lg_p = lg_cm/un_pouce;
            break;
        case 'm':
        case 'M':
            lg_cm = valeur*100;
            lg_p = lg_cm/un_pouce;
            break;
        default:
            lg_cm = 0;
            lg_p = 0;
            break;
    }

    /* Afficher la longueur en pouces et en centimètres */
    printf("%1.5f p =  %1.5f cm", lg_p, lg_cm);
    
    return EXIT_SUCCESS;
}