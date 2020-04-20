(define (domain sokoban)
    (:requirements :typing :strips :durative-actions :fluents)
    (:types thing position direction - object
            player stone - thing
    )

    (:predicates (clear ?l - position) ;determina si una localizacion esta libre
                 (at ?t - thing ?l - position)
                 (move-dir ?from ?to - position ?dir - direction) 
    )

    (:functions (move-time-player ?p - player)
                (move-time-stone ?s - stone)
                (player-weigth ?p - player)
                (stone-weigth ?s - stone)
                (total-energy-consumed)
    )

    ;el jugador se mueve de una posicion a otra
    (:durative-action move
        :parameters (?p - player ?pos1 ?pos2 - position ?dir - direction)
        :duration  (= ?duration (move-time-player ?p))
        :condition (and (at start (at ?p ?pos1))
                        (at start (clear ?pos2))
                        (over all (move-dir ?pos1 ?pos2 ?dir))
                   )
        :effect    (and (at start (not (at ?p ?pos1)))
                        (at start (not (clear ?pos2)))
                        (at end (at ?p ?pos2))
                        (at end (clear ?pos1))
                        (at end (increase (total-energy-consumed) (* (move-time-player ?p) (player-weigth ?p))))
                   )
    )

    ;mueve una roca hacia una posicion que no es la final
    (:durative-action push-stone
        :parameters (?p - player ?s - stone ?ppos ?from ?to - position ?dir - direction)
        :duration (= ?duration (move-time-stone ?s))
        :condition (and (at start (at ?p ?ppos))
                        (at start (at ?s ?from))
                        (at start (clear ?to))
                        (over all (move-dir ?ppos ?from ?dir))
                        (over all (move-dir ?from ?to ?dir))
                   )
        :effect    (and (at start (not (at ?p ?ppos)))
                        (at start (not (at ?s ?from)))
                        (at start (not (clear ?to)))
                        (at end (at ?p ?from))
                        (at end (at ?s ?to))
                        (at end (clear ?ppos))
                        (at end (increase (total-energy-consumed) (* (* (move-time-stone ?s) (stone-weigth ?s)) (player-weigth ?p))))
                   )
    )
)