(* Ouverture d'une section *)
Section CalculPredicats.
(* Définition de 2 domaines pour les prédicats *)
Variable A B : Type.

(* Formule du second ordre : Quantification des prédicats phi et psi *) 
Theorem Thm_8 :   forall (P Q : A -> Prop),
                  (forall x1 : A, (P x1) /\ (Q x1))
                  -> (forall x2 : A, (P x2)) /\ (forall x3 : A, (Q x3)).
split.
intro x1.
cut ((P x1)/\(Q x1)).
intro H1.
elim H1.
intros H1A H1B.
exact H1A.
generalize x1.
exact H.
intro x3.
cut ((P x3)/\(Q x3)).
intro H2.
elim H2.
intros H2A H2B.
exact H2B.
generalize x3.
exact H.
Qed.
(*
*)

(* Formule du second ordre : Quantification du prédicat phi *)
Theorem Thm_9 : forall (P : A -> B -> Prop),
          (exists x1 : A, forall y1 : B, (P x1 y1)) 
          -> forall y2 : B, exists x2: A , (P x2 y2).
intros H1 H2.
intro y2.
destruct H2.
exists x.
generalize y2.
exact H.
Qed.

(* Formule du second ordre : Quantification des prédicats phi et psi *) 
Theorem Thm_10 :  forall (P Q : A -> Prop),
                  (exists x1 : A, (P x1) -> (Q x1)) 
                ->(forall x2 : A, (P x2)) -> exists x3 : A,(Q x3).
intros H1 H2 H3 H4.
destruct H3.
exists x.
cut (H1 x).
exact H.
generalize x.
exact H4.
Qed.


End CalculPredicats.
