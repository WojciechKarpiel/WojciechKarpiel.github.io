Rozważania Seby:
(Seba, mając 12 krat, wie, że Karynka ma 6 albo 8 krat.
       (Jeśli Karynka miałaby 6 Krat, to wiedziałaby że Seba ma 12 albo 14 krat
              (Jeśli Seba miałby 14 krat, to wiedziałby że Karynka ma 4 albo 6 krat
                     (Jeśli Karynka miałaby 4 kraty, to wiedziałaby że Seba ma 14 albo 16 krat
                            (Jeśli Seba miałby 16 krat, to wiedziałby że Kartnka ma 2 albo 4 kraty
                                   (Jeśli Karynka miałaby 2 kraty, to wiedziałaby że Seba ma 16 albo 18 krat
                                          (Jeśli Seba miałby 18 krat, to pierwszego ranka powiedziałby że łącznie mają 20 krat => Tak się nie stanie! Karynka 1 wieczora wie, że Seba nie ma 18 krat w oknach)
                                          (Jeśli Seba miałby 16 krat, to pierwszego wieczora Karynka wiedzialaby, że łącznie mają 18 krat => Tak się nie stanie! Seba 2 ranka wie, że Karynka nie ma 2 krat w oknach))
                                   (Jeśli Karynka miałaby 4 kraty, to Seba drugiego ranka powiedziałby że łącznie mają 20 => Tak się nie stanie! Karynka 2 wieczora wie, że Seba nie ma 16 krat w okach))
                            (Jeśli Seba miałby 14 krat, to Karynka 2 wieczora powiedziałaby, że mają łącznie 20 => Tak się nie stanie! Seba 3 ranka wie, że Kartnka nie ma 4 krat w oknach))
                     (Jeśli Karynka miałaby 6 krat, to Seba 3 ranka powiedziałby, że łącznie mają 20 => Tak się nie stanie! Karynka 3 wieczora wie, że Seba nie ma 14 krat w oknach))
              (Jeśli Seba miałby 12 Krat, to Karynka 3 wieczora odpowiedziałaby że łącznie mają 20 => Tak się nie stanie! Seba 4 ranka wie, że Karynka nie ma 6 krat w oknach))
       (Jeśl Karynka miała by 8 krat:))

Rozważania Karynki:


(defun odpowiedź (kto min max)
  (let ((seba-p (eq kto 'seba))
        (min2 (- min 2))
        (max2 (+ max 2)))
    (let ((mial (if seba-p "miał" "miała"))
          (powiedzial (if seba-p "powiedział" "powiedziała"))
          (wiedzialby (if seba-p "wiedziałby" "wiedziałaby"))
          (sym (if seba-p "K" "S"))
          (sym2 (if seba-p "S" "K")))
      (format "%d <= %s <= %d (bo gdyby %s %d to %s że razem mają %d na podstawie %d<=%s, a gdyby %s %d to %s że razem mają %d na podstawie %s<=%d)"
              min sym2 max
              mial max2 powiedzial 20 min2 sym
              mial min2 powiedzial 18 sym max2))))

(odpowiedź 'sebaq 4 16)
