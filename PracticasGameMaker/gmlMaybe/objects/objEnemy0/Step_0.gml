//Movimiento X
x += vH;

//Colision room
if (x > 10) vH = -vH;
if (x < 2038) vH = -vH;

//Colision horizontal

/*//Cuesta arriba
if (place_meeting(x + sign(vH), y, objBlock)) && (!place_meeting(x + sign(vH), y - 1, objBlock)) 
{
	y -= 12;
}
//Cuesta abajo
if (!place_meeting(x + sign(vH), y, objBlock)) && (!place_meeting(x + sign(vH), y + 1, objBlock)) && (place_meeting(x + sign(vH), y + 2, objBlock))
{
	y += 1;
}*/
//Sin cuesta
if (place_meeting(x + vH, y, objBlock))
{	
	while (!place_meeting(x + sign(vH), y, objBlock))
	{
		x += sign(vH);
	}
	vH = -vH;
}

//Colision Player
if (place_meeting(x + sign(vH), y, objPlayer)) 
{
	instance_destroy();
	instance_destroy(objPlayer);
	game_restart();
}