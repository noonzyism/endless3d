

//send server state to clients
if ((obj_player.xspeed != sent_xspeed) || (obj_player.yspeed != sent_yspeed)) {
	sent_xspeed = obj_player.xspeed;
	sent_yspeed = obj_player.yspeed;
	//netplay_send(session, clientSocket, Packets.SYNC, 0, obj_player.hp, obj_player.x, obj_player.y, sent_xspeed, sent_yspeed, obj_player.shooting, mouse_x, mouse_y);
	broadcast_server_sync(session);
}

//we send continuous syncs while shooting to keep track of aim...
if (obj_player.shooting) {
	sent_shooting = obj_player.shooting;
	broadcast_server_sync(session);
}
//...and send one more to notify when we're done shooting
if (!obj_player.shooting) && (sent_shooting == true) {
	sent_shooting = obj_player.shooting;
	broadcast_server_sync(session);
}
	
if (obj_player.hp != sent_hp) {
	sent_hp = obj_player.hp;
	broadcast_server_sync(session);
}
	
curr_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
if (abs(curr_angle - sent_angle) > 15) {
	sent_angle = curr_angle;
	broadcast_server_sync(session);
}