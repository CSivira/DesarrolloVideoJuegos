///Control de movimiento

//Pulsaje de teclas
tI = -keyboard_check(ord("A"));
tD = keyboard_check(ord("D"));
tS = keyboard_check_pressed(ord("W"));
tB = keyboard_check(vk_enter);

//Gravedad
if (vV < 20) and (!place_meeting(x, y + 1, objBlock)) vV += gravedad;

//Salto
if (place_meeting(x, y + 1, objBlock)) and (tS) vV -= vS;

//Colision vertical
if (place_meeting(x, y + vV, objBlock))
{
	while (!place_meeting(x, y + sign(vV), objBlock))
	{
		y += sign(vV);
	}
	vV = 0;
}

//Direccion y cantidad de movimiento horizontal
vH = tI + tD;
vH *= mov;

//Colision horizontal

//Cuesta arriba
if (place_meeting(x + sign(vH), y, objBlock)) && (!place_meeting(x + sign(vH), y - 1, objBlock)) 
{
	if (image_angle > 45) image_angle = 45;
	y -= 12;
}
//Cuesta abajo
if (!place_meeting(x + sign(vH), y, objBlock)) && (!place_meeting(x + sign(vH), y + 1, objBlock)) && (place_meeting(x + sign(vH), y + 2, objBlock))
{
	if (image_angle < -45) image_angle = -45;
	y += 1;
}
//Sin cuesta
if (place_meeting(x + vH, y, objBlock))
{	
	while (!place_meeting(x + sign(vH), y, objBlock))
	{
		x += sign(vH);
	}
	vH = 0;
} 

//Movimiento vertical
y += vV;

//Movimiento horizontal
x += vH;

//Cambio de mapa

if (place_meeting(x, y, objDoor)) room_goto(1);


