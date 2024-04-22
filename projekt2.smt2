(set-logic NIA)

(set-option :produce-models true)
(set-option :incremental true)

; Deklarace promennych pro vstupy
; ===============================

; Parametry
(declare-fun A () Int)
(declare-fun B () Int)
(declare-fun C () Int)
(declare-fun D () Int)
(declare-fun E () Int)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; START OF SOLUTION ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Zde doplnte vase reseni
(declare-fun x () Int)
(declare-fun y () Int)
(declare-fun z () Int)

; Podmínky pro D a E - musí být kladné
(assert (> D 0))
(assert (> E 0))

; Definice x, y, z podle logiky funkce
(assert (= x (* A B 2)))

; Větvení pro y
(assert (ite (< x E)
             (= y (+ x (* 5 B)))
             (= y (- x C))))

; Větvení pro z
(assert (ite (< (+ y 2) D)
             (= z (- (* x A) (* y B)))
             (= z (+ (* x B) (* y A)))))

; Podmínka pro návratovou hodnotu funkce
(assert (< z (+ E D)))

; Zajištění, že D+E je minimální možné
(assert (forall ((d Int) (e Int))
  (=> (and (> d 0) (> e 0) (< (+ d e) (+ D E)))
      (let ((x_val (* 2 A B))
            (y1_val (ite (< (* 2 A B) e) (+ (* 2 A B) (* 5 B)) (- (* 2 A B) C)))
            (z1_val (ite (< (+ (ite (< (* 2 A B) e) (+ (* 2 A B) (* 5 B)) (- (* 2 A B) C)) 2) d) 
                         (- (* (* 2 A B) A) (* (ite (< (* 2 A B) e) (+ (* 2 A B) (* 5 B)) (- (* 2 A B) C)) B)) 
                         (+ (* (* 2 A B) B) (* (ite (< (* 2 A B) e) (+ (* 2 A B) (* 5 B)) (- (* 2 A B) C)) A)))))
        (not (< z1_val (+ d e)))))))
        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; END OF SOLUTION ;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Testovaci vstupy
; ================

(echo "Test 1 - vstup A=1, B=1, C=3")
(echo "a) Ocekavany vystup je sat a D+E se rovna 2")
(check-sat-assuming (
  (= A 1) (= B 1) (= C 3)
))
(get-value (D E (+ D E)))
(echo "b) Neexistuje jine reseni nez 2, ocekavany vystup je unsat")
(check-sat-assuming (
  (= A 1) (= B 1) (= C 3) (distinct (+ D E) 2)
))


(echo "Test 2 - vstup A=5, B=2, C=5")
(echo "a) Ocekavany vystup je sat a D+E se rovna 54")
(check-sat-assuming (
  (= A 5) (= B 2) (= C 5)
))
(get-value (D E (+ D E)))
(echo "b) Neexistuje jine reseni nez 54, ocekavany vystup je unsat")
(check-sat-assuming (
  (= A 5) (= B 2) (= C 5) (distinct (+ D E) 54)
))

(echo "Test 3 - vstup A=100, B=15, C=1")
(echo "a) Ocekavany vystup je sat a D+E se rovna 253876")
(check-sat-assuming (
  (= A 100) (= B 15) (= C 1)
))
(get-value (D E (+ D E)))
(echo "b) Neexistuje jine reseni nez 253876, ocekavany vystup je unsat")
(check-sat-assuming (
  (= A 100) (= B 15) (= C 1) (distinct (+ D E) 253876)
))

(echo "Test 4 - vstup A=5, B=5, C=3")
(echo "a) Ocekavany vystup je sat a D+E se rovna 51")
(check-sat-assuming (
  (= A 5) (= B 5) (= C 3)
))
(get-value (D E (+ D E)))
(echo "b) Neexistuje jine reseni nez 51, ocekavany vystup je unsat")
(check-sat-assuming (
  (= A 5) (= B 5) (= C 3) (distinct (+ D E) 51)
))

(echo "Test 5 - vstup A=2, B=1, C=2")
(echo "a) Ocekavany vystup je sat a D+E se rovna 7")
(check-sat-assuming (
  (= A 2) (= B 1) (= C 2)
))
(get-value (D E (+ D E)))
(echo "b) Neexistuje jine reseni nez 7, ocekavany vystup je unsat")
(check-sat-assuming (
  (= A 2) (= B 1) (= C 2) (distinct (+ D E) 7)
))
