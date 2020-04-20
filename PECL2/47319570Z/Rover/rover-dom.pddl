(define (domain rover-dom)

    (:requirements :typing :strips :durative-actions :fluents)
    (:types rover localizacion muestra imagen mensaje)

    (:functions (cantidad-bateria ?r - rover);bateria del rover
                (tamanno-bateria ?r - rover) ;tamanno del tanque de bateria del rover
                (distancia ?l1 - localizacion ?l2 - localizacion);distancia entre dos puntos
                (velocidad ?r - rover);velocidad del rover
                (velocidad-rapida ?r - rover);velocidad rapida, consume mas bateria
                (tamanno-mensaje ?j - mensaje);tamano del mensaje a enviar
                (velocidad-envio);velocidad a la que se envian los mensajes 
                (tiempo-tomar-imagen ?i - imagen) ;tiempo en tomar una imagen determinada
                (tiempo-tomar-muestra ?m - muestra) ;tiempo en tomar una muestra determinada 
                (tiempo-recargar-bateria) ;tiempo en el que el rover carga totalmente su bateria      
    )

    (:predicates (at ?r - rover ?l - localizacion)
                 (muestra-tomada ?m - muestra ?l - localizacion)
                 (imagen-tomada ?i - imagen ?l - localizacion)
                 (mensaje-enviado ?j - mensaje ?l - localizacion)
    )

    ;El rover se mueve de una posicion a otra
    (:durative-action mover
        :parameters (?r - rover ?l1 - localizacion ?l2 - localizacion)
        :duration (= ?duration (/ (distancia ?l1 ?l2) (velocidad ?r))) ;tiempo = espacio/velocidad 
        :condition (and (at start (at ?r ?l1))
                        (at start (> (cantidad-bateria ?r) 4)))
        :effect (and (at start (not (at ?r ?l1)))
                     (at end (at ?r ?l2))
                     (at start (decrease (cantidad-bateria ?r) 4)))
    )

    (:durative-action mover-rapido
        :parameters (?r - rover ?l1 - localizacion ?l2 - localizacion)
        :duration (= ?duration (/ (distancia ?l1 ?l2) (velocidad-rapida ?r))) ;tiempo = espacio/velocidad 
        :condition (and (at start (at ?r ?l1))
                        (at start (> (cantidad-bateria ?r) 6)))
        :effect (and (at start (not (at ?r ?l1)))
                     (at end (at ?r ?l2))
                     (at start (decrease (cantidad-bateria ?r) 6)))
    )
    

    ;El rover toma una muestra de la superficie marciana
    (:durative-action tomar-muestra
        :parameters (?r - rover ?l - localizacion ?m - muestra)
        :duration (= ?duration 2)
        :condition (and (at start(at ?r ?l))
                        (over all (at ?r ?l)));mientras este tomando la muestra, el rover debe estar parado en l
        :effect (and(at start (muestra-tomada ?m ?l)))
    )

    ;El rover toma una imagen
    (:durative-action tomar-imagen
        :parameters (?r - rover ?l - localizacion ?i - imagen)
        :duration (= ?duration (tiempo-tomar-imagen ?i))
        :condition (and (at start (at ?r ?l))
                        (over all (at ?r ?l)));mientras este tomando la muestra, el rover debe estar parado en l
        :effect (at start (imagen-tomada ?i ?l))
    )

    ;El rover envia un mensaje determinado a tierra
    (:durative-action contactar-tierra
        :parameters (?r - rover ?l - localizacion ?j - mensaje)
        :duration (= ?duration (/ (tamanno-mensaje ?j)(velocidad-envio)))
        :condition (and (at start (at ?r ?l))
                        (over all (at ?r ?l)))
        :effect (at start (mensaje-enviado ?j ?l))
    )

    ;El rover carga su bateria briendo los paneles solares
    (:durative-action recargar-bateria
        :parameters (?r - rover ?l - localizacion)
        :duration (= ?duration (tiempo-recargar-bateria))
        :condition (and (at start (at ?r ?l))
                        (over all (at ?r ?l))
                        (at start (< (cantidad-bateria ?r) 4)))
        :effect (at end (increase (cantidad-bateria ?r) (tamanno-bateria ?r)))
    )

)
