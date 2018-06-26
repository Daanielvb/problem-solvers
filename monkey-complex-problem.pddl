;; monkey-complex-problem
;;
;; 25 June 2018. Daniel Cirne Vilas-Boas
;; dcvs@cin.ufpe.br

(define (problem monkey)
    (:domain monkey-domain)
    (:objects
        positionA - POSITION
        positionB - POSITION
        positionC - POSITION
        positionD - POSITION
        monkey - MONKEY
        box - BOX
        banana - BANANA
        banana2 - BANANA
    )
    (:init
      (AT monkey positionA)
      (AT box positionC)
      (AT banana positionC)
      (AT banana2 positionD)
      (ON-FLOOR monkey)
      (ON-FLOOR box)
      (ON-TOP banana)
      (ON-TOP banana2)
    )
    (:goal
      (and
  	      (AT monkey positionA)
  	      (ON-FLOOR monkey)
  	      (HOLDING monkey banana)
  	      (HOLDING monkey banana2)
      )
    )
)
