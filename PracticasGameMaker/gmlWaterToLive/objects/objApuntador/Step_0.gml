//Posicion de apuntador
x = mouse_x;
y = mouse_y;

//Aciones con botones
botonIzquierdo = mouse_check_button_pressed(mb_left);
botonDerecho = mouse_check_button_pressed(mb_right);
botonCentro = mouse_check_button_pressed(mb_middle);

//Creacion de objSeleccion
apuntador = collision_point(x,y,objBase,false,false);

if (!mouse_check_button(mb_left)){
	posX = x;
	posY = y;
	seleccion = collision_rectangle(x,y,posX,posY,objBase,false,false);
}

if (botonIzquierdo) and (apuntador){
	if (instance_exists(objSeleccion)) or (instance_exists(objCargar)){
		instance_destroy(objSeleccion);
		instance_destroy(objCargar);
		instance_create_layer(apuntador.x,apuntador.y,"Juego",objSeleccion);
	}else{
		instance_create_layer(apuntador.x,apuntador.y,"Juego",objSeleccion);
	}
}

if (botonCentro) and (apuntador){
	if (instance_exists(objCargar)) or (instance_exists(objSeleccion)){
		instance_destroy(objCargar);
		instance_destroy(objSeleccion);
		instance_create_layer(apuntador.x,apuntador.y,"Juego",objCargar);
	}else{
		instance_create_layer(apuntador.x,apuntador.y,"Juego",objCargar);
	}
}

if (botonDerecho){
	instance_destroy(objSeleccion);
	instance_destroy(objCargar);
}