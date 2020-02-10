(define (problem spacial-problem)
    (:domain space-op)
    (:objects dir1 dir2 - direction
              sat - satellite
              ins - instrument)
              
    (:init (pointing sat dir1)
           (on-board sat)
           (power-off ins))
           
    (:goal (power-on ins))
)