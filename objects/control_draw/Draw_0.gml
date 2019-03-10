draw_text(obj_player.x-32, obj_player.y-36, obj_player.username + ": " + string(obj_player.hp));

if (instance_exists(obj_peer)) {
	draw_text(obj_peer.x-32, obj_peer.y-36, "HP: " + string(obj_peer.hp));
}