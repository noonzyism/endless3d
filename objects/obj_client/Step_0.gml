if (clientId != -1) {
	if ((obj_player.xspeed != sent_xspeed) || (obj_player.yspeed != sent_yspeed)) {
		sent_xspeed = obj_player.xspeed;
		sent_yspeed = obj_player.yspeed;
		netplay_send(session, socket, Packets.OP_MOVE, clientId, sent_xspeed, sent_yspeed);
	}

	if (obj_player.shooting) {
		sent_shooting = obj_player.shooting;
		netplay_send(session, socket, Packets.OP_SHOOT, clientId, obj_player.weapon, sent_shooting, mouse_x, mouse_y);
	}

	if (!obj_player.shooting) && (sent_shooting == true) {
		sent_shooting = obj_player.shooting;
		netplay_send(session, socket, Packets.OP_SHOOT, clientId, obj_player.weapon, sent_shooting, mouse_x, mouse_y);
	}

	curr_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
	if (abs(curr_angle - sent_angle) > 15) {
		sent_angle = curr_angle;
		netplay_send(session, socket, Packets.OP_SHOOT, clientId, obj_player.weapon, obj_player.shooting, mouse_x, mouse_y);
	}

	if (obj_player.weapon != sent_weapon) {
		sent_weapon = obj_player.weapon;
		netplay_send(session, socket, Packets.OP_SHOOT, clientId, sent_weapon, obj_player.shooting, mouse_x, mouse_y);
	}
}