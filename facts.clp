(deffacts inventario-inicial
  ;;================ Smartphones ==============================
  (smartphone (marca "Apple")    (modelo "iPhone16")    (color "Rojo")   (precio 27000) (stock 25))
  (smartphone (marca "Samsung")  (modelo "Note21")      (color "Negro")  (precio 22000) (stock 40))
  (smartphone (marca "Xiaomi")   (modelo "RedmiNote12") (color "Azul")   (precio  8500) (stock 70))
  (smartphone (marca "Motorola") (modelo "Edge30")      (color "Verde")  (precio 13000) (stock 20))
  (smartphone (marca "Huawei")   (modelo "P50")         (color "Gris")   (precio 18000) (stock 15))

  ;;================ Computadoras =============================
  (computadora (marca "Apple")   (modelo "MacBookAir")  (color "Gris")   (precio 47000) (stock 12))
  (computadora (marca "Dell")    (modelo "Inspiron15")  (color "Plata")  (precio 28000) (stock 30))
  (computadora (marca "HP")      (modelo "Pavilion14")  (color "Negro")  (precio 19000) (stock 25))
  (computadora (marca "Lenovo")  (modelo "ThinkPadE14") (color "Negro")  (precio 21000) (stock 20))
  (computadora (marca "Acer")    (modelo "Swift3")      (color "Blanco") (precio 16000) (stock 18))

  ;;================ Accesorios ===============================
  (accesorio (marca "Generic")   (modelo "Funda Celular")  (color "Negro")        (precio  300) (stock 200))
  (accesorio (marca "Generic")   (modelo "Mica Celular")   (color "Transparente") (precio  150) (stock 300))
  (accesorio (marca "Apple")     (modelo "AirPods")        (color "Blanco")       (precio 4000) (stock  50))
  (accesorio (marca "Samsung")   (modelo "GalaxyWatch")    (color "Negro")        (precio 5500) (stock  40))
  (accesorio (marca "Generic")   (modelo "Mochila Laptop") (color "Gris")         (precio  800) (stock  60))

  ;;================ Clientes =================================
  (cliente (cliente-id 101) (nombre "Ana Pérez")    (direccion "Guadalajara") (telefono "33-1111"))
  (cliente (cliente-id 102) (nombre "Luis Gómez")   (direccion "CDMX")        (telefono "55-2222"))
  (cliente (cliente-id 103) (nombre "Elisa Ruiz")   (direccion "Puebla")      (telefono "22-3333"))
  (cliente (cliente-id 104) (nombre "Mario Lara")   (direccion "León")        (telefono "47-4444"))
  (cliente (cliente-id 999) (nombre "Mayorista SA") (direccion "Monterrey")   (telefono "81-5555"))

  ;;================ Tarjetas de crédito ======================
  (tarjeta-cred (banco banamex)   (grupo visa)       (exp-date "01-12-26"))
  (tarjeta-cred (banco bbva)      (grupo visa)       (exp-date "10-10-25"))
  (tarjeta-cred (banco liverpool) (grupo visa)       (exp-date "05-11-24"))
  (tarjeta-cred (banco apple)     (grupo mastercard) (exp-date "08-09-28"))
   
  ;; Orden 1: iPhone 16 con Banamex VISA
  (orden (producto smartphone "Apple" "iPhone16") (cliente-id 101) (qty 2) (pago tarjeta-cred) (tarjeta banamex visa))

  ;; Orden 2: MacBook Air con pago en contado
  (orden (producto computadora "Apple" "MacBookAir") (cliente-id 102) (qty 1) (pago contado))

  ;; Orden 3: Galaxy S24 FE con BBVA VISA
  (orden (producto smartphone "Samsung" "Galaxy S24 FE") (cliente-id 103) (qty 3) (pago tarjeta-cred) (tarjeta bbva visa))

  ;; Orden 4: Galaxy A06 con Santander Mastercard
  (orden (producto smartphone "Samsung" "Galaxy A06") (cliente-id 104) (qty 1) (pago tarjeta-cred) (tarjeta santander mastercard))

  ;; Orden 5: Funda Celular con Liverpool VISA
  (orden (producto accesorio "Generic" "Funda Celular") (cliente-id 105) (qty 2) (pago tarjeta-cred) (tarjeta liverpool visa))

  ;; Orden 6: RedmiNote12 con BBVA VISA
  (orden (producto smartphone "Xiaomi" "RedmiNote12") (cliente-id 102) (qty 1) (pago tarjeta-cred) (tarjeta bbva visa))

  ;; Orden 7: HP Pavilion14 con contado
  (orden (producto computadora "HP" "Pavilion14") (cliente-id 101) (qty 1) (pago contado))

  ;; Orden 8: GalaxyWatch con Banamex VISA
  (orden (producto accesorio "Samsung" "GalaxyWatch") (cliente-id 103) (qty 1) (pago tarjeta-cred) (tarjeta banamex visa))

  ;; Orden 9: Galaxy A06 con BBVA VISA
  (orden (producto smartphone "Samsung" "Galaxy A06") (cliente-id 105) (qty 1) (pago tarjeta-cred) (tarjeta bbva visa))
)