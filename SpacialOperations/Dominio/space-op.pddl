(define (domain space-op)
        (:requirements :strips :typing :equality)
        (:types satellite direction instrument)
        (:predicates 
            (power-on ?ins) ;instrumento encendido
            (power-off ?ins) ;instrumento apagado
            (calibrated ?ins ?dir) ;instrumento calibrado
            (maintenance ?sat) ;mantenimieto del satelite
            (pointing ?sat ?dir) ;direccion a la que apunta el satelite
            (on-board ?ins ?sat) ;satelite en orbita
            (have-image ?dir) ;imagen tomada
        )
        
        ;El satelite se gira y apunta hacia una direccion
        (:action turn 
            :parameters (?sat - satellite ?dir1 - direction ?dir2 - direction ?ins - instrument)
            :precondition (and (on-board ?ins ?sat) 
                               (pointing ?sat ?dir1)
                               (not (= ?dir1 ?dir2))
                          )
            :effect (pointing ?sat ?dir2)
        )
        
        ;Enciende un instrumento del satelite
        (:action switch-on
            :parameters (?ins - instrument ?sat - satellite)
            :precondition (power-off ?ins)
            :effect (and (not (power-off ?ins))
                         (power-on ?ins))
        )

        ;Apaga un instrumento del satelite
        (:action switch-off
            :parameters (?ins - instrument ?sat - satellite)
            :precondition (power-on ?ins)
            :effect (and (not (power-on ?ins))
                         (power-off ?ins))
        )
        
        ;Calbra un instrumento del satelite
        (:action calibrate
         :parameters (?sat - satellite ?ins - instrument ?dir - direction)
         :precondition (and (not (calibrated ?ins ?dir))
                            (power-on ?ins)
                            (on-board ?ins ?sat)
                            (pointing ?sat ?dir)
                            )
         :effect (calibrated ?ins ?dir)
        )
        
        ;Realizar el matenimiento
        (:action do-maintenance
         :parameters (?sat - satellite)
         :precondition (not(maintenance ?sat))
         :effect (maintenance ?sat)
         )
        
        ;Tomar una imagen
        (:action take-image
         :parameters (?sat - satellite ?dir - direction ?ins - instrument)
         :precondition (and (calibrated ?ins ?dir)
                            (on-board ?ins ?sat)
                            (power-on ?ins)
                            (pointing ?sat ?dir)
                            (maintenance ?sat)
                            )
         :effect (and (have-image ?dir)
                      (not (maintenance ?sat)))
        ) 
        
        
        
        
        
        
        
        
        
        
        
        
        
        


)