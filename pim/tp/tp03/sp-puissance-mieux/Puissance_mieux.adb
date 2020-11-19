with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;    use Ada.Float_Text_IO;

procedure Puissance_mieux is

    function Puissance_Iteratif (Nombre: in Float ; Exposant : in Integer) return Float with
        Pre => Exposant >= 0 or Nombre /= 0.0;
        --! Ceci est une déclaration en avant.  La fonction Ecrire_Recursive
        --! est connue et peut être utilisée (sa signature suffit pour que le
        --! compilateur puisse vérifier l'appel)
        --!
        --! Remarque : les contrats ne doivent apparaître que lors de la première
        --! apparition.  Ceci évite les redondances toujours sources d'erreurs.


    -- Retourne Nombre à la puissance Exposant.
    function Puissance_Recursif (Nombre: in Float ; Exposant : in Integer) return Float with
        Pre => Exposant >= 0 or Nombre /= 0.0
    is
        Demi_Exposant: Integer;     -- la moitié de l'exposant
    begin
        if exposant = 0 then
            return 1.0;
        elsif exposant < 0 then
            return Puissance_Recursif (1.0 / Nombre, - exposant);
        else
            Demi_Exposant := Exposant / 2;
            if Exposant Mod 2 = 0 then
                return Puissance_Recursif (Nombre * Nombre, Demi_Exposant);
            else
                return Nombre * Puissance_Recursif (Nombre * Nombre, Demi_Exposant);
            end if;
        end if;
    end Puissance_Recursif;


    function Puissance_Iteratif (Nombre: in Float ; Exposant : in Integer) return Float is
        -- Principe : Multiplier abs(Exposant) fois Nombre ou 1.0 / Nombre si Exposant négatif
        Facteur: Float;     -- Facteur multiplicatif pour le calcul de la puissance
        Nb_Multiplications: Integer; -- Nombre de multiplications à faire
        Resultat: Float;    -- Facteur à la puissance Nb_Multiplications
    begin
        -- Déterminer le facteur et nb de multiplications à réaliser
        if Exposant > 0 then
            Facteur := Nombre;
            Nb_Multiplications := Exposant;
        else
            Facteur := 1.0 / Nombre;
            Nb_Multiplications := - Exposant;
        end if;

        -- Réaliser les multiplications
        Resultat := 1.0;
        while Nb_Multiplications > 0 loop
            if Nb_Multiplications Mod 2 = 1 then
                Resultat := Resultat * Facteur;
            else
                null;
            end if;
            Facteur := Facteur * Facteur;
            Nb_Multiplications := Nb_Multiplications / 2;
        end loop;

        return Resultat;
    end Puissance_Iteratif;


    Un_Reel: Float;         -- un réel lu au clavier
    Un_Entier: Integer;     -- un entier lu au clavier
begin
    -- Demander le réel
    Put ("Un nombre réel : ");
    Get (Un_Reel);

    -- Demander l'entier
    Put ("Un nombre entier : ");
    Get (Un_Entier);

    -- Afficher la puissance en version itérative
    if Un_Entier < 0 and Un_Reel = 0.0 then
        Put_Line ("Division par zéro");
    else
        Put ("Puissance (itérative) : ");
        Put (Puissance_Iteratif (Un_Reel, Un_Entier), Fore => 0, Exp => 0,  Aft => 4);
        New_Line;
    end if;

    -- Afficher la puissance en version récursive
    if Un_Entier < 0 and Un_Reel = 0.0 then
        Put_Line ("Division par zéro");
    else
        Put ("Puissance (récursive) : ");
        Put (Puissance_Recursif (Un_Reel, Un_Entier), Fore => 0, Exp => 0,  Aft => 4);
        New_Line;
    end if;

end Puissance_mieux;
