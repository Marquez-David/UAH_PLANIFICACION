(define (problem nasa-problem)
    (:domain nasa)
    (:objects r1 - rocket
              Tierra Marte - place
              Astronauta1 Astronauta2 - astronauta)
              
    
    (:init (rocket-at r1 Tierra)
           (astronauta-at Astronauta1 Tierra)
    
    
    )
    
    ;(:goal (and (astronauta-in Astronauta1 r1))
    ;(:goal (and (rocket-at r1 Marte)))
    (:goal (and (astronauta-at Astronauta1 Marte)))
)