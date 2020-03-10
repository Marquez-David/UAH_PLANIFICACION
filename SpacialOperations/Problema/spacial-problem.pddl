(define (problem spacial-problem)
    (:domain space-op)
    (:objects dir1 dir2 dir3 dir4 - direction
              sat - satellite
              ins - instrument)
              
    (:init (pointing sat dir1)
           (on-board ins sat)
           (power-off ins)
           )
           
    (:goal (and (pointing sat dir2)
                (power-on ins)
                (calibrated ins dir2)
                (have-image dir4)
                ))
)