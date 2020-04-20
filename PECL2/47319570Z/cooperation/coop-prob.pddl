(define (problem coop-prob)
    (:domain coop-dom)

    (:objects 
            UAV UGV - vehicle
            estacion A B C D - position
            N0 N1 - navMode
            p0 p1 p2 p3 p4 p5 - PAN
            t0 t1 t2 t3 t4 t5 - TILT
    )

    (:init 
        (= (dist A B) 3)
        (= (dist A C) 4)
        (= (dist A D) 6)
        (= (dist B C) 2)
        (= (dist B D) 3)
        (= (dist D C) 5)
        (= (dist estacion A) 7)
        (= (dist estacion B) 7)
        (= (dist estacion C) 10)
        (= (dist estacion D) 4)
        (= (dist B A) 3)
        (= (dist C A) 4)
        (= (dist D A) 6)
        (= (dist C B) 2)
        (= (dist D B) 3)
        (= (dist C D) 5)
        (= (dist A estacion) 7)
        (= (dist B estacion) 7)
        (= (dist C estacion) 10)
        (= (dist D estacion) 4)

        (= (nMode N0) 1)
        (= (nMode N1) 2)

        (= (undock-dock-energy) 10)
        (= (move-energy) 5)
        (= (take-image-energy) 2)
        (= (total-energy-consumed) 0)

        (= (takeImageTime UAV) 2)
        (= (takeImageTime UGV) 4)

        (= (total-t) 0)
        (= (total-distance) 0)

        (at UAV estacion)
        (docked UAV)
        (at UGV estacion)
        (docked UGV)

        (navigationMode UAV N0)
        (navigationMode UGV N1)

        (camera-conected UAV)
        (camera-conected UGV)

        (pointing UAV p0 t0)
        (pointing UGV p0 t0)
    )

    (:goal 
        (and
            ;(at UAV A)
            (imageSent UAV B p2 t1)
            (at UGV D)   
        )
    )

    (:constraints 
        (and 
            (preference UAV-fuera (always (not (docked UAV))))
            (preference UGV-fuera (sometime (not (docked UGV))))
        )

    )

    (:metric minimize
        (+
            (* (is-violated UAV-fuera) 10)
            (* (is-violated UGV-fuera) 5)
            (* (total-t) 15)
            (* (total-energy-consumed) 10)
        )
    )   
)