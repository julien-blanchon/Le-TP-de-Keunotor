Require Import Naturelle.
Section Session1_2019_Logique_Exercice_2.

Variable A B : Prop.

Theorem Exercice_2_Naturelle : (~A) \/ B -> (~A) \/ (A /\ B).
Proof.
I_imp H1.
E_ou (~A) B.
Hyp H1.
I_imp H2.
I_ou_g.
Hyp H2.
I_imp H2.
E_ou A (~A).
TE.
I_imp HA.
I_ou_d.
I_et.
Hyp HA.
Hyp H2.
I_imp H3.
I_ou_g.
Hyp H3.
Qed.

Theorem Exercice_2_Coq : (~A) \/ B -> (~A) \/ (A /\ B).
Proof.
intro.
destruct H as [HA|HB].
right.
split.


Qed.

End Session1_2019_Logique_Exercice_2.

