(define (domain lift-dom)
  (:requirements :typing :durative-actions :fluents)
  (:types lift - object
          slow-lift fast-lift - lift 
          person - object 
          floor - object
  )

    (:predicates 
	    (person-at ?p - person ?f - floor)
	    (boarded ?p - person ?l - lift)
	    (lift-at ?l - lift ?f - floor)
	    (reachable ?l - lift ?f - floor)
	    (above ?f1 - floor ?f2 - floor)
	    (persons ?l - lift ?f - floor)
	    (can-hold ?l - lift ?f - floor)
	    (next ?f1 - floor ?f2 - floor)
    )

    (:functions 
            (travel-slow ?f1 - floor ?f2 - floor)
            (travel-fast ?f1 - floor ?f2 - floor)
    )

    (:durative-action move-up-slow
        :parameters (?l - slow-lift ?f1 - floor ?f2 - floor )
        :duration (= ?duration (travel-slow ?f1 ?f2))
        :condition (and (at start (lift-at ?l ?f1)) 
                        (at start (above ?f1 ?f2)) 
                        (at start (reachable ?l ?f2)) 
                    )
        :effect (and (at end (lift-at ?l ?f2)) 
                     (at start (not (lift-at ?l ?f1))) 
                )
    )

    (:durative-action move-down-slow
        :parameters (?l - slow-lift ?f1 - floor ?f2 - floor )
        :duration (= ?duration (travel-slow ?f2 ?f1))
        :condition (and (at start (lift-at ?l ?f1)) 
                        (at start (above ?f2 ?f1)) 
                        (at start (reachable ?l ?f2)) 
                    )
        :effect (and (at end (lift-at ?l ?f2)) 
                     (at start (not (lift-at ?l ?f1))) 
                )
    )

    (:durative-action move-up-fast
        :parameters (?l - fast-lift ?f1 - floor ?f2 - floor )
        :duration (= ?duration (travel-fast ?f1 ?f2))
        :condition (and (at start (lift-at ?l ?f1)) 
                        (at start (above ?f1 ?f2)) 
                        (at start (reachable ?l ?f2)) 
                    )
        :effect (and (at end (lift-at ?l ?f2)) 
                     (at start (not (lift-at ?l ?f1))) 
                )
    )

    (:durative-action move-down-fast
        :parameters (?l - fast-lift ?f1 - floor ?f2 - floor )
        :duration (= ?duration (travel-fast ?f2 ?f1))
        :condition (and (at start (lift-at ?l ?f1)) 
                        (at start (above ?f2 ?f1)) 
                        (at start (reachable ?l ?f2)) 
                    )
        :effect (and (at end (lift-at ?l ?f2)) 
                    (at start (not (lift-at ?l ?f1))) 
                )
    )

    (:durative-action board
        :parameters (?p - person ?l - lift ?f - floor)
        :duration (= ?duration 1)
        :condition (and (over all (lift-at ?l ?f)) 
                        (at start (person-at ?p ?f)) 
                        ;(at start (persons ?l ?n1)) 
                        ;(at start (next ?n1 ?n2)) 
                        ;(at start (can-hold ?l ?n2)) 
                    )
        :effect (and (at start (not (person-at ?p ?f))) 
                     (at end (boarded ?p ?l)) 
                     ;(at start (not (persons ?l ?n1))) 
                     ;(at end (persons ?l ?n2)) 
                )
    )

    (:durative-action leave 
        :parameters (?p - person ?l - lift ?f - floor)
        :duration (= ?duration 1)
        :condition (and  (over all (lift-at ?l ?f)) 
                         (at start (boarded ?p ?l)) 
                         ;(at start (persons ?l ?n1)) 
                         ;(at start (next ?n2 ?n1)) 
                    )
        :effect (and (at end (person-at ?p ?f)) 
                     (at start (not (boarded ?p ?l))) 
                     ;(at start (not (persons ?l ?n1))) 
                     ;(at end (persons ?l ?n2)) 
                )
    )
  
)














)