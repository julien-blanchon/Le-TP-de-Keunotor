with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

-- Auteur: 
-- Gérer un stock de matériel informatique.
--
package body Stocks_Materiel is

    procedure Creer (Stock : out T_Stock) is
        --Contenus: T_Contenus; -- Contenus Vide pour la création.
    begin
        Stock.Taille := 0;
        --Stock := (Contenus=>Contenus, Taille=>0);
    end Creer;


    function Nb_Materiels (Stock: in T_Stock) return Integer is
    begin
        return Stock.Taille;
    end;


    procedure Enregistrer (
            Stock        : in out T_Stock;
            Numero_Serie : in     Integer;
            Nature       : in     T_Nature;
            Annee_Achat  : in     Integer
        ) is
    begin
        if Stock.Taille + 1<=Capacite then
            Stock.Contenus(Stock.Taille+1).Etat := True;
            Stock.Contenus(Stock.Taille+1).Numero_Serie := Numero_Serie;
            Stock.Contenus(Stock.Taille+1).Nature := Nature;
            Stock.Contenus(Stock.Taille+1).Annee_Achat := Annee_Achat; 
            Stock.Taille := Stock.Taille + 1;
        end if;
    end;


end Stocks_Materiel;
