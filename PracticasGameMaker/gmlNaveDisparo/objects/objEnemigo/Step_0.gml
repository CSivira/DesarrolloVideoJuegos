//Ciclo de enemigo y destruccion
if (y > room_height + 64) or (vida == 0) {
	/*reaparecer = */instance_create_layer(baseInicial,alturaInicial,"Instances",objEnemigo);
	//reaparecer.speed = choose(0.3,0.4,0.5,0.6);
	//reaparecer.direction = 270;
	
	instance_destroy();
}

//Area de reaccion
vision = collision_circle(x,y - 16,40,objBala,false,false);

//Capacidad de reaccion
if (vision) and (retraso > 8){
	randomize();
	var reaccion = choose(0,1);
	
	if (reaccion == 1){
		if (x < 128) var eleccion = choose(32,64);
		if (x > room_width - 128) var eleccion = choose(-32,-64);
		if !(x < 128) and !(x > room_width - 128) var eleccion = choose(32 ,64,-32,-64);
		
		x += eleccion;
	} 
	vision = false;
	retraso  = 0;
}

retraso += 1;
 