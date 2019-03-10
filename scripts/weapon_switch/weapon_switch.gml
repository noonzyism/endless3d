//switches weapon for the given entity
var holder = argument0;

if (holder.weapon == Weapons.ASSAULT_RIFLE) {
	holder.cooldown = true;
	holder.alarm[0] = 60;
	holder.weapon = Weapons.SNIPER;
}
else {
	holder.cooldown = false;
	holder.alarm[0] = -1;
	holder.weapon = Weapons.ASSAULT_RIFLE;
}
