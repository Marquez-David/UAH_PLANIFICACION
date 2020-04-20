(define (domain coop-prob)
    (:requirements :typing :strips :durative-actions :equality :negative-preconditions :fluents :preferences)

    (:types vehicle position navMode PAN TILT)

    (:predicates 
        (navigationMode ?v - vehicle ?m - navMode) ;determina el modo de navegacion de los vehiculos N0/N1
        (at ?v - vehicle ?pos - position) ;posicion en la que se encuentra el uav/ugv
        (docked ?v - vehicle) ;el vehiculo esta atracado en la estacion base
        (undocked ?v - vehicle) ;el vehiculo no esta tracado en la estacion base
        (moving ?v - vehicle) ;el vehiculo se esta moviendo
        (pointing ?v - vehicle ?p - PAN ?t - TILT) ;indica hacia que direccion esta apuntando el vehiculo
        (camera-conected ?v - vehicle) ;indica si la camare de un vehiculo esta conectada o no
        (imageTaken ?v - vehicle ?pos - position ?p - PAN ?t - TILT) ;indica si la imagen ya ha sido tomada
        (imageSent ?v - vehicle ?pos - position ?p - PAN ?t - TILT) ;indica si la imagen ha sido enviada por el vehiculo
    )

    (:functions 
        (dist ?pos1 ?pos2 - position) ;distancia entre dos posiciones
        (nMode ?m - navMode) ;define el modod e navegacion
        (total-t) ;determina el tiempo en el que ha transucrrido la mission
        (takeImageTime ?v - vehicle) ;determina el tiempo que tarda un vehiculo en tomar una imagen
        (total-distance) ;distancia total recorrida por todos los vehiculos
        (undock-dock-energy)
        (move-energy)
        (take-image-energy)
        (total-energy-consumed) ;energia total consumida por los vehiculos
    )

    ;El vehiculo se mueve de una posicion a otra con un modo de navegacion definido N0 o N1
    (:durative-action move
        :parameters (?v - vehicle ?pos1 ?pos2 - position ?m - navMode)
        :duration (= ?duration (/ (dist ?pos1 ?pos2) (nMode ?m)))
        :condition (and 
                        (at start (at ?v ?pos1))
                        (at start (not (= ?pos1 ?pos2)))
                        (at start (undocked ?v))
                        (at start (moving ?v))
                        (at start (navigationMode ?v ?m))
                    )
        :effect (and 
                    (at end (at ?v ?pos2))
                    (at start (not (at ?v ?pos1)))
                    (at end (increase (total-t) (/ (dist ?pos1 ?pos2) (nMode ?m))))
                    (at end (increase (total-distance) (dist ?pos1 ?pos2)))
                    (at end (increase (total-energy-consumed) (* (dist ?pos1 ?pos2) (move-energy))))
                )
    )

    ;El vehiculo se prepara atracar en la estacion base
    (:durative-action dock
        :parameters (?v - vehicle)
        :duration (= ?duration 1)
        :condition (at start (undocked ?v))
        :effect (and 
                    (at end (docked ?v))
                    (at end (increase (total-t) 1))
                    (at end (increase (total-energy-consumed) (undock-dock-energy)))
                )

    )

    ;El vehiculo se prepara para salir de la estacion base
    (:durative-action undock
        :parameters (?v - vehicle)
        :duration (= ?duration 1)
        :condition (at start (docked ?v))
        :effect (and 
                    (at start (undocked ?v))
                    (at end (moving ?v))
                    (at end (increase (total-t) 1))
                    (at end (increase (total-energy-consumed) (undock-dock-energy)))
                )
            
    )

    ;El vehiculo cambia el modo de navegacion
    (:durative-action changeNavMode
        :parameters (?v - vehicle ?m - navMode)
        :duration (= ?duration 1)
        :condition (at start (moving ?v))
        :effect (and 
                    (at start (navigationMode ?v ?m))
                    (at end (increase (total-t) 1))
                )
    )

    ;Toma una imagen a una determinada posicion y altitud
    (:durative-action takeImage
        :parameters (?v - vehicle ?pos - position ?p - PAN ?t - TILT)
        :duration (= ?duration (takeImageTime ?v))
        :condition (and 
                        (at start (at ?v ?pos))
                        (at start (pointing ?v ?p ?t))
                    )
        :effect (and 
                    (at end (imageTaken ?v ?pos ?p ?t))
                    (at end (increase (total-t) (takeImageTime ?v)))
                    (at end (increase (total-energy-consumed) (take-image-energy)))
                )
    )

    ;Calibra la camare del vehiculo para que apunte a una direccion deseada
    (:durative-action point
        :parameters (?v - vehicle ?p - PAN ?t - TILT)
        :duration (= ?duration 1)
        :condition (at start (camera-conected ?v))
        :effect (and 
                    (at end (pointing ?v ?p ?t))
                    (at end (increase (total-t) 1))
                )   
    )

    (:durative-action sendImage
        :parameters (?v - vehicle ?pos - position ?p - PAN ?t - TILT)
        :duration (= ?duration 1)
        :condition (at start (imageTaken ?v ?pos ?p ?t))
        :effect (and 
                    (at end (imageSent ?v ?pos ?p ?t))
                    (at end (increase (total-t) 1))
                )
    )




)