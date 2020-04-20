(define (problem rover-prob)
	(:domain rover-dom)
	(:objects 
	    r1 - rover
	    point1 point2 point3 - localizacion
        muestra1 - muestra
        imagen1 imagen2 - imagen
        m - mensaje
    )


    (:init 
           (at r1 point1)
           (= (cantidad-bateria  r1) 5)
           (= (distancia point1 point2) 20)
           (= (distancia point2 point1) 20)
           (= (distancia point1 point3) 40)
           (= (distancia point3 point1) 40)
           (= (distancia point2 point3) 20)
           (= (distancia point3 point2) 20)
           (= (velocidad r1) 5)
           (= (velocidad-rapida r1) 10)
           (= (tiempo-tomar-imagen imagen1) 3)
           (= (tiempo-tomar-imagen imagen2) 1)
           (= (tiempo-tomar-muestra muestra1) 5)
           (= (tamanno-mensaje m) 1024)
           (= (velocidad-envio) 100)
           (= (tamanno-bateria r1) 50)
           (= (tiempo-recargar-bateria) 10)
    )

    (:goal (and (muestra-tomada muestra1 point3)
                (imagen-tomada imagen2 point2)
                (mensaje-enviado m point3)
                (at r1 point1)
            )
    )

    (:metric minimize (total-time))



)
