//Destruccion de nave
if (place_meeting(x,y,objEnemigo)) {
	global.naveDestruida = true;
}else{
	global.naveDestruida = false;
}

//Pulsaje de teclas
var derecha = keyboard_check(vk_right);
var izquierda = -keyboard_check(vk_left);

//Capacidad de movimiento
movimiento = derecha + izquierda;

if (movimiento != 0){
	vH = min (vHMax, abs(vH) + aH) * movimiento;
}else {
	if (vH > 0){
		vH = max(0, vH - fH);
	}else {
		vH = min(0,vH + fH);
	}
}

//Borde de pantalla
if ((x + vH) < 32) or ((x + vH) > room_width - 32) vH = 0;

//Valores definitivos movimiento
x += vH;
