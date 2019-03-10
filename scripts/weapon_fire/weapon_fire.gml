//handles weapon firing logic and hit detection

var shooter = argument0;
var target	= argument1;
var aimx	= argument2;
var aimy	= argument3;

var xslope = aimx - shooter.x;
var yslope = aimy - shooter.y;

//right now, we just calc from the player origin to an arbitrarily far away point along the line
//one could change this to get the point along the line that intersects with the view boundary

if (shooter.weapon == Weapons.ASSAULT_RIFLE) {
	if (shooter.cooldown == false) {
		var hit = collision_line_first(shooter.x, shooter.y, aimx + (10 * xslope), aimy + (10 * yslope), target, false, true);
		if (hit != noone) {
			var obstruction = find_obstruction(shooter.x, shooter.y, hit.x, hit.y, 1);
			if (obstruction == undefined) {
				hit.hp -= 1;
			}
		}
	}
}

if (shooter.weapon == Weapons.SNIPER) {
	if (shooter.cooldown == false) {
		var hit = collision_line_first(shooter.x, shooter.y, aimx + (10 * xslope), aimy + (10 * yslope), target, false, true);
		shooter.cooldown = true;
		shooter.alarm[0] = 60;
		if (hit != noone) {
			var obstruction = find_obstruction(shooter.x, shooter.y, hit.x, hit.y, 1);
			if (obstruction == undefined) {
				hit.hp -= 50;
			}
		}
	}
}
	