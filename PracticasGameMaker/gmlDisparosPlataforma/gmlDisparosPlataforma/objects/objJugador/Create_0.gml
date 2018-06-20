//Valores iniciales
x = room_width / 2;
y = room_height / 2;

//Variables numericas
velocidadHorizontal = 0;
velocidadVertical = 0;
gravedad = 2;
dobleSalto = 1;
potencia = 0;

//Eventos iniciales
if (instance_exists(objJugador)) {
	instance_create_layer(x,y,"Instancias",objArma)
}