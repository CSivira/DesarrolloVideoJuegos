//Definicion de sentido
if (instance_exists(objSeleccion)){
	if (x > objSeleccion.x){
		sentido = -1;
	}else{
		if ((x < objSeleccion.x)){
			sentido = 1;
		}
	}
}

//Definicion de alcance
if (instance_exists(objSeleccion)){
	if (y - 192 < objSeleccion.y) and (y + 192 > objSeleccion.y){
		alcanzable = true;
	}else{
		alcanzable = false;
	}
}

//Capacidad de movimiento Horizontal
if (instance_exists(objSeleccion)) and (alcanzable){
	distancia = point_distance(x,y,objSeleccion.x,y);
	velocidadHorizontal = min(6,distancia);
	objetivoX = objSeleccion.x;
}else{
	//Capacidad de carga
	if (instance_exists(objCargar))and (alcanzable){
		distancia = point_distance(x,y,objCargar.x,y);
		velocidadHorizontal = min(6,distancia);		objetivoX = objCargar.x;
	}else{
		velocidadHorizontal = 0;
		objetivoX = x;
	}
}

//Definicion de gravedad
if (!colisionVertical) and (velocidadVertical < 20){
	velocidadVertical += gravedad;
}

//Capacidad de escalar
if (colisionVertical){
	posicion = y;
}

if (place_meeting(x + (32 * sentido),posicion - 160,objBase)){
	escalable = false;
}else{
	escalable = true;
}


//Definicion de colisiones

	//Colision vertical
	colisionVertical = place_meeting(x,y + velocidadVertical,objBase);
	
	if (colisionVertical){
		while(!place_meeting(x,y + 1,objBase)){
			y += 1;
		}
		velocidadVertical = 0;
	}
	
	//Colision horizontal
	colisionHorizontal = place_meeting(x + (velocidadHorizontal * sentido),y,objBase)
	
	if (colisionHorizontal){
		while(!place_meeting(x + sentido,y,objBase)){
			x += sentido;
		}
		velocidadHorizontal = 0;
		
		if (escalable){
			velocidadVertical = 0;
			y -= 3;
		}
	}


//Movimiento vertical
y += velocidadVertical;

//Movimiento horizontal
move_towards_point(objetivoX,y,velocidadHorizontal);