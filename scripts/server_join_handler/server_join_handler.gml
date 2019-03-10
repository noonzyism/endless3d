
var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _username = _values[0];

//var client_id = add_client(string(_username), _socket);

var i = 1;

while (obj_server.clients[i, 0] != -1) {
	i++;
}

obj_server.clients[i, 0] = instance_create_depth(100, 100, 100, obj_peer);
obj_server.clients[i, 1] = _username;
obj_server.clients[i, 2] = _socket;

show_debug_message("Created client [" + string(obj_server.clients[i, 0]) + ", " + string(obj_server.clients[i, 1]) + ", " + string(obj_server.clients[i, 2]) + "]");

var client_id = i;

show_debug_message("Server received join request: [" + string(obj_server.clients[client_id, 1]) + ", " + string(client_id) + "]");

//set and send out match info for this client to all clients
client_instance = obj_server.clients[i, 0];
client_instance.team = (client_id % 2); //for now this is just a way to alternate which team clients get assigned to
if (client_instance.team == 1) {
	client_instance.sprite_index = spr_blueguy;
}
else {
	client_instance.sprite_index = spr_redguy;
}
client_instance.username = _username;

netplay_send(_session, _socket, Packets.ACCEPT, client_id, client_instance.team);

//tell all other clients about the newly connected client match info
broadcast_match_except(_session, client_id, _socket);

//tell newly connected client about all clients match info
flood_match_except(_session, _socket, client_id);

//tell newly connected client about host's match info
netplay_send(_session, _socket, Packets.MATCH, 0, obj_player.username, obj_player.team, obj_player.matchscore, obj_player.kills, obj_player.deaths, obj_player.objhold);