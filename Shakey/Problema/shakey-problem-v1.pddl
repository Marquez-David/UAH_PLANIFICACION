(define (problem shakey-problem)
    (:domain shakey)
    (:objects r1 r2 r3 r4 - room
              b1 - box
              s - shakey 
    )
    
    (:init (shakey-at s r1)
           (box-at b1 r3)
    )
    
    (:goal (and (lighted-room r3) 
                (lighted-room r2))
    )
)