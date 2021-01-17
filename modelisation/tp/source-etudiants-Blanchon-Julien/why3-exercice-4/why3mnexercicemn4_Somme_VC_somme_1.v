(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require int.Int.
Require int.Abs.
Require int.ComputerDivision.

(* Why3 assumption *)
Inductive ref (a:Type) :=
  | mk_ref : a -> ref a.
Axiom ref_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (ref a).
Existing Instance ref_WhyType.
Arguments mk_ref {a}.

(* Why3 assumption *)
Definition contents {a:Type} {a_WT:WhyType a} (v:ref a) : a :=
  match v with
  | mk_ref x => x
  end.

Parameter n: Z.

Axiom H : (0%Z < n)%Z.

Parameter r: Z.

Parameter i: Z.

Axiom H1 : ((2%Z * r)%Z = (i * (i + 1%Z)%Z)%Z).

Axiom H2 : ~ (i < n)%Z.

(* Why3 goal *)
Theorem VC_somme : ((2%Z * r)%Z = (n * (n + 1%Z)%Z)%Z).
Proof.


Qed.

