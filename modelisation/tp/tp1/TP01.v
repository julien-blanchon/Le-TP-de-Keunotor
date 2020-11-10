(*AVEC LOGIQUE NATURELLE*)
(* Les règles de la déduction naturelle doivent être ajoutées à Coq. *)
Require Import Naturelle.
(* Ouverture d\u2019une section *)
Section CalculPropositionnel.
(* Déclaration de variables propositionnelles *)
Variable A B C E Y R : Prop.

Theorem Thm00 : A/\B -> B/\A.
I_imp H.
I_et.
E_et_d A.
Hyp H.
E_et_g B.
Hyp H.
Qed.

Theorem Thm_1 : ((A \/ B) -> C) -> (B -> C).
I_imp H1.
I_imp H2.
E_imp (A \/ B).
Hyp H1.
I_ou_d.
Hyp H2.
Qed.

Theorem Thm_2 : A -> ~~A.
I_imp H1.
I_non H2.
I_antiT A.
Hyp H1.
Hyp H2.
Qed.

Theorem Thm_3 : (A -> B) -> (~B -> ~A).
I_imp H1.
I_imp H2.
I_non H3.
E_non B.
E_imp A.
Hyp H1.
Hyp H3.
Hyp H2.
Qed.

Theorem Thm_4 : ~~A -> A.
I_imp H1.
absurde H2.
I_antiT (~A).
Hyp H2.
Hyp H1.
Qed.

Theorem Thm_5 : (~B -> ~A) -> (A -> B).
I_imp H1.
I_imp H2.
absurde H3.
I_antiT A.
Hyp H2.
E_imp (~B).
Hyp H1.
Hyp H3.
Qed.

Theorem Thm_6 : (E -> (Y \/ R)) /\ (Y -> R) -> (~R->~E).
I_imp H1.
I_imp H2.
I_non H3.
I_antiT R.
E_imp Y.
E_et_d (E->(Y\/R)).
Hyp H1.
E_ou Y R.
E_imp E.
E_et_g (Y->R).
Hyp H1.
Hyp H3.
I_imp H4.
Hyp H4.
I_imp H5.
E_antiT.
E_non R.
Hyp H5.
Hyp H2.
Hyp H2.
Qed.

End CalculPropositionnel.
