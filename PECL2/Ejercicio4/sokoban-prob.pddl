(define (problem sokoban-prob)
  (:domain sokoban)
  (:objects
    down left right up - direction

    player1 - player

    pos-01-01 - position
    pos-01-02 - position
    pos-01-03 - position
    pos-01-04 - position
    pos-01-05 - position
    
    pos-02-01 - position
    pos-02-02 - position
    pos-02-03 - position
    pos-02-04 - position
    pos-02-05 - position

    pos-03-01 - position
    pos-03-02 - position
    pos-03-03 - position
    pos-03-04 - position
    pos-03-05 - position

    stone1 - stone

  )
  (:init

    (move-dir pos-01-01 pos-01-02 right)
    (move-dir pos-01-01 pos-02-01 down)
    (move-dir pos-01-02 pos-01-01 left)
    (move-dir pos-01-02 pos-02-02 down)
    (move-dir pos-01-02 pos-01-03 right)
    (move-dir pos-01-03 pos-01-02 left)
    (move-dir pos-01-03 pos-02-03 down)
    (move-dir pos-01-03 pos-01-04 right)
    (move-dir pos-01-04 pos-01-03 left)
    (move-dir pos-01-04 pos-02-04 down)
    (move-dir pos-01-04 pos-01-05 right)
    (move-dir pos-01-05 pos-01-04 left)
    (move-dir pos-01-05 pos-02-05 down)

    (move-dir pos-02-01 pos-01-01 up)
    (move-dir pos-02-01 pos-02-02 right)
    (move-dir pos-02-01 pos-03-01 down)
    (move-dir pos-02-02 pos-02-01 left)
    (move-dir pos-02-02 pos-02-03 right)
    (move-dir pos-02-02 pos-03-02 down)
    (move-dir pos-02-02 pos-01-02 up)
    (move-dir pos-02-03 pos-02-02 left)
    (move-dir pos-02-03 pos-02-04 right)
    (move-dir pos-02-03 pos-03-03 down)
    (move-dir pos-02-03 pos-01-03 up)
    (move-dir pos-02-04 pos-02-03 left)
    (move-dir pos-02-04 pos-02-05 right)
    (move-dir pos-02-04 pos-03-04 down)
    (move-dir pos-02-04 pos-01-04 up)
    (move-dir pos-02-05 pos-02-04 left)
    (move-dir pos-02-05 pos-03-05 down)
    (move-dir pos-02-05 pos-01-05 up)

    (move-dir pos-03-01 pos-03-02 right)
    (move-dir pos-03-01 pos-02-01 up)
    (move-dir pos-03-02 pos-03-01 left)
    (move-dir pos-03-02 pos-02-02 up)
    (move-dir pos-03-02 pos-03-03 right)
    (move-dir pos-03-03 pos-03-02 left)
    (move-dir pos-03-03 pos-02-03 up)
    (move-dir pos-03-03 pos-03-04 right)
    (move-dir pos-03-04 pos-03-03 left)
    (move-dir pos-03-04 pos-02-04 up)
    (move-dir pos-03-04 pos-03-05 right)
    (move-dir pos-03-05 pos-03-04 left)
    (move-dir pos-03-05 pos-02-05 up)

    (at player1 pos-02-02)
    (at stone1 pos-01-04)

    (= (player-weigth player1) 10)
    (= (stone-weigth stone1) 5)

    (= (move-time-player player1) 2)
    (= (move-time-stone stone1) 4)
    (= (total-energy-consumed) 0)

    (clear pos-01-01)
    (clear pos-01-02)
    (clear pos-01-03)
    (clear pos-01-05)
    (clear pos-02-01)
    (clear pos-02-03)
    (clear pos-02-04)
    (clear pos-02-05)
    (clear pos-03-01)
    (clear pos-03-02)
    (clear pos-03-04)
    (clear pos-03-05)

  )
  (:goal 
    (at stone1 pos-01-01)
  )

  (:constraints 
        (and 
            (preference pref1 (always (clear pos-02-03)))
        )
  )

  (:metric minimize
        (+
            (* (is-violated pref1) 10)
            (* (total-time) 15)
            (* (total-energy-consumed) 10)
        )
    )
)