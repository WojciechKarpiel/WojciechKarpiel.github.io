Section Przemiennosc.
  Variable A : Type.
  Variable Op : A -> A -> A.

  Notation "x * y" := (Op x y).

  Hypothesis Hxyy : forall x y, (x * y) * y = x.
  Hypothesis Hyyx : forall x y,  y * (y * x) = x.

  Lemma odwL a x y (H : a * x = a * y) : x = y.
    rewrite <- (Hyyx x a).
    rewrite <- (Hyyx y a).
    apply f_equal.
    assumption.
  Qed.

    Lemma odwP a x y (H :  x * a =  y * a) : x = y.
    rewrite <- (Hxyy x a).
    rewrite <- (Hxyy y a).
    apply (f_equal (fun b => (b * a))).
    assumption.
  Qed.

      
  Lemma przemienne x y : x * y = y * x.
  Proof.
    apply (odwL x).
    apply (odwP (y * x)).
    rewrite !Hyyx; rewrite !Hxyy.
    reflexivity.
Qed.
End Przemiennosc.
