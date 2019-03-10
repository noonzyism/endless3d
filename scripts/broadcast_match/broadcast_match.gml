//sends a sync message about the given client to all clients
var _session	= argument0,
	_cid		= argument1;
	
var i = 1;

var peer = obj_server.clients[_cid, 0];

while (obj_server.clients[i, 0] != -1) {
	netplay_send(_session, obj_server.clients[i, 2], Packets.MATCH, _cid, peer.username, peer.team, peer.matchscore, peer.kills, peer.deaths, peer.objhold);
	i++;
}