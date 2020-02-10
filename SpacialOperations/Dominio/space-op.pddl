(define (domain space-op)
        (:requirements :strips :typing :equality)
        (:types satellite direction instrument mode)
        (:predicates 
            (power-on ?ins) ;instrumento encendido
            (power-off ?ins) ;instrumento apagado
            (calibrated ?ins) ;instrumento calibrado
            (maintenance ?sat) ;mantenimieto del satelite
            (pointing ?sat ?dir) ;direccion a la que apunta el satelite
            (on-board ?sat) ;satelite en orbita
        )
        
        (:action turn ;El satelite se gira y apunta hacia una direccion
            :parameters (?sat - satellite ?dir1 - direction ?dir2 - direction)
            :precondition (and (on-board ?sat) 
                               (pointing ?sat ?dir1)
                               (not (= ?dir1 ?dir2))
                               (calibrated ?ins)
                          )
            :effect (pointing ?sat ?dir2)
        )
        
        (:action switch-on ;Encender un instrumento del satelite
            :parameters (?ins - instrument ?sat - satellite)
            :precondition (and (power-off ?ins)
                               (on-board ?sat))
            :effect (and (power-on ?ins)
                         (not (power-off ?ins))
                    )
        )
        
        (:action switch-off ;Apagar un instrumento del satelite
            :parameters (?ins - instrument ?sat - satellite)
            :precondition (and (power-on ?ins)
                               (on-board ?sat)
                          )
            :effect (and (not (power-on ?ins))
                         (power-off ?ins))
        )
        
        (:action calibrate ;Calibrar un instrumento en una direccion, el intrumento debe estar encendido
            :parameters (?sat - satellite ?ins - instrument ?dir - direction)
            :precondition (and (power-on ?ins)
                               (on-board ?sat)
                               (pointing ?sat ?dir)
                          )
            :effect (calibrated ?ins)
        )
        
        (:action do-maintenance ;Realizar el mantenimiento del satelite
        
        )



)