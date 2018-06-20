//Angulo de imagen
if (movimiento != 0) {
	if (movimiento == 1) {
		image_angle = -10;
		direction = 60;
	}
	if (movimiento == -1){ 
		image_angle = 10;
		direction = 120;
	}
}else{
	image_angle = 0;
	direction = 90;
}
