;; monkey-domain
;;
;; 16 June 2018. Daniel Cirne Vilas-Boas
;; dcvs@cin.ufpe.br

(define (domain monkey-domain)
  (:requirements :strips :typing)
  (:types MONKEY BOX BANANA POSITION)
  (:predicates
    (AT ?obj ?pos)
    (ON ?obj ?obj2)
    (MOVE-TO ?pos ?pos)
    (PUSH-BOX ?pos ?pos2)
    (CLIMB-BOX ?pos)
    (GO-DOWN ?pos)
    (GRAB-BANANA ?pos)
	(HAS-BANANA)
    (ON-FLOOR)
  )

  (:action MOVE-TO
  	:parameters
  		 (?pos - POSITION
  		  ?pos2 - POSITION)
  	:precondition
  		(and 	(ON-FLOOR)
  			(AT MONKEY ?pos))
  	:effect
  		(and 	(NOT (AT MONKEY ?pos))
  			(AT MONKEY ?pos2))
    )

    (:action PUSH-BOX
            :parameters
            		(?pos - POSITION
                 ?pos2 - POSITION)
            :precondition
            		(and 	(ON-FLOOR)
                (AT MONKEY ?pos)
            		(AT BOX ?pos))
            :effect
            		(and
            		(NOT (AT MONKEY ?pos))
            		(NOT (AT BOX ?pos))
            		(AT MONKEY ?pos2)
            		(AT BOX ?pos2))
      )

    (:action CLIMB-BOX
        :parameters
        		(?pos - POSITION)
        :precondition
        		(and 	(ON-FLOOR)
            (AT MONKEY ?pos)
        		(AT BOX ?pos)
        		(NOT (ON MONKEY BOX)))
        :effect
        		(and 	(NOT (ON-FLOOR))
        		(ON MONKEY BOX))
    )

    (:action GO-DOWN
            :parameters
              (?pos - POSITION)
            :precondition
              (and 	(ON MONKEY BOX)
              (AT BOX ?pos))
            :effect
              (and 	(NOT (ON MONKEY BOX))
              (ON-FLOOR)
              (AT MONKEY ?pos))
      )

      (:action GRAB-BANANA
            :parameters
                (?pos - POSITION)
            :precondition
                (and 	(ON MONKEY BOX)
                (AT MONKEY ?pos)
                (AT BOX ?pos)
                (AT BANANA ?pos))
            :effect
              (and 	(HAS-BANANA))
      )
)
