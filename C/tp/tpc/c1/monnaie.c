#include <stdlib.h> 
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

// Definition du type monnaie
struct t_monnaie
{
    float valeur;
    char device;
};
// Alias
typedef struct t_monnaie t_monnaie;

/**
 * \brief Initialiser une monnaie 
 * \param[in out] t_monnaie monnaie: La monnaie 
 * \param[in] float valeur: Valeur de la monnaie
 * \param[in] char device: Device de la monnaie
 * \pre: assert(valeur >= 0);
 */
void initialiser(t_monnaie* monnaie, float valeur, char device)
{
    assert(valeur >= 0);
    (*monnaie).valeur = valeur;
    (*monnaie).device = device;
}

/**
 * \brief Ajouter une monnaie m2 à une monnaie m1 
 * \param[in] t_monnaie monnaie1
 * \param[in out] t_monnaie monnaie2
 */
bool ajouter(t_monnaie monnaie1, t_monnaie* monnaie2)
{
    if ( monnaie1.device == (*monnaie2).device ) {
        (*monnaie2).valeur += monnaie1.valeur;
        return true;
    } 
    else {
        return false;
    }
        
}

/**
 * \brief Tester Initialiser 
 */ 
void tester_initialiser(){
    t_monnaie monnaie1;
    initialiser(&monnaie1, 4.2, '$');
    assert(monnaie1.valeur == 4.2);
    assert(monnaie1.device == '$');
}

/**
 * \brief Tester Ajouter 
 */ 
void tester_ajouter(){
    t_monnaie monnaie1;
    initialiser(&monnaie1, 4.2, '$');
    t_monnaie monnaie2;
    initialiser(&monnaie2, 10.4, '$');
    t_monnaie monnaie3;
    initialiser(&monnaie3, 99.0, 'e');
    assert( ajouter(monnaie1, (&monnaie2)) == 1);
    assert(monnaie1.valeur == 4.2);
    assert(monnaie2.valeur == 14.6);
    assert(ajouter(monnaie1, (&monnaie3)) == 0);
    assert(monnaie1.valeur == 4.2);
    assert(monnaie2.valeur == 14.6);
    assert(monnaie2.valeur == 99.0);
}



int main(void){
    const int CAPACITE = 5;
    typedef t_monnaie t_porte_monnaie[CAPACITE];
    t_porte_monnaie mon_porte_monnaie;

    //Initialiser les monnaies
    float valeur;
    char device;
    printf("#Porte Monnaie \n");
    for (int i = 1; i < CAPACITE; i++){
        printf("\t Monnaie numéro %d \n", i);
        printf("\t \t Valeur : ");
        scanf("%f", &valeur);
        while ((getchar()) != '\n');
        printf("\t \t Device : ");
        scanf("%c", &device);
        while ((getchar()) != '\n');

        initialiser(&mon_porte_monnaie[i], valeur, device);
    }

 
    // Afficher la somme des toutes les monnaies qui sont dans une devise entrée par l'utilisateur.
    printf("#Entrer une device: ");
    scanf("%c", &device);
    while ((getchar()) != '\n');
    float sum = 0.0;
    for (int i = 1; i < CAPACITE; i++) {
        if (mon_porte_monnaie[i].device == device) {
            sum += mon_porte_monnaie[i].valeur;
        }
    }
    printf("%f", sum);

    return EXIT_SUCCESS;
}
