;; ------------- Productos ------------------------------------
(deftemplate smartphone
   (slot marca)  ;; La marca del smartphone
   (slot modelo)  ;; El modelo del smartphone
   (slot color)  ;; El color del smartphone
   (slot precio (type NUMBER))  ;; El precio del smartphone (tipo numérico)
   (slot stock  (type INTEGER)))  ;; El stock disponible del smartphone (tipo entero)

(deftemplate computadora
   (slot marca)  ;; La marca de la computadora
   (slot modelo)  ;; El modelo de la computadora
   (slot color)  ;; El color de la computadora
   (slot precio (type NUMBER))  ;; El precio de la computadora (tipo numérico)
   (slot stock  (type INTEGER)))  ;; El stock disponible de la computadora (tipo entero)

(deftemplate accesorio
   (slot marca)  ;; La marca del accesorio
   (slot modelo)  ;; El modelo del accesorio
   (slot color)  ;; El color del accesorio
   (slot precio (type NUMBER))  ;; El precio del accesorio (tipo numérico)
   (slot stock  (type INTEGER)))  ;; El stock disponible del accesorio (tipo entero)

;; ------------- Clientes -------------------------------------
(deftemplate cliente
  (slot cliente-id) ;; El ID único del cliente (tipo entero)
  (slot nombre) ;; El nombre del cliente
  (slot direccion) ;; La dirección del cliente
  (slot telefono) ;; El teléfono del cliente
  (slot tipo))  ;; Aquí añadimos el slot "tipo" para que las reglas puedan acceder a él
;; ------------- Instrumentos de pago -------------------------
(deftemplate tarjeta-cred
   (slot banco)  ;; El banco emisor de la tarjeta
   (slot grupo)  ;; El grupo de la tarjeta (Visa, Mastercard, etc.)
   (slot exp-date))  ;; La fecha de expiración de la tarjeta

(deftemplate vale
   (slot cantidad (type NUMBER)))  ;; La cantidad del vale (tipo numérico)

;; ------------- Órdenes de compra ----------------------------
;;  - producto  multislot  →  puede contener varios ítems
;;  - tarjeta   multislot  →  dos tokens: banco  grupo
(deftemplate orden
   (multislot producto)         ;; Un producto puede contener varios ítems (ej. smartphone "Apple" "iPhone16")
   (slot cliente-id (type INTEGER))  ;; El ID del cliente que realiza la compra
   (slot qty        (type INTEGER))  ;; La cantidad de productos comprados
   (slot pago)                 ;; El método de pago: contado o tarjeta-cred
   (multislot tarjeta))        ;; Información de la tarjeta usada (ej. banamex visa)

;; ------------- Hecho derivado de clasificación --------------
(deftemplate tipo-cliente
   (slot cliente-id (type INTEGER))  ;; El ID del cliente
   (slot tipo))  ;; El tipo de cliente: menudista o mayorista
