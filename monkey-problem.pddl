;;

(define (problem monkey)
    (:domain monkey-domain)
    (:objects
        positionA - POSITION
        positionB - POSITION
        positionC - POSITION
        positionD - POSITION
        positionE - POSITION
        monkey - MONKEY
        box - BOX
        banana - banana
    )
    (:init
      (AT monkey positionA)
      (AT box positionB)
      (AT box positionD)
      (AT banana positionB)
      (AT banana positionE)
      (ON-FLOOR)
    )
    (:goal
      (and
  	      (AT monkey positionA)
          (HAS-BANANA)
      )
    )
)
