(define (problem shakey-problem)
    (:domain shakey)
    (:objects r1 r2 r3 r4 lobby - room
              b1 - box
              s - shakey 
    )
    
    (:init  (adjoining r1 lobby)
            (adjoining r2 lobby)
            (adjoining r3 lobby)
            (adjoining r4 lobby)
            (not (door-open r1))
            (not (door-open r2))
            (not (door-open r3))
            (not (door-open r4))
            (shakey-at s r1)
            (box-at b1 r3)
    )
    
    (:goal (and (lighted-room r3) 
                (lighted-room r2)
                ;(lighted-room r4)
                (lighted-room r1))
    )
)