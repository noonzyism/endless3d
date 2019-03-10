//sends a sync message about the server to all clients
//only the server should call this function

var _session	= argument0;
	
var i = 1;

show_debug_message("About to send clients host state update...");

while (obj_server.clients[i, 0] != -1) {
	show_debug_message("Sending clients host state update: sending to socket=" + string(obj_server.clients[i, 2]) + " for client " + string(i) + "...");
	netplay_send(_session, obj_server.clients[i, 2], Packets.SYNC, 0, obj_player.hp, obj_player.x, obj_player.y, obj_player.xspeed, obj_player.yspeed, obj_player.weapon, obj_player.shooting, mouse_x, mouse_y);
	i++;
}