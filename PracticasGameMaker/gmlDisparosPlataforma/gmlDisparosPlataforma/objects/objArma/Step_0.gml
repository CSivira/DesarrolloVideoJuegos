//Posicion respecto a jugador
x = objJugador.x;
y = objJugador.y - 32;
image_xscale = objJugador.image_xscale;
//Pulsaje de teclas
var teclaDisparo = keyboard_check(vk_up);

//Creacion de proyectil
if (teclaDisparo) and (rafaga < 1){
	var proyectil = instance_create_layer(x,y,"Instancias",objProyectil);
	if (image_xscale == 1)proyectil.direction = 0;
	if (image_xscale == -1) proyectil.direction = 180;
	proyectil.speed = 24;
	proyectil.depth = -2;
	rafaga = 5;
}
rafaga = rafaga -1;