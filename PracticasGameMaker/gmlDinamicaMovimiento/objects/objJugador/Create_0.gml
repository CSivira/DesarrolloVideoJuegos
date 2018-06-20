//Variables numericas
vH = 0;
vV = 0;
aH = 0;
fH = 0;
potencia = 0;
rebote = 0;
reboteC = 0;
contador = 0;

//Variables booleanas
dobleSalto = true;
agarre = false;

//Valores predefinidos
gravedad = 2;
vHMax = 12;
aS = 2;
fS = 1.75;
aA = 0.25;
fA = 0.15;

instance_create_layer(x,y,"Instances",objArma);

//Juego sin cuestas hasta aprender como usarlas.