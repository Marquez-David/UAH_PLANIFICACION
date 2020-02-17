(define (domain shakey-door)
    (:requirements :strips :typing :equality)
    (:types room shakey box)
    (:predicates (shakey-at ?s - shakey ?x - room) ;Donde esta shakey
                 (box-at ?b - box ?x - room) ;Donde esta el objeto
                 (over-box ?s - shakey ?b - box) ;Shakey esta encima de la caja
                 (lighted-room ?x - room) ;La luz de la habitacion esta encendida
                 (door-open ?x - room)
                 )
    
    ;Shakey abre la puerta de una habitacion
    (:action open
        :parameters (?x - room)
        :precondition (not (door-open ?x))
        :effect (door-open ?x)
    )
    
    ;Shakey se mueve de un lugar x a un lugar y
    (:action move 
        :parameters (?x - room ?y - room ?s - shakey)
        :precondition (and (shakey-at ?s ?x) 
                           (not (= ?x ?y))
                           (door-open ?x)
                           (door-open ?y))
        :effect (and (shakey-at ?s ?y) 
                     (not(shakey-at ?s ?x)))              
    
    )
    
    ;Shakey empuja un objeto desde x hasta un lugar y
    (:action push
        :parameters (?x - room ?y - room ?b - box ?s - shakey)
        :precondition (and (shakey-at ?s ?x)
                           (box-at ?b ?x)
                           (not (= ?x ?y))
                           (door-open ?x)
                           (door-open ?y))
        :effect (and (box-at ?b ?y)
                     (shakey-at ?s ?y)
                     (not (box-at ?b ?x))
                     (not (shakey-at ?s ?x)))
    )
    
    ;Shakey sube a una caja
    (:action climb-up
        :parameters (?s - shakey ?b - box ?x - room)
        :precondition (and (shakey-at ?s ?x)
                            (box-at ?b ?x)
                            (not (over-box ?s ?b)))
        :effect (over-box ?s ?b)
    )
    
    ;Shakey baja de una caja
    (:action climb-down
        :parameters (?s - shakey ?b - box ?x - room)
        :precondition (and (shakey-at ?s ?x)
                            (box-at ?b ?x)
                            (over-box ?s ?b))
        :effect (not (over-box ?s ?b))
    )
    
    ;Shakey enciende la luz de una habitacion
    (:action switch-on
        :parameters (?s - shakey ?b - box ?x - room)
        
        ;Para poder encender la luz shakey debe estar encima de una caja
        :precondition (and (over-box ?s ?b)
                           (not (lighted-room ?x))
                           (shakey-at ?s ?x))
        :effect (lighted-room ?x)
    )
    
    (:action switch-off
        :parameters (?s - shakey ?b - box ?x - room)
        
        ;Para poder apagar la luz shakey debe estar encima de una caja
        :precondition (and (over-box ?s ?b)
                           (lighted-room ?x))
        :effect (not (lighted-room ?x))
    )
    
)