Proceso Proyect_SimuladorCosto
	
	definir cartera Como Caracter;
	definir i Como entero;
	definir color Como Caracter;
	Definir cantidad Como Entero;
	Definir precio Como Real;
	definir respuesta Como entero;
	definir CUPON_DCTO Como Real;
	Definir descuento como real;
	Definir precio_dcto Como Real;
	Definir Codigo_descuento Como Caracter;
	definir respuesta2 Como entero;
	Definir VALOR_IVA Como Real;
	Definir precioDctoIva Como Real;
	Definir precioSinDctoIva como real;
	Definir CUPON_XCANTIDAD Como real;
	Definir DctoxCantidad Como entero;
	definir DctoxCantidad1 Como Real;
	definir DctoxCantidad2 como real;
	Definir ciudad_envio Como Caracter;
	Definir COSTO_KILO Como Real;
	definir PESOKILOPAQUETE como real;
	definir preciototal_envio Como Real;
	Definir COSTO_ENVIO Como real;
	Definir PRECIOFINAL Como Real;
	
	VALOR_IVA <- 1.12;
	CUPON_XCANTIDAD <- 0.05;
	COSTO_ENVIO <- 10;
	COSTO_KILO <- 2;
	PESOKILOPAQUETE<- 1.5;
	
	Dimension cartera[4]; 
	cartera[0] <- "amarillo";
	cartera[1] <- "rojo"; 
	cartera[2] <- "azul";
	cartera[3] <- "verde";
	
 Repetir
	Limpiar Pantalla;	
	 Escribir "Elija el color de la cartera que desea comprar:";
	
	i<- 0;
	
	Mientras i<4 Hacer
		Escribir cartera[i];
		i<- i+1;
	FinMientras
	
	Escribir "ingrese color:"; 
	leer color;
	
	Escribir "Ingrese la cantidad de productos que desea comprar:";
	Leer cantidad;
	
	Escribir "Ingrese el precio unitario del producto que desea compar:";
	Leer precio;

	// calculo de precio con cupon de descuento
	
	Escribir "Tiene cupon de descuento del 10%? escriba el numero 1 (si) o numero 2 (no): ";
	leer respuesta;
	
	CUPON_DCTO <- 0.10;
	descuento <- precio * CUPON_DCTO;
	
	precio_dcto <- precio-(descuento);
	
	Codigo_descuento <- "dcto10";
	
	Escribir "";
	
	Si (respuesta= 1) Entonces
		Escribir "Ingrese el codigo de descuento:";
		Leer Codigo_descuento;
		
		si (Codigo_descuento = "dcto10") Entonces
			Escribir "El precio neto es de: ", precio;
			Escribir "Descuento de: $" descuento " y un subtotal por unidad a pagar: $" , precio_dcto;
			
		FinSi
		
	sino si (respuesta= 2) Entonces
			Escribir "El precio neto es de: ", precio;
			Escribir "No tiene descuento, el precio se mantiene en: $", precio;
			
		FinSi
		
	FinSi
	
	Escribir "";
	
	// calculo del IVA 
	
	precioDctoIva<- precio_dcto * VALOR_IVA;
	precioSinDctoIva<- precio * VALOR_IVA;
	
	Segun (respuesta) hacer
		1: Escribir "el subtotal con iva es de $",  (precio_dcto * VALOR_IVA); 
			
		2: Escribir "el subtotal con iva es de $",  (precio * VALOR_IVA);
			
	FinSegun
	
	// calculo de descuento por canitdad
	
	Escribir "_______________________________________________________________";
	Escribir "_______________________________________________________________";
	
	
	DctoxCantidad1<- precioDctoIva - (precioDctoIva * CUPON_XCANTIDAD);
	DctoxCantidad2<- precioSinDctoIva - (precioSinDctoIva * CUPON_XCANTIDAD);
	
	Si (respuesta= 1 Y cantidad >= 2) entonces
		Escribir "SORPRESA! descuento extra por tu compra, nuevo subtotal: $" , DctoxCantidad1;
		DctoxCantidad<- 1;
		
	FinSi
	Si (respuesta= 2 Y cantidad >= 2) Entonces
		escribir "SORPRESA! descuento extra por tu compra, nuevo subtotal: $" , DctoxCantidad2;
		DctoxCantidad<- 2;
	SiNo
		si (respuesta= 2 Y cantidad <= 1) Entonces
			escribir "no tiene descuento extra: $ ", precioSinDctoIva; 
			DctoxCantidad<- 3;
			
		FinSi
		
	FinSi
	Escribir "_______________________________________________________________";
	Escribir "_______________________________________________________________";

	
	//Costo de envio por peso y destino
	
	Escribir "Escribe la ciudad de Envio:";
	Leer ciudad_envio; 
	
	preciototal_envio <- COSTO_ENVIO+(COSTO_KILO*(cantidad*PESOKILOPAQUETE));
	
	Escribir "El valor del envio a " , ciudad_envio ," es de: $", preciototal_envio;
	
	//Total final a pagar con descuentos y envio
	
	Segun DctoxCantidad Hacer
		1:Escribir "Precio final a pagar: $", preciototal_envio+(DctoxCantidad1*cantidad);
			
		2:Escribir "Precio final a pagar: $", preciototal_envio+(DctoxCantidad2*cantidad);
			
		3:Escribir "Precio final a pagar: $", preciototal_envio+(precioSinDctoIva*cantidad);
			
	FinSegun
	
	Escribir "";
	
	//RESUMEN DE COMPRA
	Escribir "Descuento e impuestos";
	Escribir "";
	
	
	//Salida de bucle
	
	Escribir "Desea comprar otro producto? escriba el numero 1 (Si) o numero 2 (no):";
	leer respuesta2;
	
Hasta Que (respuesta2 <> 1)

  Escribir "Gracias por preferirnos";

	
FinProceso
