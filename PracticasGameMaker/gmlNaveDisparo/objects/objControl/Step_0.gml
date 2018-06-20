if (global.naveDestruida) {
	instance_destroy (objArma);
	instance_destroy (objNave);
	room_restart();
}
