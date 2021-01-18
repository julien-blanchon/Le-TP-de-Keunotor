Require Import Naturelle.
Section Session1_2020_Logique_Exercice_1.

Variable A B C : Prop.

Theorem Exercice_1_Naturelle :  ((A -> C) \/ (B -> C)) -> ((A /\ B) -> C).
Proof.
I_imp H1.
I_imp H2.
E_imp A.
E_ou (A->C) (B->C).
Hyp H1.
I_imp H3.
Hyp H3.
I_imp H3.
I_imp H4.
E_imp B.
Hyp H3.
E_et_d A.
Hyp H2.
E_et_g B.
Hyp H2.
Qed.

Theorem Exercice_1_Coq : ((A -> C) \/ (B -> C)) -> ((A /\ B) -> C).
Proof.
intros.
destruct H.
destruct H0.
cut A.
exact H.
exact H0.
cut B.
exact H.
destruct H0.
exact H1.
Qed.

End Session1_2020_Logique_Exercice_1.

