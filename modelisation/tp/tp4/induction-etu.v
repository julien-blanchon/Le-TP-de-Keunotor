Require Import Extraction.
(* Ouverture d’une section *)
Section Induction.
(* Déclaration d’un domaine pour les éléments des listes *)
Variable A : Set.

Inductive liste : Set :=
  Nil : liste
| Cons : A -> liste -> liste.

(* Déclaration du nom de la fonction *)
Variable append_spec : liste -> liste -> liste.

(* Spécification du comportement pour Nil *)
Axiom append_Nil : forall (l : liste), append_spec Nil l = l.

(* Spécification du comportement pour Cons *)
Axiom append_Cons : forall (t : A), forall (q l : liste),
   append_spec (Cons t q) l = Cons t (append_spec q l).

Theorem append_Nil_right : forall (l : liste), (append_spec l Nil) = l.
induction l.
symmetry.
rewrite -> (append_Nil Nil). (*On applique append_Nil*)
reflexivity. (*Deux partie de l'egalite*)
rewrite -> (append_Cons a l Nil).
rewrite -> IHl.
reflexivity.
Qed.

Theorem append_associative : forall (l1 l2 l3 : liste),
   (append_spec l1 (append_spec l2 l3)) = (append_spec (append_spec l1 l2) l3).
induction l1.
intros.
rewrite -> (append_Nil (append_spec l2 l3)).
symmetry.
rewrite -> (append_Nil l2).
reflexivity.
intros.
rewrite -> (append_Cons).
rewrite -> IHl1.
rewrite <- append_Cons.
rewrite <- append_Cons.
reflexivity.
Qed.

(* Implantation de la fonction append *)
Fixpoint append_impl (l1 l2 : liste) {struct l1} : liste :=
   match l1 with
      Nil => l2
      | (Cons t1 q1) => (Cons t1 (append_impl q1 l2))
end.

Theorem append_correctness : forall (l1 l2 : liste),
   (append_spec l1 l2) = (append_impl l1 l2).
intros.
induction l1.
rewrite -> append_Nil.
simpl.
reflexivity.
rewrite -> append_Cons.
simpl.
rewrite IHl1.
reflexivity.

Qed.

(* Implantation de la fonction rev (reverse d'une liste) *)
Fixpoint rev_impl (l : liste) : liste :=
    match l with
      Nil => Nil
      | (Cons t q) => append_impl (rev_impl q) (Cons t Nil)
end.

Lemma rev_append : forall (l1 l2 : liste),
   (rev_impl (append_impl l1 l2)) = (append_impl (rev_impl l2) (rev_impl l1)).
intros.
induction l1.
simpl.
rewrite <- append_correctness.
rewrite -> append_Nil_right.
reflexivity.
simpl.
rewrite IHl1.
repeat rewrite <- append_correctness.
rewrite append_associative.
reflexivity.
Qed.

Theorem rev_rev : forall (l : liste), (rev_impl (rev_impl l)) = l.
intros.
induction l.
simpl.
reflexivity.
simpl.
repeat rewrite -> rev_append.
simpl.
rewrite IHl.
reflexivity.
Qed.

End Induction.
Extraction Language Ocaml.
Extraction "/tmp/induction" append_impl rev_impl.
Extraction Language Haskell.
Extraction "/tmp/induction" append_impl rev_impl.
Extraction Language Scheme.
Extraction "/tmp/induction" append_impl rev_impl.
