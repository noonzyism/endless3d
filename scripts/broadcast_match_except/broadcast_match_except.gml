//sends a sync message about the given client to all clients except the one on the given socket
var _session		= argument0,
	_cid			= argument1,
	_excludeSocket	= argument2;
	
var i = 1;

var peer = obj_server.clients[_cid, 0];

while (obj_server.clients[i, 0] != -1) {
	if (obj_server.clients[i, 2] != _excludeSocket) {
		netplay_send(_session, obj_server.clients[i, 2], Packets.MATCH, _cid, peer.username, peer.team, peer.matchscore, peer.kills, peer.deaths, peer.objhold);
	}
	i++;
}