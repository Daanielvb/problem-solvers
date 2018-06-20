;;

(define (problem monkey)
    (:domain monkey-domain)
    (:objects
        positionA - POSITION
        positionB - POSITION
        positionC - POSITION
        monkey - MONKEY
        box - BOX
        banana - BANANA
    )
    (:init
      (AT monkey positionA)
      (AT box positionB)
      (AT banana positionC)
      (ON-FLOOR monkey)
      (ON-FLOOR box)
      (ON-TOP banana)
    )
    (:goal
      (and
  	      (AT monkey positionA)
  	      (ON-FLOOR monkey)
  	      (HOLDING monkey banana)
  	      
      )
    )
)
