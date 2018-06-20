//Pulsaje de teclas
var teclaIzquierda = -keyboard_check(ord("A"));
var teclaDerecha = keyboard_check(ord("D"));
var teclaSalto = keyboard_check_pressed(ord("W"));
var teclaDejarSalto = keyboard_check_released(ord("W"));
var teclaCubierta = keyboard_check(ord("S"));

//Control de movimiento
	//Movimiento horizontal
	velocidadHorizontal = (teclaIzquierda + teclaDerecha) * 10;
	//Movimiento vertical
		//Definicion de gravedad
		if (!place_meeting(x,y + 1,objBloque)) and (velocidadVertical < 30){
			velocidadVertical += gravedad;
		}else{
			if (dobleSalto == 0) {
				dobleSalto++;
			}
		}
		//Definicion de salto
		if (teclaSalto) and (place_meeting(x,y + 1,objBloque)){
			velocidadVertical -= 30;
		}
		
		//Doble salto
		if (teclaSalto) and (!place_meeting(x,y + 1,objBloque)) and (dobleSalto > 0){
			velocidadVertical -= (30 + potencia) * 0.9;
			dobleSalto--;
		}
		
		if (velocidadVertical > 0){
			if (potencia < 30){
				potencia += gravedad;
			}
		}else {
			potencia = 0;
		}
		
		//Variacion del salto por tiempo de pulsaje
		if (teclaDejarSalto){
			if (velocidadVertical < 0){
				velocidadVertical *= 0.5;
			}
		}
		
//Deteccion de colisiones
	//Colision horizontal
	if (place_meeting(x + velocidadHorizontal,y,objBloque)){
		//Colision Rampa subida
		if (place_meeting(x + sign(velocidadHorizontal),y,objBloque)) and (!place_meeting(x + sign(velocidadHorizontal),y - 1,objBloque)){
			velocidadVertical -= 5;
		}
		
		if (place_meeting(x + sign(velocidadHorizontal),y,objBloque)) and (place_meeting(x + sign(velocidadHorizontal),y - 1,objBloque)) and (!place_meeting(x + sign(velocidadHorizontal),y - 2,objBloque)){
			velocidadVertical -= 5;
		}
		
		//ColisionRampa bajada
		if (!place_meeting(x + sign(velocidadHorizontal),y,objBloque)) and (!place_meeting(x + sign(velocidadHorizontal),y + 1,objBloque)) and (place_meeting(x + sign(velocidadHorizontal),y + 2,objBloque)){
			velocidadVertical += 5;
		}
		
		//Colision sin cuesta
		while (!place_meeting(x + sign(velocidadHorizontal),y,objBloque)){
			x += sign(velocidadHorizontal);
		}
		velocidadHorizontal = 0;
	}
	
	//Colision vertical
	if (place_meeting(x,y + velocidadVertical,objBloque)){
		while (!place_meeting(x,y + sign(velocidadVertical),objBloque)){
			y += sign(velocidadVertical);
		}
		velocidadVertical = 0;
	}
	
	//Colision horizontal enemigo
	if (place_meeting(x + velocidadHorizontal,y,objEnemigoUno)){
		while (!place_meeting(x + sign(velocidadHorizontal),y,objEnemigoUno)){
			x += sign(velocidadHorizontal);
		}
		velocidadHorizontal = 0;
	}
	//Colision vertical enemigo
	if (place_meeting(x,y + velocidadVertical,objEnemigoUno)){
		while (!place_meeting(x,y + sign(velocidadVertical),objEnemigoUno)){
			y += sign(velocidadVertical);
		}
		velocidadVertical = 0;
	}
		
//Valores de coordenadas por step
x += velocidadHorizontal;
y += velocidadVertical;

if (sign(velocidadHorizontal) != 0){
	image_xscale = sign(velocidadHorizontal);
}