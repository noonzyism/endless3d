//floods a specific client with match info about all clients - useful for when a client first joins the match
var _session	= argument0,
	_socket		= argument1,
	_excludeCID = argument2;
	
var cid = 1;

while (obj_server.clients[cid, 0] != -1) {
	if (cid != _excludeCID) {
		var peer = obj_server.clients[cid, 0];
		show_debug_message("Server flooding client on socket " + string(_socket) + ": match info for " + string(cid) + ": " + peer.username + ", team=" + string(peer.team) + ", score=" + string(peer.matchscore) + ", kills=" + string(peer.kills) + ", deaths=" + string(peer.deaths) + ", objhold=" + string(peer.objhold));
		netplay_send(_session, _socket, Packets.MATCH, cid, peer.username, peer.team, peer.matchscore, peer.kills, peer.deaths, peer.objhold);
	}
	cid++;
}