//Condiciones iniciales
x = room_width / 2;
y = room_height - 32;

if (instance_exists(objNave)) {
	instance_create_layer(x,y,"Instances",objArma);
}

//Constantes
vHMax = 5;
aH = 0.4;
fH = 0.5;

//Variables
vH = 0;
movimiento = 0;
