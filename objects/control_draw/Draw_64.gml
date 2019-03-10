draw_set_color(c_white);

draw_text(32, 64, "Weapon: " + string(obj_player.weapon == 0 ? "Assault Rifle" : "Sniper"));

draw_text(32, 96, "Cooldown: " + string(obj_player.alarm[0] == -1 ? "None" : obj_player.alarm[0]));

draw_text(32, 128, "Move with [W,A,S,D] / Switch weapon with [Q]");