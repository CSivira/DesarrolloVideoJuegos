//Posicion respecto a nave
x = lengthdir_x(15,objNave.direction) + objNave.x;
y = objNave.y - 16;

//Deteccion de disparo
var disparo = keyboard_check(vk_space);

//Creacion de disparo
if (disparo) and (retraso > 10){
	bala = instance_create_layer(x,y,"Instances",objBala);
	bala.speed = 20;
	bala.direction = 90;
	retraso = 0; 
}

retraso += 1;