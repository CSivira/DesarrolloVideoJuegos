//Asignacion de variables
teclaDerecha = keyboard_check(vk_right);
teclaIzquierda = -keyboard_check(vk_left);
movimiento = (teclaDerecha) + (teclaIzquierda);
velocidad = movimiento * desplazamiento;

//Aceleracion y frenado
teclaAceleracion = keyboard_check(vk_up);
teclaFrenado = keyboard_check(vk_down);

if (teclaAceleracion) and (y > 256) y -= 6;
if (teclaFrenado) and (y < room_height / 1.2) y += 5;
if (y < room_height / 1.2) and (!teclaAceleracion) y += 3;

//Movimiento horizontal 
x += velocidad;
