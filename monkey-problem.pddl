;;

(define (problem monkey)
    (:domain monkey-domain)
    (:objects
        positionA - POSITION
        positionB - POSITION
        positionC - POSITION
        monkey - MONKEY
        box - BOX
        banana - banana
    )
    (:init
      (AT monkey positionA)
      (AT box positionB)
      (AT banana positionC)
      (ON-FLOOR)
    )
    (:goal
      (and
  	      (AT monkey positionA)
          (HAS-BANANA)
          (ON-FLOOR)
      )
    )
)
