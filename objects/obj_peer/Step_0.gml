x += xspeed;
y += yspeed;

if (shooting) {
	//right now, we just calc from the player origin to an arbitrarily far away point along the line
	//we could change this to get the point along the line that intersects with the view boundary
	
	weapon_fire(self, par_player, aimx, aimy);
}

//for now...
if (hp < 1) {
	x = 128;
	y = 128;
	hp = 100;	
}