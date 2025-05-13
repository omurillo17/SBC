;; Regla 1: Aplicar descuento si un cliente compra más de 2 productos de la misma marca
(defrule descuento-por-cantidad
   (orden (producto ?tipo ?marca ?modelo) (cliente-id ?id) (qty ?q&:(> ?q 2)))
   =>
   (printout t "Descuento aplicado por compra de más de 2 productos de la marca " ?marca crlf))

;; Regla 2: Verificar si hay stock suficiente para una orden
(defrule verificar-stock
   (orden (producto ?tipo ?marca ?modelo) (qty ?q))
   ?producto <- (smartphone (marca ?marca) (modelo ?modelo) (stock ?stock))
   (test (>= ?stock ?q))
   =>
   (printout t "Stock suficiente para " ?modelo crlf))

;; Regla 3: Aplicar 10% de descuento si el producto es "MacBookAir"
(defrule descuento-macbookair
   (orden (producto computadora "Apple" "MacBookAir") (qty ?q))
   =>
   (printout t "Se aplica un descuento del 10% en MacBook Air" crlf))

;; Regla 4: Notificar si el producto no está en stock
(defrule producto-no-disponible
   (orden (producto ?tipo ?marca ?modelo) (qty ?q))
   ?producto <- (smartphone (marca ?marca) (modelo ?modelo) (stock ?stock))
   (test (< ?stock ?q))
   =>
   (printout t "El producto " ?modelo " no tiene suficiente stock." crlf))

;; Regla 5: Aplicar un vale de 100 MXN si la compra es mayor a 5000 MXN
(defrule vale-por-compra-mayor
   (orden (producto ?tipo ?marca ?modelo) (qty ?q) (pago tarjeta-cred))
   ?producto <- (smartphone (modelo ?modelo) (precio ?precio))
   (test (> (* ?precio ?q) 5000))
   =>
   (printout t "Vale de 100 MXN aplicado a la compra mayor a 5000 MXN." crlf))

;; Regla 6: Aplicar 15% de descuento si el pago es con BBVA VISA
(defrule descuento-bbva
   (orden (producto ?tipo ?marca ?modelo) (cliente-id ?id) (pago tarjeta-cred) (tarjeta bbva visa))
   =>
   (printout t "Descuento del 15% aplicado con tarjeta BBVA VISA." crlf))

;; Regla 7: Verificar si el cliente es mayorista
(defrule verificar-mayorista
   (orden (cliente-id ?id) (qty ?q))
   (cliente (cliente-id ?id) (tipo mayorista))
   =>
   (printout t "Cliente mayorista identificado. Aplicando descuentos especiales." crlf))

;; Regla 8: Aplicar descuento de 200 MXN en Galaxy S24 FE si el pago es de contado
(defrule descuento-galaxy-s24-fe
   (orden (producto smartphone "Samsung" "Galaxy S24 FE") (qty ?q) (pago contado))
   =>
   (printout t "Descuento de 200 MXN en Galaxy S24 FE por pago de contado." crlf))

;; Regla 9: Validar que la cantidad solicitada sea mayor que 0
(defrule cantidad-valida
   (orden (producto ?tipo ?marca ?modelo) (qty ?q&:(<= ?q 0)))
   =>
   (printout t "La cantidad solicitada debe ser mayor que 0." crlf))

;; Regla 10: Validar que un cliente no pueda comprar más de 5 unidades de un producto
(defrule limite-compra
   (orden (producto ?tipo ?marca ?modelo) (qty ?q&:(> ?q 5)))
   =>
   (printout t "No se puede comprar más de 5 unidades de " ?modelo crlf))

;; Regla 11: Aplicar descuento del 5% en accesorios si se compra un smartphone
(defrule descuento-accesorio
   (orden (producto smartphone ?marca ?modelo) (cliente-id ?id) (qty ?q))
   (orden (producto accesorio ?marca ?modelo2) (cliente-id ?id) (qty ?q2))
   =>
   (printout t "Descuento del 5% aplicado en accesorios por compra de smartphone." crlf))

;; Regla 12: Verificar si el cliente ha comprado antes
(defrule cliente-recurrente
   (orden (cliente-id ?id))
   (cliente (cliente-id ?id) (nombre ?nombre))
   =>
   (printout t "Cliente recurrente: " ?nombre crlf))

;; Regla 13: Aplicar 10% de descuento si el precio total es mayor a 10000 MXN
(defrule descuento-total
   (orden (producto ?tipo ?marca ?modelo) (qty ?q) (pago tarjeta-cred))
   ?producto <- (smartphone (modelo ?modelo) (precio ?precio))
   (test (> (* ?precio ?q) 10000))
   =>
   (printout t "Descuento del 10% aplicado por compra mayor a 10000 MXN." crlf))

;; Regla 14: Aplicar descuento si la tarjeta de crédito es Apple Mastercard
(defrule descuento-apple-card
   (orden (producto ?tipo ?marca ?modelo) (cliente-id ?id) (pago tarjeta-cred) (tarjeta apple mastercard))
   =>
   (printout t "Descuento aplicado con tarjeta Apple Mastercard." crlf))

;; Regla 15: Notificar si la tarjeta de crédito está vencida
(defrule tarjeta-vencida
   (tarjeta-cred (banco ?banco) (grupo ?grupo) (exp-date ?fecha))
   (test (<= (str-length ?fecha) 0))
   =>
   (printout t "La tarjeta de crédito está vencida." crlf))

;; Regla 16: Aplicar 500 MXN de descuento en productos Apple por compra con Banamex VISA
(defrule descuento-apple-banamex
   (orden (producto smartphone "Apple" ?modelo) (qty ?q) (pago tarjeta-cred) (tarjeta banamex visa))
   =>
   (printout t "Descuento de 500 MXN aplicado en productos Apple con Banamex VISA." crlf))

;; Regla 17: Limitar la compra de productos de alta demanda a 3 unidades
(defrule limite-compra-alta-demanda
   (orden (producto smartphone ?marca ?modelo) (qty ?q&:(> ?q 3)))
   =>
   (printout t "Solo se pueden comprar hasta 3 unidades de " ?modelo " debido a la alta demanda." crlf))

;; Regla 18: Aplicar descuento del 20% en computadoras si se paga con tarjeta Santander
(defrule descuento-computadora-santander
   (orden (producto computadora ?marca ?modelo) (qty ?q) (pago tarjeta-cred) (tarjeta santander visa))
   =>
   (printout t "Descuento del 20% aplicado en computadoras con tarjeta Santander." crlf))

;; Regla 19: Confirmar que la tarjeta de crédito es válida
(defrule tarjeta-valida
   (tarjeta-cred (banco ?banco) (grupo ?grupo) (exp-date ?exp-date))
   =>
   (printout t "La tarjeta de crédito de " ?banco " es válida." crlf))

;; Regla 20: Aplicar descuento si un cliente es mayorista
(defrule descuento-mayorista
   (orden (cliente-id ?id) (qty ?q))
   (cliente (cliente-id ?id) (tipo mayorista))
   =>
   (printout t "Descuento aplicado a cliente mayorista." crlf))
