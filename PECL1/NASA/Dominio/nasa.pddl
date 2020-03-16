(define (domain nasa)
    (:requirements :strips :typing)
    (:types rocket astronauta place)
    (:predicates (rocket-at ?r - rocket ?p - place)
                 (astronauta-at ?a - astronauta ?p - place)
                 (astronauta-in ?a - astronauta ?r - rocket)
                 (on-board ?a ?r)
                 )
    
    
    
  (:action board
   :parameters (?a - astronauta ?r - rocket ?p1 ?p2 - place)
   :precondition (and (rocket-at ?r ?p1)
                      (astronauta-at ?a ?p1)
                      )
    :effect (and (not (astronauta-at ?a ?p1))
                 (astronauta-in ?a ?r)
            )
  )
  
  (:action fly
   :parameters (?a - astronauta ?r - rocket ?p1 ?p2 - place)
   :precondition (and (rocket-at ?r ?p1)
                      (astronauta-in ?a ?r))
    :effect (and (not (rocket-at ?r ?p1))
                 (rocket-at ?r ?p2))
  )
  
  (:action debark
   :parameters (?a - astronauta ?r - rocket ?p1 ?p2 - place)
   :precondition (and (rocket-at ?r ?p2)
                      (astronauta-in ?a ?r)
                 )
    :effect (and (not (astronauta-in ?a ?r))
                 (astronauta-at ?a ?p2))
  )
    
    
    
    
    
    
)