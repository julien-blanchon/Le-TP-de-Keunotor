Section Session1_2020_Induction_Exercice_3.

(* Déclaration d’un domaine pour les éléments des listes *)
Variable A : Set.

Inductive entier : Set :=
Zero : entier
| Succ : entier -> entier.

(* Déclaration du nom de la fonction somme *)
Variable somme_spec : entier -> entier -> entier.

(* Spécification du comportement de somme pour Zero en premier paramètre *)
Axiom somme_Zero : forall (n : entier), somme_spec Zero n = n.

(* Spécification du comportement de somme pour Succ en premier paramètre *)
Axiom somme_Succ : forall (n m : entier),
  somme_spec (Succ n) m = Succ (somme_spec n m).

(* somme est associative à gauche et à droite *)
Axiom somme_associative : forall (n1 n2 n3 : entier),
   (somme_spec n1 (somme_spec n2 n3)) = (somme_spec (somme_spec n1 n2) n3).

Inductive liste : Set :=
Nil
: liste
| Cons : A -> liste -> liste.

(* Déclaration du nom de la fonction append *)
Variable append_spec : liste -> liste -> liste.

(* Spécification du comportement de append pour Nil en premier paramètre *)
Axiom append_Nil : forall (l : liste), append_spec Nil l = l.

(* Spécification du comportement de append pour Cons en premier paramètre *)
Axiom append_Cons : forall (t : A), forall (q l : liste),
   append_spec (Cons t q) l = Cons t (append_spec q l).

(* append est associative à gauche et à droite *) (*Pourquoi ???*)
Axiom append_associative : forall (l1 l2 l3 : liste),
   (append_spec l1 (append_spec l2 l3)) = (append_spec (append_spec l1 l2) l3).

(* Déclaration du nom de la fonction taille *)
Variable taille_spec : liste -> entier.

(* Spécification du comportement de taille pour Nil en paramètre *)
Axiom taille_Nil : (taille_spec Nil) = Zero.

(* Spécification du comportement de taille pour Cons en paramètre *)
Axiom taille_Cons : forall (t : A), forall (q : liste),
  (taille_spec (Cons t q)) = (Succ (taille_spec q)).


(* taille commute avec append *)
Theorem taille_append : forall (l1 l2 : liste), 
(taille_spec (append_spec l1 l2)) = (somme_spec (taille_spec l1) (taille_spec l2)).
Proof.
induction l1.
intro l2.
rewrite append_Nil.
rewrite taille_Nil.
rewrite somme_Zero.
reflexivity.
intro l2.
rewrite append_Cons.
repeat rewrite taille_Cons.
rewrite somme_Succ.
rewrite IHl1.
reflexivity.
Qed.

(* Implantation de la fonction taille *)
Fixpoint taille_impl (l : liste) {struct l} : entier :=
match l with
| Nil  => Zero
| (Cons t q) => (Succ (taille_impl(q)))
end.

Theorem taille_correctness : forall (l : liste),
   (taille_spec l) = (taille_impl l).
Proof.
induction l.
simpl.
rewrite taille_Nil.
reflexivity.
simpl.
rewrite taille_Cons.
rewrite IHl.
reflexivity.
Qed.

End Session1_2020_Induction_Exercice_3.
