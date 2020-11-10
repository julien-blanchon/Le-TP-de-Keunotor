Require Import Naturelle.
Section Session1_2019_Logique_Exercice_1.

Variable A B C : Prop.

Theorem Exercice_1_Naturelle :  (A -> B -> C) -> ((A /\ B) -> C).
Proof.
I_imp H1.
I_imp H2.
E_imp B.
E_imp A.
Hyp H1.
E_et_g B.
Hyp H2.
E_et_d A.
Hyp H2.
Qed.

Theorem Exercice_1_Coq :  (A -> B -> C) -> ((A /\ B) -> C).
Proof.
intros.
cut B.
cut A.
exact H.
cut (A/\B).
intro H1.
elim H1.
intros H1A H1B.
exact H1A.
exact H0.
cut (A/\B).
intro H2.
elim H2.
intros H2A H2B.
exact H2B.
exact H0.
Qed.

End Session1_2019_Logique_Exercice_1.

