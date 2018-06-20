//Movimiento X
y += vV;

//Colision room
if (y > 1024) vV = -vV;
if (y < 0) vV = -vV;

//Colision horizontal

/*//Cuesta arriba
if (place_meeting(x + sign(vV), y, objBlock)) && (!place_meeting(x + sign(vV), y - 1, objBlock)) 
{
	y -= 12;
}
//Cuesta abajo
if (!place_meeting(x + sign(vH), y, objBlock)) && (!place_meeting(x + sign(vH), y + 1, objBlock)) && (place_meeting(x + sign(vH), y + 2, objBlock))
{
	y += 1;
}*/
//Sin cuesta
if (place_meeting(x, y + vV, objBlock))
{	
	while (!place_meeting(x, y + sign(vV), objBlock))
	{
		y += sign(vV);
	}
	vV = -vV;
}

//Colision Player
if (place_meeting(x, y + sign(vV), objPlayer)) 
{
	instance_destroy();
	instance_destroy(objPlayer);
	game_restart();
}