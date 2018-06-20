//Capacidad de movimiento
var puntoTiro = collision_rectangle(x - 200,y - 150,x + 200,y + 32,objJugador,false,false);
var vision = collision_rectangle(x - 300,y - 150,x + 300,y + 32,objJugador,false,false);

if (instance_exists(objJugador)){
	var distancia = point_distance(x,y,objJugador.x,y);
	velocidad = min(4,distancia);
	if (puntoTiro){
		velocidad = 0;
	}
	if (!vision){
		velocidad = 0;
	}
		move_towards_point(objJugador.x,y,velocidad);
}

//Control de disparo
if (vision) and (puntoTiro) and (rafaga < 1){
	var proyectil = instance_create_layer(x,y - 20,"Instancias",objProyectilEnemigoUno);
	/*if (image_xscale == 1)proyectil.direction = 0;
	if (image_xscale == -1) proyectil.direction = 180;*/
	proyectil.direction = point_direction(x,y,objJugador.x,objJugador.y);
	proyectil.speed = 24;
	proyectil.depth = -2;
	rafaga = 8;
}
rafaga = rafaga -1;

//Sentido de enemigo
var sentido = 0;

if (x > objJugador.x){
	sentido = -1;
}else{
	if (x < objJugador.x){
		sentido = 1;
	}else{
		sentido = sentido;
	}
}

image_xscale = sentido;