/// example_increment_client_handler(session, socket, ip, port, packet_id, values);

var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _id			= _values[0];
var _hp			= _values[1];
var _x			= _values[2];
var _y			= _values[3];
var _xspeed		= _values[4];
var _yspeed		= _values[5];
var _weapon		= _values[6];
var _shooting	= _values[7];
var _aimx		= _values[8];
var _aimy		= _values[9];

//setting the position from server unconditionally causes the player to stutter a bit since the received position is a couple ms outdated
//as a workaround, for now we'll just ignore the server's correction if we're only slightly off

//self state
if (_id == obj_client.clientId) {
	show_debug_message("Client received host sync: client position [" + string(_x) + ", " + string(_y) + "]");
	if abs(obj_player.x - _x) > (obj_player.velocity * 2) + 1 {
		obj_player.x = _x;
	}

	if abs(obj_player.y - _y) > (obj_player.velocity * 2) + 1 {
		obj_player.y = _y;
	}
	
	//hp is fully dictated by server, any local calculation (no matter how "close" it is) gets overwritten by this
	obj_player.hp = _hp;
}
//server state
//some potential consolidation of code is possible here - these logic blocks for both host and peer IDs effectively do the same exact thing (update some peer instance)
else if (_id == 0) {
	show_debug_message("Client received host sync: host position [" + string(_x) + ", " + string(_y) + "]");
	
	//create an instance of this peer if it hasn't already been done
	if (obj_client.peers[0] == -1) {
		obj_client.peers[0] = instance_create_depth(_x, _y, 100, obj_peer);
	}
	
	if abs(obj_client.peers[0].x - _x) > (obj_player.velocity * 2) + 1 {
		obj_client.peers[0].x = _x;
	}

	if abs(obj_client.peers[0].y - _y) > (obj_player.velocity * 2) + 1 {
		obj_client.peers[0].y = _y;
	}
	
	obj_client.peers[0].xspeed = _xspeed;
	obj_client.peers[0].yspeed = _yspeed;
	
	obj_client.peers[0].image_angle = point_direction(_x, _y, _aimx, _aimy);
	
	obj_client.peers[0].aimx = _aimx;
	obj_client.peers[0].aimy = _aimy;
	
	if (obj_client.peers[0].weapon != _weapon) {
		weapon_switch(obj_client.peers[0]);
	}
	obj_client.peers[0].shooting = _shooting;
	
	obj_client.peers[0].hp = _hp;
}
else { //other peer
	//create an instance of this peer if it hasn't already been done
	if (obj_client.peers[_id] == -1) {
		obj_client.peers[_id] = instance_create_depth(_x, _y, 100, obj_peer);
	}
	
	var peer = obj_client.peers[_id];
	
	peer.x = _x;
	peer.y = _y;
	
	peer.xspeed = _xspeed;
	peer.yspeed = _yspeed;
	peer.image_angle = point_direction(_x, _y, _aimx, _aimy);
	
	peer.aimx = _aimx;
	peer.aimy = _aimy;
	
	
	if (peer.weapon != _weapon) {
		weapon_switch(peer);
	}
	peer.shooting = _shooting;
	peer.hp = _hp;
}

