//Verificadores de eventos
var suelo = place_meeting(x,y + 1,objBloque);
var izquierda = -keyboard_check(vk_left);
var derecha = keyboard_check(vk_right);
var salto = keyboard_check_pressed(vk_up);
var dejarSalto = keyboard_check_released(vk_up);
var agacharse = keyboard_check(vk_down);
var cornisa = place_meeting(x + 1,y,objCornisa) or place_meeting(x - 1,y,objCornisa);

//Control de movimiento----------------------------------------------------------------------------------------------
	//Movimiento horizontal con aceleracion y friccion
	
		//aceleracion y friccion variable
		if (suelo){
			aH = aS;
			fH = fS;
		}else{
			aH = aA;
			fH = fA;
		}
		
	var avanza = (derecha + izquierda);
		
		//Escala horizontal de jugador
		if (avanza != 0) {
			image_xscale = avanza;
		}
		
	if (avanza != 0){
		vH = min(abs(vH) + aH, vHMax) * avanza;
	}else{
		if (vH > 0){
			vH = max(vH - fH, 0);
		}else{
			vH = min(vH + fH, 0);
		}
	}

	//Movimiento vertical con acelerecion
	if (!suelo) and (vV < 30) vV += 2; 
	
	//Movimiento salto
	if (suelo) and (salto) vV -= gravedad * 13;
	
		//Salto variable
		if (dejarSalto) vV *= 0.5;
		
		//Doble salto
		if(salto) and (!suelo){
			//Salto de pared
			if (place_meeting(x + 1,y,objBloque)) or (place_meeting(x - 1,y,objBloque)) or (cornisa){
				vV -= (gravedad * 15);
				vH = rebote;
				dobleSalto = true;
				rebote = 0;
			}else{
				//Doble salto
				if (dobleSalto > 0){
					vV -= (gravedad * 13) + potencia;
					dobleSalto = false;
				}
			}
		}
			//Potencia del doblesalto
			if (vV > 0){
				if(potencia < 30){
					potencia += gravedad;
				}
			}else{
				potencia = 0;
			}
			
			//Reactivacion de doblesalto
			if (suelo) {
				dobleSalto = true;
				rebote = 0;
			}
				
		//Aceleracion y friccion vertical en rose con pared
		if (!suelo) and (vV > 0) {
			if (place_meeting(x + 1,y,objBloque)) or (place_meeting(x - 1,y,objBloque)){
				//Rebote en pared
				if (avanza != 0) { 
					if(abs(rebote) < 30) {
						if (avanza == 1) and (!place_meeting(x + 1,y,objBloque)) rebote += 1;
						if (avanza == -1) and (!place_meeting(x - 1,y,objBloque)) rebote -= 1;
					}	
				}else{
					rebote = 0;
				}	
					
				//Roce con pared
				if (avanza != 0){
					vV /= 2;
					vH = 0;
					dobleSalto = false;
				}
				
				//Limite de rebote para soltar pared
				if (abs(rebote) > 29) {
					if (place_meeting(x + 1,y,objBloque)) x -= 1;
					if (place_meeting(x - 1,y,objBloque)) x += 1;
					agarre = 0;
					rebote = 0;
				}
			}
		}
			
		//Movimiento cornisa	
			//Sujetar cornisa
			if (cornisa) {
				contador = contador + 1;
			}else{
				contador = 0;
			}
			
			if (contador == 1){
				if (avanza != 0) {
					agarre = true;
				}
			}
			
			if (agarre) {
				y = objCornisa.y + 64;
				vV = 0;
			}
			
			//Salto cornisa y ascenso
			if (agarre) {
				if (avanza != 0) { 
					if(abs(reboteC) < 30) {
						if (avanza == 1) and (!place_meeting(x + 1,y,objCornisa)) reboteC += 1;
						if (avanza == -1) and (!place_meeting(x - 1,y,objCornisa)) reboteC -= 1;
					}
				}
				
				if (salto) {	
				
					if (avanza == 1) and (place_meeting(x + 1,y,objCornisa)) {
						y -= 128;
						x += 64;
					}else {
						if (avanza == -1) and (place_meeting(x - 1,y,objCornisa)) {
							y -= 128;
							x -= 64;
						}else {
							vV -= 30;
							vH = reboteC;
							reboteC = 0;
						}
					}	
					agarre = 0;
				}
				
				//Limite de reboteC antes de caer
				if (abs(reboteC) > 29)  {
					if (place_meeting(x + 1,y,objCornisa)) x -= 1;
					if (place_meeting(x - 1,y,objCornisa)) x += 1;
					agarre = 0;
					reboteC = 0;
				}
			}	
			
			//Agacharse y bajar de cornisa
			if (agacharse) {
				if (cornisa) {	
					agarre = false;
				
					if (place_meeting(x + 1,y,objCornisa)) x -= 1;
					if (place_meeting(x - 1,y,objCornisa)) x += 1;
				}
				
				if (suelo) sprite_index = sprJugadorAgachado;
				
			}else{
				if (!place_meeting(x,y - 32,objBloque)) sprite_index = sprJugador;
			}
			
//Control de colisiones----------------------------------------------------------------------------------------------
	//Colision horizontal
		//Cuesta arriba
		/*if (place_meeting(x + sign(vH),y,objBloque)) and (!instance_place(x + sign(vH), y - 1, objBloque)){
			y -= abs(vH); 
		}
		
		if (place_meeting(x + sign(vH),y,objBloque)) and (instance_place(x + sign(vH), y - 1, objBloque))and (!instance_place(x + sign(vH), y - 2, objBloque)){
			y -= abs(vH) + 2;
		}
		
		//Cuesta abajo
		if (!place_meeting(x + sign(vH),y,objBloque)) and (!instance_place(x + sign(vH), y - 1, objBloque)) and (instance_place(x + sign(vH), y - 2, objBloque)){
			y += abs(vH);
		}*/
		
		//Sin cuesta
		if(place_meeting(x + vH,y,objBloque)){
			while(!place_meeting(x + sign(vH),y,objBloque)){
				x += sign(vH);
			}
			vH = 0;
		}
	
	//ColisionVertical
	if (place_meeting(x,y + vV,objBloque)){
		while(!place_meeting(x,y + sign(vV),objBloque)){
			y += sign(vV);
		}
		vV = 0;
	}

//Valores finales de posicion---------------------------------------------------------------------------------------
x += vH;
y += clamp(vV,-31,31);

//show_debug_message(string(vH));