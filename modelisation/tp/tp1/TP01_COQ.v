(*AVEC LOGIQUE COQ*)

(* Déclaration de variables propositionnelles *)
Variable A B C E Y R : Prop.

Theorem Thm00 : A/\B -> B/\A.
intro H.
destruct H as (HA, HB).
split.
exact HB.
exact HA.
Qed.

Theorem Coq_E_imp : ((A -> B) /\ A) -> B.
intro H1.
cut A.
cut ((A -> B) /\ A).
intro H2.
elim H2.
intros H2A H2B.
exact H2A.
exact H1.
cut((A -> B) /\ A).
intro H3.
elim H3.
intros H3A H3B.
exact H3B.
exact H1.
Qed.

Theorem Coq_E_et_g : (A/\B)->A.
intro H1.
cut (A/\B).
intro H2.
elim H2.
intros H2A H2B.
exact H2A.
exact H1.
Qed.

(*OK*)
Theorem Coq_E_ou : ((A \/ B) /\ (A -> C) /\ (B -> C)) -> C.
intro H1.
destruct H1 as (H1A, H1B).
destruct H1B as (H1BA, H1BB).
elim H1A.
exact H1BA.
exact H1BB.
Qed.

Theorem Thm_7 : ((E -> (Y \/ R)) /\ (Y -> R)) -> (~R -> ~E).
intro H1.
intro H2.
destruct H1 as (H1A, H1B).
inversion H1A.



