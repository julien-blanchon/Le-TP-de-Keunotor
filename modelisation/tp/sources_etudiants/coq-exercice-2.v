Require Import Naturelle.
Section Session1_2019_Logique_Exercice_2.

Variable A B : Prop.

Theorem Exercice_2_Naturelle : (~A) \/ B -> (~A) \/ (A /\ B).
Proof.
I_imp H1.
E_ou A (~A).
TE.
I_imp H2.
E_ou (~A) B.
Hyp H1.
I_imp H3.
I_ou_g.
Hyp H3.
I_imp H4.
I_ou_d.
I_et.
Hyp H2.
Hyp H4.
I_imp H5.
I_ou_g.
Hyp H5.
Qed.

Theorem Exercice_2_Coq : (~A) \/ B -> (~A) \/ (A /\ B).
Proof.
intros.
elim H.
intro.
left.
exact H0.
intro.
cut (A \/ ~A).
intro.
elim H1.
intro.
right.
split.
exact H2.
exact H0.
intro.
left.
exact H2.
apply (classic A).

Qed.

End Session1_2019_Logique_Exercice_2.

