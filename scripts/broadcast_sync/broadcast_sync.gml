//sends a sync message about the given client to all clients
var _session	= argument0,
	_cid		= argument1;
	
var i = 1;

var peer = obj_server.clients[_cid, 0];

while (obj_server.clients[i, 0] != -1) {
	netplay_send(_session, obj_server.clients[i, 2], Packets.SYNC, _cid, peer.hp, peer.x, peer.y, peer.xspeed, peer.yspeed, peer.weapon, peer.shooting, peer.aimx, peer.aimy);
	i++;
}