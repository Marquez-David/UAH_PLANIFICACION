(define (problem lift-prob)

    (:domain lift-dom)

    (:objects n0 n1 n2 n3 n4 n5 - floor
	      david adrian - person
	      fast-lift - fast-lift
          slow-lift - slow-lift
    )

    (:init (lift-at fast-lift n4)
           (lift-at slow-lift n3)

           (person-at david n1)
           (person-at adrian n2)

           (= (travel-fast n0 n1) 1) (= (travel-fast n0 n2) 2) (= (travel-fast n0 n3) 3) (= (travel-fast n0 n4) 4) (= (travel-fast n0 n5) 5)
           (= (travel-fast n1 n2) 1) (= (travel-fast n1 n3) 2) (= (travel-fast n1 n4) 3) (= (travel-fast n1 n5) 4)
           (= (travel-fast n2 n3) 1) (= (travel-fast n2 n4) 2) (= (travel-fast n2 n5) 3)
           (= (travel-fast n3 n4) 1) (= (travel-fast n3 n5) 2)
           (= (travel-fast n4 n5) 1)

           (= (travel-fast n5 n4) 1) (= (travel-fast n5 n3) 2) (= (travel-fast n5 n2) 3) (= (travel-fast n5 n1) 4) (= (travel-fast n5 n0) 5)
           (= (travel-fast n4 n3) 1) (= (travel-fast n4 n2) 2) (= (travel-fast n4 n1) 3) (= (travel-fast n4 n0) 4)
           (= (travel-fast n3 n2) 1) (= (travel-fast n3 n1) 2) (= (travel-fast n3 n0) 3)
           (= (travel-fast n2 n1) 1) (= (travel-fast n2 n0) 2)
           (= (travel-fast n1 n0) 1)

           (= (travel-slow n0 n1) 2) (= (travel-slow n0 n2) 4) (= (travel-slow n0 n3) 6) (= (travel-slow n0 n4) 8) (= (travel-slow n0 n5) 10)
           (= (travel-slow n1 n2) 2) (= (travel-slow n1 n3) 4) (= (travel-slow n1 n4) 6) (= (travel-slow n1 n5) 8)
           (= (travel-slow n2 n3) 2) (= (travel-slow n2 n4) 4) (= (travel-slow n2 n5) 6)
           (= (travel-slow n3 n4) 2) (= (travel-slow n3 n5) 4)
           (= (travel-slow n4 n5) 2)

           (= (travel-slow n5 n4) 2) (= (travel-slow n5 n3) 4) (= (travel-slow n5 n2) 6) (= (travel-slow n5 n1) 8) (= (travel-slow n5 n0) 10)
           (= (travel-slow n4 n3) 2) (= (travel-slow n4 n2) 4) (= (travel-slow n4 n1) 6) (= (travel-slow n4 n0) 8)
           (= (travel-slow n3 n2) 2) (= (travel-slow n3 n1) 4) (= (travel-slow n3 n0) 6)
           (= (travel-slow n2 n1) 2) (= (travel-slow n2 n0) 4)
           (= (travel-slow n1 n0) 2)

           (above n0 n1) 
           (above n0 n2) (above n1 n2)
           (above n0 n3) (above n1 n3) (above n2 n3)
           (above n0 n4) (above n1 n4) (above n2 n4) (above n4 n4)
           (above n0 n5) (above n1 n5) (above n2 n5) (above n3 n5) (above n4 n5)

           (reachable fast-lift n0)
           (reachable fast-lift n2)
           (reachable fast-lift n4)

           (reachable slow-lift n0)
           (reachable slow-lift n1)
           (reachable slow-lift n2)
           (reachable slow-lift n3)
           (reachable slow-lift n4)
           (reachable slow-lift n5)
    )

    (:goal (and (person-at david n5)
                (person-at adrian n0)
           )
    )

    (:metric minimize(total-time))

)