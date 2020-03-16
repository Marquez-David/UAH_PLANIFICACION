(define (domain blocks)
    (:requirements :strips)
    (:predicates 
        (on ?x ?y)
        (on-table ?x)
        (clear ?x)
        (handempty)
        (holding ?x)
        )
        
    (:action pick-up ;El brazo robot coge el bloque
        :parameters (?x)
        :precondition (and (clear ?x) (handempty) (on-table ?x))
        :effect (and(holding ?x) 
                    (not (handempty)) 
                    (not (on-table ?x))
                    (not (clear ?x))
                    )
    )
    
    (:action unstack ;El brazo robot quita un bloque de la pila
       :parameters (?x ?y)
       :precondition (and (on ?x ?y) (clear ?x) (handempty))
       :effect (and (holding ?x)
                    (clear ?y)
                    (not (clear ?x))
                    (not (handempty))
                    (not (on ?x ?y)))
   )  
   
  (:action stack ;El brazo robot pone un bloque en la pila
       :parameters (?x ?y)
       :precondition (and (holding ?x) (clear ?y))
       :effect
       (and (not (clear ?y))
            (clear ?x)
            (not (holding ?x))
            (handempty)
            (on ?x ?y)
       )
   )
   
  (:action put-down ;El brazo robot suelta el bloque en la mesa
       :parameters (?x)
       :precondition (holding ?x) 
       :effect 
       (and (not (holding ?x))
            (clear ?x)
            (on-table ?x)
       )
   )  
)

    