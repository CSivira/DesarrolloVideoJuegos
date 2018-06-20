//Eventos de arma
var disparo = keyboard_check(vk_space);
var derecha = keyboard_check(vk_right);
var izquierda = -keyboard_check(vk_left);

//Posicion de arma respecto a jugador
x = (objJugador.x + 15 * (sign(objJugador.image_xscale))) + objJugador.vH;
y = (objJugador.y - 80) + objJugador.vV;

//Escala horizontal de arma
mirilla = derecha + izquierda;

if (mirilla != 0){
	image_xscale = mirilla;
}

//Disparo
if (disparo) and (cont > 8){
cont = 0;
	bala = instance_create_layer(x,y,"Instances",objBala);
	bala.speed = 30;

		if (mirilla == 1) {
			bala.direction = 0;
		}else {
			if (mirilla == -1) {
				bala.direction = 180;
			}else {
				bala.direction = bala.direction;
			}		
		}

	//bala.image_xscale = image_xscale;
	//show_debug_message(string(objJugador.image_xscale));
}
 cont += 1;
