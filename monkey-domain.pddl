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
    (MOVE-FROM-TO ?obj ?pos ?pos2)
    (PUSH ?obj ?obj2 ?pos ?pos2)
    (CLIMB ?obj ?obj2 ?pos)
    (GO-DOWN ?obj ?obj2 ?pos)
    (GRAB ?obj ?obj2 ?pos)
	(HOLDING ?obj ?obj2)
    (ON-FLOOR ?obj)
    (ON-TOP ?obj)
  )

  (:action MOVE-FROM-TO
  	:parameters
  		 (?obj - MONKEY
  		  ?pos - POSITION
  		  ?pos2 - POSITION
  		  )
  	:precondition
  		(and 	(ON-FLOOR ?obj)
  		 (AT ?obj ?pos))
  	:effect
  		(and
  			(NOT (AT ?obj ?pos))
  			(AT ?obj ?pos2)
        )
    )

    (:action PUSH
            :parameters
            		(?obj - MONKEY
            		?obj2 - BOX
            		?pos - POSITION
                 ?pos2 - POSITION)
            :precondition
            		(and 	(ON-FLOOR ?obj)
            		(ON-FLOOR ?obj2)
                    (AT ?obj ?pos)
            		(AT ?obj2 ?pos))
            :effect
            		(and
            		(NOT (AT ?obj ?pos))
            		(NOT (AT ?obj2 ?pos))
            		(AT ?obj ?pos2)
            		(AT ?obj2 ?pos2))
      )

    (:action CLIMB
        :parameters
        		(   ?obj - MONKEY
        		    ?obj2 - BOX
        		    ?pos - POSITION)
        :precondition
        		(and 	(ON-FLOOR ?obj)
                (AT ?obj ?pos)
        		(AT ?obj2 ?pos)
        		(NOT (ON ?obj ?obj2)))
        :effect
        		(and 	(NOT (ON-FLOOR ?obj))
        		(ON-TOP ?obj)
        		(ON ?obj ?obj2))
    )

    (:action GO-DOWN
            :parameters
              (?obj - MONKEY
               ?obj2 - BOX
               ?pos - POSITION)
            :precondition
              (and 	(ON ?obj ?obj2)
               (ON-TOP ?obj)
               (AT ?obj ?pos)
               (AT ?obj2 ?pos))
            :effect
              (and 	(NOT (ON ?obj ?obj2))
              (NOT (ON-TOP ?obj))
              (ON-FLOOR ?obj)
              (AT ?obj ?pos)
      ))

      (:action GRAB
            :parameters
                (?pos - POSITION
				 ?obj - MONKEY
				 ?obj2 - BANANA)
            :precondition
                (and 
                ;;monkey and banana must be on the same height
                (or (and (ON-TOP ?obj) (ON-TOP ?obj2))
                (and(ON-FLOOR ?obj) (ON-FLOOR ?obj2)))
                (AT ?obj ?pos)
				(AT ?obj2 ?pos)
				)
				
            :effect
              (and 	(HOLDING ?obj ?obj2))
      )
)
