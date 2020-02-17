(define (problem shakey-door-problem)
    (:domain shakey-door)
    (:objects r1 r2 r3 r4 - room
              b1 - box
              s - shakey 
    )
    
    (:init (shakey-at s r1)
           (box-at b1 r3)
           (not (door-open r1))
           (not (door-open r2))
           (not (door-open r3))
           (not (door-open r4))
    )
    
    (:goal (and (lighted-room r3) 
                (lighted-room r2)
                (lighted-room r4))
    )
)