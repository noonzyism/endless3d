
var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _id		= _values[0];
var _team	= _values[1];

obj_client.clientId = _id;
obj_player.team = _team;
if (obj_player.team == 1) {
	obj_player.sprite_index = spr_blueguy;
}
else {
	obj_player.sprite_index = spr_redguy;
}

show_debug_message("Client received id and team from server: client #" + string(obj_client.clientId) + " (team " + string(obj_player.team) + ")");